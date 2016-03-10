#include <QtGui/QApplication>
#include <QtDeclarative>
#include "qmlapplicationviewer.h"
#include "utility.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;

    Utility utility;

    viewer.rootContext()->setContextProperty("utility", &utility);

    viewer.setSource(QUrl("qrc:/qml/Symbian/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
