#ifndef CORE_H
#define CORE_H

#include "infopath.h"

#include <QObject>

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

signals:
    // Signals emitted from the C++ side and received on the HTML client side.
    void setUrl (const QString &text);

public slots:
    // Signals emitted from the HTML client side and received on the C++ side.
    void external_manual (const QString &url);
    void show_text_input (const QString &input);

private:
    Ui::MainWindow *ui;

};

#endif // CORE_H
