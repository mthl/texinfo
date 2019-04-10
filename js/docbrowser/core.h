#ifndef CORE_H
#define CORE_H

#include "infopath.h"

#include <QObject>
#include <QVariantMap>

namespace Ui {
class MainWindow;
}

class Core : public QObject
{
    Q_OBJECT
public:
    explicit Core(Ui::MainWindow *ui, QObject *parent = nullptr);

    bool load_manual (const char *manual);
    void hide_prompt ();
    void activate_input (const QString &arg);

signals:
    // Signals emitted from the C++ side and received on the HTML client side.
    void setUrl (const QString &text);
    void set_current_url (const QString &text);

public slots:
    // Signals emitted from the HTML client side and received on the C++ side.
    void external_manual (const QString &url);
    void show_text_input (const QString &input, const QJsonObject &data);

private:
    Ui::MainWindow *ui;
    QVariantMap index_data;

};

#endif // CORE_H
