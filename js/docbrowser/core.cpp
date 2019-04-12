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
        qDebug() << "got path" << path;

        main_window->load_url(QString("file:") + path);

        this->index_data.clear(); // FIXME: this should be done automatically, maybe by having a separate map for each window.

        free (path);
        return true;
      }
    return false;
}


/* Return has been pressed in the input box. */
void
Core::activate_input (const QString &arg)
{
  if (input_search)
    emit search (arg);
  else
    emit set_current_url (index_data[arg].toString());
}

/********************* Public Slots **********************/

/* Show the text prompt. */
void
Core::show_text_input (const QString &input, const QJsonObject &data)
{
  bool populate_combo = false;

  if (input == "regexp-search")
    {
      input_search = true;
    }
  else if (index_data.isEmpty())
    {
      input_search = false;
      populate_combo = true;
    }
  if (populate_combo)
    {
      index_data = data.toVariantMap();
      main_window->populate_combo(index_data);
    }

  main_window->show_prompt();

  if (!input_search)
    main_window->clear_prompt();
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

