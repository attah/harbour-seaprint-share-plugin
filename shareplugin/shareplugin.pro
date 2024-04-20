TEMPLATE = lib
TARGET = $$qtLibraryTarget(seaprintshareplugin)
CONFIG += plugin
DEPENDPATH += .

CONFIG += link_pkgconfig
PKGCONFIG += nemotransferengine-qt5

# Input
HEADERS += \
    seaprintplugininfo.h \
    seaprintshareplugin.h

SOURCES += \
    seaprintplugininfo.cpp \
    seaprintshareplugin.cpp

OTHER_FILES +=
    SeaPrintShareUI.qml

shareui.files = *.qml
shareui.path = /usr/share/nemo-transferengine/plugins/sharing


target.path = $$LIBDIR/nemo-transferengine/plugins/sharing

INSTALLS += \
    target \
    shareui


OTHER_FILES += \
    rpm/*

DISTFILES += \
    SeaPrintShareUI.qml
