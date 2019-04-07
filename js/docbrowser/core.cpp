#include "core.h"
#include <QMessageBox>
#include <QtGlobal>
#include <QCoreApplication>
#include <QDebug>

Core::Core(QObject *parent) : QObject(parent)
{
}

void
Core::external_manual (const QString &url)
{
    qDebug() << "sent url" << url;

    // Send it back into the browser.
    // We could set load the new page from the C++ code, but we might want
    // the JavaScript code to track multiple manuals at once.
    emit setUrl (url);
}
