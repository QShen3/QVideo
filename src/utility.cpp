#include "utility.h"
#include <QDebug>
#include <QDir>
#include <QDesktopServices>
#include <QUrl>
Utility::Utility(QObject *parent) :
    QObject(parent)
{
}
void Utility::launchPlayer(const QString &source)
    {

     qDebug()<<"launch player"<<source;
     QString filePath = QDir::tempPath() + "/video.ram";
     QFile file(filePath);
     if (file.exists())
       file.remove();
     if (file.open(QIODevice::ReadWrite | QIODevice::Text))
       {
        QTextStream out(&file);
        out << source;
        file.close();
        QDesktopServices::openUrl(QUrl("file:///"+filePath));
       }
    }



