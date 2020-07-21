TEMPLATE = lib
TARGET = $$qtLibraryTarget(seaprintshareplugin)
CONFIG += plugin
DEPENDPATH += .

CONFIG += link_pkgconfig
PKGCONFIG += nemotransferengine-qt5

# Input
HEADERS += \
    seaprintplugininfo.h \
    seaprintshareplugin.h \
    seaprintuploader.h

SOURCES += \
    seaprintplugininfo.cpp \
    seaprintshareplugin.cpp \
    seaprintuploader.cpp

OTHER_FILES +=
    SeaPrintShareUI.qml

shareui.files = *.qml
shareui.path = /usr/share/nemo-transferengine/plugins

target.path = /usr/lib/nemo-transferengine/plugins
INSTALLS += target shareui


OTHER_FILES += \
    rpm/*

DISTFILES += \
    SeaPrintShareUI.qml
