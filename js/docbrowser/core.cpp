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

void
Core::external_manual (const QString &url)
{
    qDebug() << "sent url" << url;

    // Repace the file being viewed
    char *manual, *node;
    parse_external_url (qPrintable(url), &manual, &node);

    if (manual)
      {
        load_manual (manual);
        // and set node to node
        qDebug () << "got node" << node;
        //emit setNode (node);
     }

    free (manual); free (node);
}

bool
Core::load_manual (const char *manual)
{
    char *path = locate_manual (manual);

    // TODO: we should send it back into the browser for the JavaScript code to 
    // track multiple manuals at once.
    // emit setUrl (url);

    if (path)
      {
        qDebug() << "got path" << path;
        ui->webEngineView->load(QUrl("file:" + QString(path)));
        free (path);
        return true;
      }
    return false;
}

/* Show the text prompt. */
void
Core::show_text_input (const QString &input)
{
  ui->promptLabel->setVisible(true);
  ui->promptCombo->setVisible(true);
  ui->promptCombo->setFocus();
}

/* Hide the text prompt.
   Allegedly you can put these two as children of a widget, and then
   just hide a single widget.  I couldn't get it to look right in
   qtcreator, though. */
void
Core::hide_prompt()
{
    ui->promptLabel->setVisible(false);
    ui->promptCombo->setVisible(false);
}


