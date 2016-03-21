#include <QApplication>
#include <QDebug>
#include <QTranslator>

#if QT_VERSION < QT_VERSION_CHECK(5, 0, 0)
#include <QtDeclarative>
#include "qmlapplicationviewer.h"
#else
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickView>
#endif

#include "utility.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QString locale = QLocale::system().name();
    QTranslator translator;
    if(!translator.load(QString("qvideo_") + locale,":/i18n")){
        qDebug()<<"translator load erro";
    }
    app.installTranslator(&translator);

    Utility utility;

#if QT_VERSION < QT_VERSION_CHECK(5, 0, 0)
    QmlApplicationViewer viewer;

    viewer.rootContext()->setContextProperty("utility", &utility);

    viewer.setSource(QUrl("qrc:/qml/Symbian/main.qml"));
    viewer.showExpanded();
#else
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("utility",&utility);
#ifdef Q_OS_WIN32
    engine.load(QUrl(QStringLiteral("qrc:/qml/Win32/main.qml")));
#endif

#endif

    return app.exec();
}
