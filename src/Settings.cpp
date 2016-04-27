#include <QSettings>
#include <QDebug>
#include "Settings.h"

Settings::Settings(QObject *parent) : QObject(parent)
{
    settings = new QSettings(QSettings::IniFormat,QSettings::UserScope,"QShen","QVideo",this);
    loadSettings();
}

Settings::~Settings()
{
    saveSettings();
    //settings->deleteLater();
    delete settings;
}

void Settings::loadSettings()
{
    qDebug() << "Loading settings...";
    if(settings){
        m_preferFormat = settings->value("preferFormat", "mp4").toString();
        m_autoPlay = settings->value("autoPlay", true).toBool();
        m_volume = settings->value("volume", 0).toInt();
    }
    else{
        qDebug() << "settings load failed";
    }
}

void Settings::saveSettings()
{
    qDebug() << "Saving settings...";
    if(settings){
        settings->setValue("preferFormat", m_preferFormat);
        settings->setValue("autoPlay", m_autoPlay);
        settings->setValue("volume", m_volume);
    }
    else{
        qDebug() << "settings save failed...";
    }
}

void Settings::clearSettings()
{
    if(settings){
        settings->clear();
        loadSettings();
    }
}

QString Settings::getPreferFormat()
{
    return m_preferFormat;
}

void Settings::setPreferFormat(QString newPreferFormat)
{
    if (m_preferFormat != newPreferFormat){
        m_preferFormat = newPreferFormat;
        emit preferFormatChanged();
    }
}

bool Settings::autoPlay()
{
    return m_autoPlay;
}

void Settings::setAutoPlay(bool newAutoPlay)
{
    if(m_autoPlay != newAutoPlay){
        m_autoPlay = newAutoPlay;
        emit autoPlayChanged();
    }
}

int Settings::volume()
{
    return m_volume;
}

void Settings::setVolume(int newVolume)
{
    if(m_volume != newVolume){
        m_volume = newVolume;
        emit volumeChanged();
    }
}
