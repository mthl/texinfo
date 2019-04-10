#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "websocketclientwrapper.h"
#include "websockettransport.h"

#include <stdlib.h>

#include <QWebEngineView>
#include <QWebSocketServer>
#include <QMessageBox>
#include <QWebEngineScript>
#include <QWebEngineScriptCollection>
#include <QFile>
#include <QtDebug>
#include <QWebChannel>
#include <QWebEngineProfile>
#include <QCoreApplication>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(ui->actionQuit, &QAction::triggered, this, &MainWindow::quit);
    connect(qApp, &QApplication::focusChanged, this, &MainWindow::focusChanged);

    this->datadir = getenv ("QTINFO_DATADIR");
    if (!this->datadir)
      QCoreApplication::quit();

    setup_channel ();
    core->hide_prompt();

    auto *profile = new QWebEngineProfile(this);
    setup_profile(profile);
    auto *page = new QWebEnginePage(profile, this);

    ui->webEngineView->setPage(page);

    connect(ui->webEngineView->page(), &QWebEnginePage::loadFinished,
            this, &MainWindow::inject_qwebchannel);

    ui->webEngineView->page()->load(QUrl(QString("file:") + this->datadir +
                                    "/test/hello/index.html"));
}

/* Initialize "core" object. */
void
MainWindow::setup_channel()
{
    auto *server = new QWebSocketServer
               (QStringLiteral("QWebChannel Standalone Server"),
                QWebSocketServer::NonSecureMode,
                this);

    // we shouldn't hardcode a number here.  what if the program is run twice 
    // at the same time?
    // can use 0 to pick a port

    if (!server->listen(QHostAddress::LocalHost, 12345)) {
        qFatal("Failed to open web socket server.");
    }

    auto *clientWrapper = new WebSocketClientWrapper(server, this);


    auto *channel = new QWebChannel(this);
    QObject::connect(clientWrapper, &WebSocketClientWrapper::clientConnected,
                         channel, &QWebChannel::connectTo);

    this->core = new Core(ui, this);
    channel->registerObject(QStringLiteral("core"), core);
}

/* Load info.js and qwebchannel.js into the current page. */
void
MainWindow::inject_qwebchannel(bool finished_ok)
{
    if (!finished_ok || ui->webEngineView->url() == QUrl("about:blank"))
      return;

    qDebug() << "injecting into page" << ui->webEngineView->url();

#define QWEBCHANNEL_JS "qwebchannel.js"

    if (qwebchannel_js.isNull()) {
        QFile file;
        file.setFileName (QString(this->datadir)
                          + "/docbrowser/" + QWEBCHANNEL_JS);
        file.open(QIODevice::ReadOnly);
        QByteArray b = file.readAll();
        qwebchannel_js = QString(b);
    }

    auto *page = ui->webEngineView->page();

    /* Run the code, and only after that has finished, run the init
       function.  Qt uses an asynchronous callback system for this.  Check if 
       wc_init is defined because this slot is activated even for "about:blank",
       the default page. */
    page->runJavaScript (qwebchannel_js, [this, page](const QVariant&) {
      page->runJavaScript(
                  "if (typeof wc_init == 'function') { wc_init(); }",
                   0 );
      });
}

void
MainWindow::setup_profile(QWebEngineProfile *profile)
{
    /* First load the data from disk */

#define INFO_JS "info.js"

    if (info_js.isNull()) {
        QFile file;
        file.setFileName (QString(this->datadir)
                          + "/" INFO_JS);
        file.open(QIODevice::ReadOnly);
        QByteArray b = file.readAll();
        info_js = QString(b);
    }

#define MODERNIZR_JS "modernizr.js"

    if (modernizr_js.isNull()) {
        QFile file;
        file.setFileName (QString(this->datadir)
                      + "/" MODERNIZR_JS);
        file.open(QIODevice::ReadOnly);
        QByteArray b = file.readAll();
        modernizr_js = QString(b);
    }

#define INFO_CSS "info.css"

    if (info_css.isNull()) {
        QFile file;
        file.setFileName (QString(this->datadir)
                      + "/" INFO_CSS);
        file.open(QIODevice::ReadOnly);
        QByteArray b = file.readAll();
        info_css = QString(b);
    }

    /* Set up JavaScript to load info.css.  This relies on there being no 
       single quotes or backslashes in info.css.  The simplified() call
       is needed to fit the CSS in a single line of JavaScript. */
    QString insert_css = QString::fromLatin1("(function () {"
      "var css = document.createElement('style');\n"
      "css.type = 'text/css';\n"
      "css.innerText = '%1';\n"
      "document.head.appendChild(css);\n"
    "})()").arg(info_css.simplified());

    /* This needs to run after the <head> element is accessible, but before
       the DOMContentLoaded event handlers in info.js fire. */
    QWebEngineScript s;
    s.setSourceCode(insert_css);
    s.setInjectionPoint(QWebEngineScript::DocumentReady);
    s.setWorldId(QWebEngineScript::MainWorld);
    profile->scripts()->insert(s);

    QWebEngineScript s2;
    s2.setSourceCode(modernizr_js);
    s2.setInjectionPoint(QWebEngineScript::DocumentCreation);
    s2.setWorldId(QWebEngineScript::MainWorld);
    profile->scripts()->insert(s2);

    QWebEngineScript s3;
    s3.setSourceCode(info_js);
    s3.setInjectionPoint(QWebEngineScript::DocumentCreation);
    s3.setWorldId(QWebEngineScript::MainWorld);
    profile->scripts()->insert(s3);

    /* We need the files to be loaded in a particular order.
       Using QWebEngineProfile appears to work.  Calling runJavaScript
       after the page is loaded doesn't work this is too late for
       DOMContentLoaded event handlers in info.js to fire. */
}



MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::quit()
{
    QCoreApplication::quit();
}

void MainWindow::on_quitButton_clicked()
{
    QCoreApplication::quit();
}


void MainWindow::on_loadButton_clicked()
{
    core->load_manual (qPrintable(ui->manualEdit->text()));
}

void MainWindow::focusChanged (QWidget *old, QWidget *now)
{
    if (now != ui->promptCombo)
       core->hide_prompt();
}
