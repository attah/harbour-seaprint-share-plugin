Name: seaprint-share-plugin
Version: 0.0.1
Release: 0
Summary: Share plugin for SeaPrint
Group: System/Libraries
License: LICENCE
URL: https://github.com/attah/harbour-seaprint-share-plugin
Source0: %{name}-%{version}.tar.gz
BuildRequires: pkgconfig(Qt5Core)
BuildRequires: pkgconfig(Qt5Qml)
BuildRequires: pkgconfig(nemotransferengine-qt5)
BuildRequires: qt5-qttools
BuildRequires: qt5-qttools-linguist

Requires:  nemo-transferengine-qt5
Requires:  declarative-transferengine-qt5 >= 0.0.44

%description
%{summary}.

%files
%defattr(-,root,root,-)
%{_libdir}/nemo-transferengine/plugins/*shareplugin.so
%{_datadir}/nemo-transferengine/plugins/*.qml
%{_datadir}/themes/sailfish-default/meegotouch/z1.0/icons/icon-m-share-harbour-seaprint.png
%{_datadir}/themes/sailfish-default/meegotouch/z1.25/icons/icon-m-share-harbour-seaprint.png
%{_datadir}/themes/sailfish-default/meegotouch/z1.5-large/icons/icon-m-share-harbour-seaprint.png
%{_datadir}/themes/sailfish-default/meegotouch/z1.75/icons/icon-m-share-harbour-seaprint.png

%prep
%setup -q -n %{name}-%{version}

%build

%qmake5

make %{?jobs:-j%jobs}

%install
rm -rf %{buildroot}
%qmake5_install

