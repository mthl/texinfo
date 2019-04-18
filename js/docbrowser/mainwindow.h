#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "websocketclientwrapper.h"
#include "core.h"

#include <QMainWindow>
#include <QWebEngineProfile>

class Core;

namespace Ui {
class MainWindow;
}


class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();
    void hide_prompt ();
    void show_prompt ();
    void clear_prompt ();
    void populate_combo (const QMap<QString, QVariant> &data);
    void show_search();
    void hide_search();
    void load_url (const QString &string);

private slots:
    void on_quitButton_clicked();
    void on_loadButton_clicked();
    void on_promptCombo_activated(const QString &arg1);
    void on_searchEdit_returnPressed();

    void on_manualEdit_returnPressed();

private:
    Ui::MainWindow *ui;

    Core *core;

    QString qwebchannel_js;
    QString info_js;
    QString modernizr_js;
    QString info_css;

    char *datadir;

    void quit();
    QString inject_js_file(const QString &filename, QWebEngineProfile *profile);
    void setup_profile(QWebEngineProfile *profile);
    void setup_channel();
    void focusChanged (QWidget *old, QWidget *now);
};

#endif // MAINWINDOW_H
