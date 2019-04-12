#include "core.h"
#include "ui_mainwindow.h"

#include <QMessageBox>
#include <QtGlobal>
#include <QCoreApplication>
#include <QDebug>
#include <QJsonObject>
#include <QMapIterator>

Core::Core(Ui::MainWindow *ui, QObject *parent)
      : QObject(parent),
        ui(ui)
{
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

        this->index_data.clear(); // FIXME: this should be done automatically, maybe by having a separate map for each window.

        free (path);
        return true;
      }
    return false;
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

/* Return has been pressed in the input box. */
void
Core::activate_input (const QString &arg)
{
  if (input_search)
    emit search (arg);
  else
    emit set_current_url (index_data[arg].toString());

  hide_prompt();
  ui->webEngineView->setFocus();
}

/********************* Public Slots **********************/

/* Show the text prompt. */
void
Core::show_text_input (const QString &input, const QJsonObject &data)
{
  if (input == "regexp-search")
    {
      input_search = true;
    }
  else if (index_data.isEmpty())
    {
      input_search = false;
      index_data = data.toVariantMap();
      QMapIterator<QString, QVariant> i(index_data);
      while (i.hasNext())
        {
          i.next();
          ui->promptCombo->addItem(i.key());
        }
    }

  ui->promptLabel->setVisible(true);
  ui->promptCombo->setVisible(true);
  ui->promptCombo->setFocus();

  if (!input_search)
    ui->promptCombo->setEditText("");
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
