#include "core.h"
#include "ui_mainwindow.h"

#include <QMessageBox>
#include <QtGlobal>
#include <QCoreApplication>
#include <QDebug>

Core::Core(Ui::MainWindow *ui, QObject *parent)
      : QObject(parent),
        ui(ui)
{
}

/* slot */
void
Core::external_manual (const QString &url)
{
    qDebug() << "sent url" << url;

    // We should send it back into the browser for the JavaScript code to track 
    // multiple manuals at once.
    // emit setUrl (url);

    // Repace the file being viewed
}

bool
Core::load_manual (const char *manual)
{
    char *path = locate_manual (manual);

    if (path)
      {
        qDebug() << "got path" << path;
        ui->webEngineView->load(QUrl("file:" + QString(path)));
        free (path);
        return true;
      }
    return false;
}

