#include "core.h"
#include "mainwindow.h"

#include <QMessageBox>
#include <QtGlobal>
#include <QCoreApplication>
#include <QDebug>
#include <QJsonObject>
#include <QMapIterator>

Core::Core(MainWindow *main_window, QObject *parent)
      : QObject(parent),
        main_window (main_window)
{
}

bool
Core::load_manual (const char *manual)
{
    char *path = locate_manual (manual);

    /* TODO: we should send it back into the browser for the JavaScript code to 
       track multiple manuals at once. */
    // emit setUrl (url);

    if (path)
      {
        main_window->load_url(QString("file:") + path);

        /* Maybe this should be done automatically by having a separate 
           map for each manual. */
        this->index_data.clear();

        free (path);
        return true;
      }
    return false;
}


/* Return has been pressed in the input box. */
void
Core::activate_input (const QString &arg)
{
  if (index_data.contains(arg))
    emit set_current_url (index_data[arg].toString());
  else
    emit echo ("Index entry not found");
}

void
Core::do_search (const QString &arg)
{
  emit search (arg);
}

/********************* Public Slots **********************/

/* Show the text prompt. */
void
Core::show_text_input (const QString &input, const QJsonObject &data)
{
  if (index_data.isEmpty())
    {
      index_data = data.toVariantMap();
      main_window->populate_combo(index_data);
    }
  main_window->show_prompt();
}

void
Core::show_search ()
{
  main_window->show_search();
}


void
Core::external_manual (const QString &url)
{
    // Repace the file being viewed
    char *manual, *node;
    parse_external_url (qPrintable(url), &manual, &node);

    if (manual)
      {
        load_manual (manual);
        //emit setNode (node);
     }

    free (manual); free (node);
}

/****************** Private Functions **********************/
void
Core::clear_prompt ()
{
  this->index_data.clear();
  main_window->clear_prompt();
}

