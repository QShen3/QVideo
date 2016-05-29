#include "Utility.h"
#include <QDebug>
#include <QDir>
#include <QDesktopServices>
#include <QUrl>
Utility::Utility(QObject *parent) :
    QObject(parent)
{  
}

Utility::~Utility()
{
}

QString Utility::readFile(QString url)
{
    QFile file(url);

    if(!file.exists()){
        qDebug() << url << "File doesn't exists!";
        return QString();
    }

    if(!file.open(QIODevice::ReadOnly | QIODevice::Text)){
        qDebug() << url << "File can not be read!";
        return QString();
    }

    return QString(file.readAll());
}

QString Utility::getLocale()
{
    return QLocale::system().name();
}
