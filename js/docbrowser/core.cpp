#include "core.h"
#include <QMessageBox>
#include <QtGlobal>
#include <QCoreApplication>
#include <QDebug>

Core::Core(Ui::MainWindow *ui, QObject *parent)
      : QObject(parent),
        ui(ui)
{
}

void
Core::external_manual (const QString &url)
{
    qDebug() << "sent url" << url;

    // We should send it back into the browser for the JavaScript code to track 
    // multiple manuals at once.
    // emit setUrl (url);

    // Repace the file being viewed
}
