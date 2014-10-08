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
QString Utility::readdlache()
       {
        QString dlache;
        #ifdef Q_OS_HARMATTAN
        QFile fp("/home/user/MyDocs/9Smart/user.dat");
        #else
        QFile fp("C://dlache.dat");
        #endif
        if(!fp.open(QIODevice::ReadOnly | QIODevice::Text))
          {
           dlache="{\"statuses\":[]}";
           return dlache;
          }
        QTextStream in(&fp);
        dlache=in.readAll();
        return dlache;
       }
void Utility::writedlache(QString dlache)
    {
     #ifdef Q_OS_HARMATTAN
     QFile fp("/home/user/MyDocs/9Smart/dlache.dat");
     #else
     QFile fp("C://dlache.dat");
     #endif
     if(!fp.open(QIODevice::WriteOnly | QIODevice::Text))
       {
        fp.close();
        fp.open(QIODevice::WriteOnly | QIODevice::Text);
       }
     QTextStream out(&fp);
     out<<dlache;
     fp.close();
    }



