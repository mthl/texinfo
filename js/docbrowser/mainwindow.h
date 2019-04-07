#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "websocketclientwrapper.h"
#include "core.h"

#include <QMainWindow>
#include <QWebChannel>
#include <QtWebSockets/QWebSocketServer>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_quitButton_clicked();

private:
    Ui::MainWindow *ui;

    QWebChannel *channel;
    QWebSocketServer *server;
    WebSocketClientWrapper *clientWrapper;
    Core *core;

    QString qwebchannel_js;
    char *datadir;

    void load_manual();
    void quit();
    void inject_qwebchannel(bool ok);
};

#endif // MAINWINDOW_H
