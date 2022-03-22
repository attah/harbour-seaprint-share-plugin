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


shareui_icon_64.files = $$PWD/icons/z1.0/icon-m-share-harbour-seaprint.png
shareui_icon_64.path = /usr/share/themes/sailfish-default/meegotouch/z1.0/icons

shareui_icon_80.files = $$PWD/icons/z1.25/icon-m-share-harbour-seaprint.png
shareui_icon_80.path = /usr/share/themes/sailfish-default/meegotouch/z1.25/icons

shareui_icon_72.files = $$PWD/icons/z1.5-large/icon-m-share-harbour-seaprint.png
shareui_icon_72.path = /usr/share/themes/sailfish-default/meegotouch/z1.5-large/icons

shareui_icon_112.files = $$PWD/icons/z1.75/icon-m-share-harbour-seaprint.png
shareui_icon_112.path = /usr/share/themes/sailfish-default/meegotouch/z1.75/icons

target.path = $$LIBDIR/nemo-transferengine/plugins/sharing

INSTALLS += \
    target \
    shareui \
    shareui_icon_64 \
    shareui_icon_80 \
    shareui_icon_72 \
    shareui_icon_112


OTHER_FILES += \
    rpm/*

DISTFILES += \
    SeaPrintShareUI.qml
