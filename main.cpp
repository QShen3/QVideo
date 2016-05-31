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

#include "Utility.h"
#include "Settings.h"

Q_DECL_EXPORT int main(int argc, char *argv[])
{
#ifdef Q_OS_SYMBIAN
    QApplication::setAttribute((Qt::ApplicationAttribute)11);   //Qt::AA_CaptureMultimediaKeys
#endif
    QApplication app(argc, argv);

    app.setApplicationName("QVideo");
    app.setOrganizationName("QShen");
    app.setApplicationVersion(VER);



    QString locale = QLocale::system().name();
    QTranslator translator;
    if(!translator.load(QString("QVideo_") + locale,":/i18n")){
        qDebug()<<"translator load erro";
    }
    app.installTranslator(&translator);

    Utility utility;
    Settings settings;

#if QT_VERSION < QT_VERSION_CHECK(5, 0, 0)
    QmlApplicationViewer viewer;

    //viewer.setAttribute(Qt::WA_OpaquePaintEvent);
    //viewer.setAttribute(Qt::WA_NoSystemBackground);
    //viewer.viewport()->setAttribute(Qt::WA_OpaquePaintEvent);
    //viewer.viewport()->setAttribute(Qt::WA_NoSystemBackground);
    viewer.setOrientation(QmlApplicationViewer::ScreenOrientationLockPortrait);

    viewer.rootContext()->setContextProperty("utility", &utility);
    viewer.rootContext()->setContextProperty("settings", &settings);

    viewer.rootContext()->setContextProperty("appVersion", app.applicationVersion());

#ifdef Q_OS_SYMBIAN
    QSplashScreen *splash = new QSplashScreen(QPixmap(":/qml/pic/splash.png"));
    splash->show();
    splash->raise();

    viewer.setSource(QUrl("qrc:/qml/Symbian/main.qml"));
#elif defined(Q_OS_HARMATTAN)
    //QApplication::setGraphicsSystem("native");
    viewer.setSource(QUrl("qrc:/qml/Meego/main.qml"));
#elif defined(Q_WS_SIMULATOR)
    viewer.setSource(QUrl("qrc:/qml/Symbian/main.qml"));
#endif
    viewer.showExpanded();
#else
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("utility",&utility);
#ifdef Q_OS_WIN32
    engine.load(QUrl(QStringLiteral("qrc:/qml/Win32/main.qml")));
#endif

#endif

#ifdef Q_OS_SYMBIAN
    splash->finish(&viewer);
    splash->deleteLater();
#endif
    return app.exec();
}
