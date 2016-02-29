TEMPLATE = app

DEFINES += VER=\\\"$$VERSION\\\"

equals(QT_MAJOR_VERSION, 4) {
    QT += network
}
equals(QT_MAJOR_VERSION, 5) {
    QT += qml quick svg network
    #DEFINES += QT_WEBVIEW_WEBENGINE_BACKEND
}

INCLUDEPATH += src

HEADERS += \
          src/utility.h \
          src/Youkuurldec.h

SOURCES += main.cpp \
           src/utility.cpp \
           src/Youkuurldec.cpp

RESOURCES += \
    QVideo.qrc

TRANSLATIONS += i18n/QVideo_zh.ts

OTHER_FILES += \
    qml/JavaScript/*.js \
    qml/pic/*.svg \
    qml/pic/*.png

folder_symbian3.source = qml/Symbian
folder_symbian3.target = qml

folder_js.source = qml/JavaScript
folder_js.target = qml

folder_pic.source = qml/pic
folder_pic.target = qml

simulator{
    DEPLOYMENTFOLDERS += folder_js folder_pic
    DEPLOYMENTFOLDERS += folder_symbian3

    include(qmlapplicationviewer/qmlapplicationviewer.pri)
    qtcAddDeployment()
}

symbian{
    CONFIG += qt-components

    VERSION = 0.1.0
    DEFINES += VER=\"$$VERSION\"

    vendorinfo = "%{\"QShen\"}" ":\"QShen\""
    my_deployment.pkg_prerules += vendorinfo
    DEPLOYMENT.display_name = QVideo
    DEPLOYMENT += my_deployment

    TARGET.UID3 = 0xE499417E
    TARGET.CAPABILITY += NetworkServices

    LIBS *= -lremconcoreapi -lremconinterfacebase -lcone -leikcore -lavkon -lapgrfx -lapmime
    MMP_RULES += "OPTION gcce -march=armv6 -mfpu=vfp -mfloat-abi=softfp -marm"

    #RESOURCES += Symbian.qrc
    DEPLOYMENTFOLDERS += folder_js folder_pic folder_symbian3

    include(qmlapplicationviewer/qmlapplicationviewer.pri)
    qtcAddDeployment()

    message(Symbian build)
}

contains(MEEGO_EDITION,harmattan){
    DEFINES += Q_OS_HARMATTAN
    CONFIG += qdeclarative-boostable meegotouch videosuiteinterface-maemo-meegotouch

    #RESOURCES += Meego.qrc
    DEPLOYMENTFOLDERS +=  folder_JS folder_Meego folder_pic

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

    OTHER_FILES += \
        qml/Win32/*.qml \
        qml/Win32/BaseComponent/*.qml \
        qml/Win32/Delegate/*.qml \
        qml/Win32/Dialog/*.qml

    include(deployment.pri)

    message(Win32 build)
}

android{
    RESOURCES += Android.qrc      #Android qml

    OTHER_FILES += \
        qml/Android/*.qml \
        qml/Android/BaseComponent/*.qml \
        qml/Android/Delegate/*.qml \
        qml/Android/Dialog/*.qml

    DISTFILES += \
        android/AndroidManifest.xml \
        android/gradle/wrapper/gradle-wrapper.jar \
        android/gradlew \
        android/res/values/libs.xml \
        android/build.gradle \
        android/gradle/wrapper/gradle-wrapper.properties \
        android/gradlew.bat

    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android


    include(deployment.pri)

    message(Andriod build)
}
