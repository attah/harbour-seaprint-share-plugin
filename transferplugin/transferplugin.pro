TEMPLATE = lib
TARGET = $$qtLibraryTarget(seaprinttransferplugin)
CONFIG += plugin
DEPENDPATH += .

CONFIG += link_pkgconfig
PKGCONFIG += nemotransferengine-qt5

# Input
HEADERS += \
    seaprinttransferplugin.h \
    seaprintuploader.h

SOURCES += \
    seaprinttransferplugin.cpp \
    seaprintuploader.cpp

shareui.files = *.qml
shareui.path = /usr/share/nemo-transferengine/plugins/transfer


target.path = $$LIBDIR/nemo-transferengine/plugins/transfer

INSTALLS += \
    target
