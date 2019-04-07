#-------------------------------------------------
#
# Project created by QtCreator 2019-04-03T22:18:36
#
#-------------------------------------------------

QT       += core gui
QT += webenginewidgets webchannel
QT += websockets

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = docbrowser
TEMPLATE = app


SOURCES += main.cpp\
        mainwindow.cpp \
    websocketclientwrapper.cpp \
    websockettransport.cpp \
    core.cpp \
    infopath.c

HEADERS  += mainwindow.h \
    websocketclientwrapper.h \
    websockettransport.h \
    core.h \
    infopath.h

FORMS    += mainwindow.ui
