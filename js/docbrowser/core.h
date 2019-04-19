#ifndef CORE_H
#define CORE_H

#include "infopath.h"
#include "mainwindow.h"

#include <QObject>
#include <QVariantMap>

class MainWindow;


class Core : public QObject
{
    Q_OBJECT
public:
    explicit Core(MainWindow *main_window, QObject *parent = nullptr);

    bool load_manual (const char *manual);
    void activate_input (const QString &arg);
    void do_search (const QString &arg);

signals:
    // Signals emitted from the C++ side and received on the HTML client side.
    void setUrl (const QString &text);
    void set_current_url (const QString &text);
    void search (const QString &text);
    void echo (const QString &message);

public slots:
    // Signals emitted from the HTML client side and received on the C++ side.
    void external_manual (const QString &url);
    void show_text_input (const QString &input, const QJsonObject &data);
    void show_search ();

private:
    MainWindow *main_window;
    QVariantMap index_data;

    void clear_prompt ();
};

#endif // CORE_H
