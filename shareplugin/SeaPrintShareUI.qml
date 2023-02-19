/******************************************************************************
Copyright (c) <2014>, Jolla Ltd.
Contact: Marko Mattila <marko.mattila@jolla.com>

All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    Redistributions of source code must retain the above copyright notice, this
    list of conditions and the following disclaimer. Redistributions in binary
    form must reproduce the above copyright notice, this list of conditions and
    the following disclaimer in the documentation and/or other materials
    provided with the distribution. Neither the name of the Jolla Ltd. nor
    the names of its contributors may be used to endorse or promote products
    derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
******************************************************************************/

import QtQuick 2.6
import Sailfish.Silica 1.0
import Sailfish.TransferEngine 1.0
import Nemo.DBus 2.0

SilicaFlickable {
    property var shareAction

    width: Screen.width
    height: Math.min(Screen.height, contentHeight)
    contentHeight: contentColumn.height

    DBusInterface {
        id: dbus
        bus: DBus.SessionBus

        service: 'net.attah.seaprint'
        path: '/net/attah/seaprint'
        iface: 'net.attah.seaprint'

        function doOpen(file)
        {
            typedCall("Open",
                      [{"type": "s", "value": file}],
                      function (msg) {console.log("success", msg)}, function(msg) {console.log("fail", msg)})
        }
        function doOpenPlaintext(data, name)
        {
            typedCall("OpenPlaintext",
                      [{"type": "s", "value": data},
                       {"type": "s", "value": name}],
                      function (msg) {console.log("success", msg)}, function(msg) {console.log("fail", msg)})
        }
    }

    Column {
        id: contentColumn

        width: parent.width
        spacing: Theme.paddingLarge
        bottomPadding: Theme.paddingLarge


        Image {
            source: Qt.resolvedUrl("/usr/share/icons/hicolor/172x172/apps/harbour-seaprint.png")
            anchors.horizontalCenter: parent.horizontalCenter
            width: Theme.iconSizeExtraLarge
            height: Theme.iconSizeExtraLarge
            smooth: true
            asynchronous: true
        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            icon.source: "image://theme/icon-m-accept"
            onClicked: {
                console.log("WWWWWWWWWWWW", JSON.stringify(shareAction), typeof shareAction.resources[0])
                console.log(shareAction.resources[0].constructor.name)
                if(shareAction.resources[0].constructor.name === "Object")
                {
                    dbus.doOpenPlainText(shareAction.resources[0].data, shareAction.resources[0].name)
                }
                else
                {
                    dbus.doOpen(shareAction.resources[0])
                }

                root.dismiss()
            }
        }

    }
}

