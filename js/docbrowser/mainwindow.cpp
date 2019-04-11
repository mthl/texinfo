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

QString
MainWindow::inject_js_file (const QString &filename, QWebEngineProfile *profile)
{
  QString script;
  QFile file;
  file.setFileName (QString(this->datadir)
                    + "/" + filename);
  file.open(QIODevice::ReadOnly);
  QByteArray b = file.readAll();
  script = QString(b);

  QWebEngineScript s;
  s.setSourceCode(script);
  s.setRunsOnSubFrames(true);
  s.setInjectionPoint(QWebEngineScript::DocumentCreation);
  s.setWorldId(QWebEngineScript::MainWorld);
  profile->scripts()->insert(s);

  return script;
}

void
MainWindow::setup_profile (QWebEngineProfile *profile)
{

#define INFO_JS "info.js"

  info_js = inject_js_file (INFO_JS, profile);
  /* We need the files to be loaded in a particular order.
     Using QWebEngineProfile appears to work.  Calling runJavaScript
     after the page is loaded doesn't work this is too late for
     DOMContentLoaded event handlers in info.js to fire. */

#define MODERNIZR_JS "modernizr.js"

  modernizr_js = inject_js_file (MODERNIZR_JS, profile);

#define INFO_CSS "info.css"

    if (info_css.isNull()) {
        QFile file;
        file.setFileName (QString(this->datadir)
                      + "/" INFO_CSS);
        file.open(QIODevice::ReadOnly);
        QByteArray b = file.readAll();
        info_css = QString(b);
    }

#define QWEBCHANNEL_JS "qwebchannel.js"

  qwebchannel_js = inject_js_file ("docbrowser/" QWEBCHANNEL_JS, profile);

    /* Set up JavaScript to load info.css.  This relies on there being no 
       single quotes or backslashes in info.css.  The simplified() call
       is needed to fit the CSS in a single line of JavaScript. */
    QString insert_css = QString::fromLatin1("(function () {"
      "var css = document.createElement('style');\n"
      "css.type = 'text/css';\n"
      "css.innerText = '%1';\n"
      "document.head.appendChild(css);\n"
    "})()").arg(info_css.simplified());

    QWebEngineScript s;
    s.setSourceCode(insert_css);
    s.setInjectionPoint(QWebEngineScript::DocumentReady);
    s.setWorldId(QWebEngineScript::MainWorld);
    profile->scripts()->insert(s);
    /* This needs to run after the <head> element is accessible, but before
       the DOMContentLoaded event handlers in info.js fire. */

    QWebEngineScript s2;
    s2.setSourceCode("if (typeof wc_init == 'function') { wc_init(); }");
    s2.setInjectionPoint(QWebEngineScript::DocumentCreation);
    s2.setWorldId(QWebEngineScript::MainWorld);
    profile->scripts()->insert(s2);
}



MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::quit()
{
    QCoreApplication::quit();
}


void MainWindow::focusChanged (QWidget *old, QWidget *now)
{
    if (now == ui->webEngineView)
       core->hide_prompt();
}

void MainWindow::on_quitButton_clicked()
{
    QCoreApplication::quit();
}


void MainWindow::on_loadButton_clicked()
{
    core->load_manual (qPrintable(ui->manualEdit->text()));
}


void MainWindow::on_promptCombo_activated(const QString &arg1)
{
    core->activate_input(arg1);
}
