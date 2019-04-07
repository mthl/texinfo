#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "websocketclientwrapper.h"
#include "websockettransport.h"

#include "infopath.h"

#include <stdlib.h>

#include <QWebEngineView>
#include <QWebSocketServer>
#include <QMessageBox>
#include <QWebEngineScript>
#include <QWebEngineScriptCollection>
#include <QFile>

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(ui->actionQuit, &QAction::triggered, this, &MainWindow::quit);

    auto *server = new QWebSocketServer
               (QStringLiteral("QWebChannel Standalone Server"),
                QWebSocketServer::NonSecureMode,
                this);

// we shouldn't hardcode a number here.  what if the program is run twice at the same time?
    if (!server->listen(QHostAddress::LocalHost, 12345)) {
        qFatal("Failed to open web socket server.");
    }

    auto *clientWrapper = new WebSocketClientWrapper(server, this);


    auto *channel = new QWebChannel(this);
    QObject::connect(clientWrapper, &WebSocketClientWrapper::clientConnected,
                         channel, &QWebChannel::connectTo);

    auto *core = new Core(this);
    channel->registerObject(QStringLiteral("core"), core);


    connect(ui->webEngineView->page(), &QWebEnginePage::loadFinished, this, &MainWindow::inject_qwebchannel);

    this->datadir = getenv ("QTINFO_DATADIR");
    if (!this->datadir)
            QCoreApplication::quit();

#define QWEBCHANNEL_JS "qwebchannel.js"

    QFile file;
    file.setFileName (QString(this->datadir)
                    + "/docbrowser/" + QWEBCHANNEL_JS);
    file.open(QIODevice::ReadOnly);
    QByteArray b = file.readAll();
    this->qwebchannel_js = QString(b);

    load_manual();
}

/* Load qwebchannel.js into the current page. */
void
MainWindow::inject_qwebchannel(bool finished_ok)
{
    if (!finished_ok)
      return;

    /* Run the code, and only after that has finished, run the init 
       function.  Qt uses an asynchronous callback system for this.  Check if 
       init is defined because this slot is activated even for "about:blank", 
       the default page. */

    ui->webEngineView->page()->runJavaScript (qwebchannel_js,
      [this](const QVariant&) {
          this->ui->webEngineView->page()->runJavaScript(
                          "if (typeof init == 'function') { init(); }",
                          0 );
      });
}


#define MANUAL "hello-html"

void
MainWindow::load_manual()
{
    ui->webEngineView->load(QUrl("file:"
+ QString(this->datadir) + "/examples/" MANUAL "/index.html"));
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
    qDebug() << "load clicked";
    char *path = locate_manual(qPrintable(ui->manualEdit->text()));
    qDebug() << "got path" << path;
}
