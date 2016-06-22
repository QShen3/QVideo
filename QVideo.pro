TEMPLATE = app

#DEFINES += VER=\\\"$$VERSION\\\"

equals(QT_MAJOR_VERSION, 4) {
    QT += network
}
equals(QT_MAJOR_VERSION, 5) {
    QT += qml quick svg network
    #DEFINES += QT_WEBVIEW_WEBENGINE_BACKEND
}

INCLUDEPATH += src

HEADERS += \
    src/Settings.h \
    src/Utility.h

SOURCES += main.cpp \
    src/Settings.cpp \
    src/Utility.cpp

RESOURCES += \
    QVideo.qrc


TRANSLATIONS += i18n/QVideo_zh.ts

OTHER_FILES += \
    qml/JavaScript/*.js \
    qml/pic/*.svg \
    qml/pic/*.png

folder_symbian3.source = qml/Symbian
folder_symbian3.target = qml

folder_meego.source = qml/Meego
folder_meego.target = qml

folder_js.source = qml/JavaScript
folder_js.target = qml

folder_pic.source = qml/pic
folder_pic.target = qml

simulator{
    DEPLOYMENTFOLDERS += folder_js folder_pic
    DEPLOYMENTFOLDERS += folder_symbian3
    RESOURCES += \
        Symbian.qrc

    include(qmlapplicationviewer/qmlapplicationviewer.pri)
    qtcAddDeployment()

    message(Qt Simulator build)
}

symbian{
    CONFIG += qt-components mobility localize_deployment

    VERSION = 0.1.0
    DEFINES += VER=\"$$VERSION\"

    vendorinfo = "%{\"QShen\"}" ":\"QShen\""
    my_deployment.pkg_prerules += vendorinfo
    DEPLOYMENT.display_name = QVideo
    DEPLOYMENT += my_deployment

    TARGET.UID3 = 0xE499417E
    TARGET.CAPABILITY += NetworkServices \
        ReadDeviceData \
        WriteDeviceData \
        SwEvent

    MOBILITY += multimedia systeminfo

    LIBS += -lremconcoreapi -lremconinterfacebase -lcone -leikcore -lavkon -lapgrfx -lapmime -lgslauncher
    MMP_RULES += "OPTION gcce -march=armv6 -mfpu=vfp -mfloat-abi=softfp -marm"
    MMP_RULES += "EPOCPROCESSPRIORITY windowserver"

    RESOURCES += Symbian.qrc
    DEPLOYMENTFOLDERS += folder_js folder_pic folder_symbian3

    include(qmlapplicationviewer/qmlapplicationviewer.pri)
    qtcAddDeployment()

    message(Symbian build)
}

contains(MEEGO_EDITION, harmattan){
    DEFINES += Q_OS_HARMATTAN
    CONFIG += qdeclarative-boostable meegotouch videosuiteinterface-maemo-meegotouch mobility
    MOBILITY += multimedia systeminfo

    VERSION = 0.1.0
    DEFINES += VER=\\\"$$VERSION\\\"

    splash.files = qml/pic/splash.png
    splash.path = /opt/QVideo/splash
    INSTALLS += splash

    RESOURCES += Meego.qrc
    DEPLOYMENTFOLDERS +=  folder_js folder_meego folder_pic

    OTHER_FILES += \
        qtc_packaging/debian_harmattan/rules \
        qtc_packaging/debian_harmattan/README \
        qtc_packaging/debian_harmattan/manifest.aegis \
        qtc_packaging/debian_harmattan/copyright \
        qtc_packaging/debian_harmattan/control \
        qtc_packaging/debian_harmattan/compat \
        qtc_packaging/debian_harmattan/changelog

    include(qmlapplicationviewer/qmlapplicationviewer.pri)
    qtcAddDeployment()

    message(MeeGo build)
}

win32-g++{
    RESOURCES += Win32.qrc

    VERSION = 0.1.0
    DEFINES += VER=\\\"$$VERSION\\\"

    OTHER_FILES += \
        qml/Win32/*.qml \
        qml/Win32/BaseComponent/*.qml \
        qml/Win32/Delegate/*.qml \
        qml/Win32/Dialog/*.qml \
        qml/Win32/Youku/*.qml \
        qml/Win32/Youku/MainPage/*.qml \
        qml/Win32/Youku/Delegate/*.qml

    include(deployment.pri)

    message(Win32 Mingw build)
}

winrt{
    RESOURCES += WinRT.qrc

    VERSION = 0.1.0
    DEFINES += VER=\\\"$$VERSION\\\"

    OTHER_FILES += \
        qml/WinRT/*.qml \
        qml/WinRT/BaseComponent/*.qml \
        qml/WinRT/Delegate/*.qml \
        qml/WinRT/Dialog/*.qml \
        qml/WinRT/Youku/*.qml \
        qml/WinRT/Youku/MainPage/*.qml \
        qml/WinRT/Youku/SubPage/*.qml \
        qml/WinRT/Youku/Delegate/*.qml

    include(deployment.pri)

    message(WinRT build)
}

android{
    QT += androidextras

    RESOURCES += Android.qrc      #Android qml

    VERSION = 0.1.0
    DEFINES += VER=\\\"$$VERSION\\\"

    OTHER_FILES += \
        qml/Android/*.qml \
        qml/Android/BaseComponent/*.qml \
        qml/Android/Delegate/*.qml \
        qml/Android/Dialog/*.qml \
        qml/Android/Youku/*.qml \
        qml/Android/Youku/MainPage/*.qml \
        qml/Android/Youku/SubPage/*.qml \
        qml/Android/Youku/Delegate/*.qml

    DISTFILES += \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat \
        android/src/com/qshen/qvideo/*.java

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android


    include(deployment.pri)

    message(Andriod build)
}

