#include <QtGui/QApplication>
#include <QtDeclarative>
#include "qmlapplicationviewer.h"
#include "utility.h"
#include "Youkuurldec.h"
//#include "Qcurl.h"
Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;

    Utility utility;
    Youkuurldec youkuurldec;
    //Qcurl qcurl;
    QString data=youkuurldec.aesdec("H2VnFdgfG12oqEKLx6RZyE4/IFvKxZV2yfvQwnw0EeI=",0);
    //qDebug() << data;

    viewer.rootContext()->setContextProperty("youkuurldec",&youkuurldec);
    viewer.rootContext()->setContextProperty("utility", &utility);
    //viewer.rootContext()->setContextProperty("qcurl",&qcurl);
    viewer.setMainQmlFile(QLatin1String("qml/QVideoSymbian/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
