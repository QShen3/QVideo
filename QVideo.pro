TARGET = QVideo

VERSION = 1.0.0

DEFINES += VER=\\\"$$VERSION\\\"
#DEFINES += BUILDING_LIBCURL CURL_STATICLIB

QT += network webkit

INCLUDEPATH += src
               #curl-7.37.0/include\
               #curl-7.37.0/lib

#include(curl-7.37.0/lib/curl.pri)
#include(curl-7.37.0/lib/vtls/vtls.pri)

HEADERS += \
          src/utility.h \
          src/Youkuurldec.h
          #src/Qcurl.h
SOURCES += main.cpp \
           src/utility.cpp \
           src/Youkuurldec.cpp
           #src/Qcurl.cpp


folder_symbian3.source = qml/QVideoSymbian
folder_symbian3.target = qml

folder_js.source = qml/js
folder_js.target = qml

folder_pic.source = qml/pic
folder_pic.target = qml

DEPLOYMENTFOLDERS += folder_js folder_pic

simulator:DEPLOYMENTFOLDERS += folder_symbian3




symbian:  DEPLOYMENTFOLDERS += folder_symbian3
symbian:  CONFIG += qt-components
symbian:  TARGET.UID3 = 0xE499417E
symbian:  TARGET.CAPABILITY += NetworkServices
symbian:  LIBS *= -lremconcoreapi -lremconinterfacebase -lcone -leikcore -lavkon -lapgrfx -lapmime
symbian:  MMP_RULES += "OPTION gcce -march=armv6 -mfpu=vfp -mfloat-abi=softfp -marm"
symbian:  vendorinfo = "%{\"QShen\"}" ":\"QShen\""
symbian:  my_deployment.pkg_prerules += vendorinfo
symbian:  DEPLOYMENT += my_deployment
symbian:  DEFINES -= VER=\\\"$$VERSION\\\"
symbian:  DEFINES += VER=\"$$VERSION\"


OTHER_FILES += \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog


include(qmlapplicationviewer/qmlapplicationviewer.pri)
include(testAES/testAES.pri)
qtcAddDeployment()



