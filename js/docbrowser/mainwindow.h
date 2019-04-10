#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "websocketclientwrapper.h"
#include "core.h"

#include <QMainWindow>
#include <QWebEngineProfile>

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
    void on_loadButton_clicked();
    void on_promptCombo_activated(const QString &arg1);

private:
    Ui::MainWindow *ui;

    Core *core;

    QString qwebchannel_js;
    QString info_js;
    QString modernizr_js;
    QString info_css;

    char *datadir;

    void quit();
    void inject_qwebchannel(bool ok);
    void setup_profile(QWebEngineProfile *profile);
    void setup_channel();
    void focusChanged (QWidget *old, QWidget *now);
};

#endif // MAINWINDOW_H
