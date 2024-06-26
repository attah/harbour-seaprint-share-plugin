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

#include "seaprintplugininfo.h"

SeaPrintPluginInfo::SeaPrintPluginInfo()
{

}

SeaPrintPluginInfo::~SeaPrintPluginInfo()
{

}

QList<SharingMethodInfo> SeaPrintPluginInfo::info() const
{
    return m_infoList;
}

void SeaPrintPluginInfo::query()
{
    SharingMethodInfo info;
    // Capabilites ie. what mimetypes this plugin supports

    QStringList capabilities = {"image/*",
                                "application/pdf",
                                "application/postscript",
                                "application/msword",
                                "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
                                "text/rtf",
                                "application/rtf",
                                "application/vnd.oasis.opendocument.text",
                                "application/vnd.ms-powerpoint",
                                "application/vnd.openxmlformats-officedocument.presentationml.presentation",
                                "application/vnd.oasis.opendocument.presentation",
                                "text/plain"};

    info.setDisplayName(QLatin1String("SeaPrint"));

    // Method ID is a unique identifier for this plugin. It is used to identify which share plugin should be
    // used for starting the sharing.
    info.setMethodId(QLatin1String("SeaPrint-Share-Method-ID"));

    // Path to the Sharing UI which this plugin provides.
    info.setShareUIPath(QLatin1String("/usr/share/nemo-transferengine/plugins/sharing/SeaPrintShareUI.qml"));

    info.setMethodIcon(QStringLiteral("image://theme/harbour-seaprint"));

    // Pass information about capabilities. This info is used for filtering share plugins
    // which don't support defined types. For example, this plugin won't appear in the
    // share method list, if someone tries to share content which isn't image or vcard type,
    info.setCapabilities(capabilities);

    m_infoList << info;

    // Let the world know that this plugin is ready
    emit infoReady();
}
