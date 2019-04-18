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
    hide_prompt();
    hide_search();

    auto *profile = new QWebEngineProfile(this);
    setup_profile(profile);
    auto *page = new QWebEnginePage(profile, this);

    ui->webEngineView->setPage(page);

    load_url (QString("file:") + this->datadir + "/test/hello/index.html");
}

void
MainWindow::load_url(const QString &string)
{
  ui->webEngineView->page()->load(QUrl(string));
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

    this->core = new Core(this, this);
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
#define QTINFO_JS "docbrowser/qtinfo.js"

  QString script;
  QFile file;
  file.setFileName (QString(this->datadir)
                    + "/" + INFO_JS);
  file.open(QIODevice::ReadOnly);
  QByteArray b = file.readAll();
  script = QString(b);

  QString script2;
  QFile file2;
  file2.setFileName (QString(this->datadir)
                    + "/" + QTINFO_JS);
  file2.open(QIODevice::ReadOnly);
  QByteArray b2 = file2.readAll();
  script2 = QString(b2);

  QWebEngineScript s1;
  s1.setSourceCode(script + script2);
  s1.setRunsOnSubFrames(true);
  s1.setInjectionPoint(QWebEngineScript::DocumentCreation);
  s1.setWorldId(QWebEngineScript::MainWorld);
  profile->scripts()->insert(s1);

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
    s.setRunsOnSubFrames(true);
    s.setInjectionPoint(QWebEngineScript::DocumentReady);
    s.setWorldId(QWebEngineScript::MainWorld);
    profile->scripts()->insert(s);
    /* This needs to run after the <head> element is accessible, but before
       the DOMContentLoaded event handlers in info.js fire. */
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
    if (now != ui->promptCombo && now != ui->promptCombo->view())
       hide_prompt ();
    if (now != ui->searchEdit)
       hide_search ();

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
  hide_prompt();
  ui->webEngineView->setFocus();
}

/* Hide the text prompt.
   Allegedly you can put these two as children of a widget, and then
   just hide a single widget.  I couldn't get it to look right in
   qtcreator, though. */
void
MainWindow::hide_prompt()
{
  ui->promptLabel->setVisible(false);
  ui->promptCombo->setVisible(false);
}

void
MainWindow::show_prompt()
{
  ui->promptLabel->setVisible(true);
  ui->promptCombo->setVisible(true);
  ui->promptCombo->setFocus();
}


void
MainWindow::clear_prompt()
{
  ui->promptCombo->clear();
}


/* Add suggestions for the combo box from DATA.
   We should be able to do this a faster way with setModel, to choose
   whether to use the index suggestions or allow free input for the text 
   search. */
void
MainWindow::populate_combo (const QMap<QString, QVariant> &data)
{
  clear_prompt();
  QMapIterator<QString, QVariant> i(data);
  while (i.hasNext())
    {
      i.next();
      ui->promptCombo->addItem(i.key());
    }
}


void
MainWindow::show_search()
{
  ui->searchLabel->setVisible(true);
  ui->searchEdit->setVisible(true);
  ui->searchEdit->setFocus();
}

void
MainWindow::hide_search()
{
  ui->searchLabel->setVisible(false);
  ui->searchEdit->setVisible(false);
}


void
MainWindow::on_manualEdit_returnPressed()
{
  on_loadButton_clicked();
}

void
MainWindow::on_searchEdit_returnPressed()
{
  core->do_search (ui->searchEdit->text());
}
