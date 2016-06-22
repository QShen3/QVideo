#ifndef SETTINGS_H
#define SETTINGS_H
#include <QObject>
//#include <QScopedPointer>

class QSettings;

class Settings : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString preferFormat READ getPreferFormat WRITE setPreferFormat NOTIFY preferFormatChanged)
    Q_PROPERTY(bool autoPlay READ autoPlay WRITE setAutoPlay NOTIFY autoPlayChanged)
    Q_PROPERTY(bool autoCheckNewVersion READ isAutoCheckNewVersion WRITE setAutoCheckNewVersion NOTIFY autoCheckNewVersionChanged)
    Q_PROPERTY(QString version READ version WRITE setVersion NOTIFY versionChanged)
#ifdef Q_OS_SYMBIAN
    Q_PROPERTY(int volume READ volume WRITE setVolume NOTIFY volumeChanged)
#endif

public:
    explicit Settings(QObject *parent = 0);
    ~Settings();

    QString getPreferFormat();
    void setPreferFormat(QString newPreferFormat);

    bool autoPlay();
    void setAutoPlay(bool newAutoPlay);

#ifdef Q_OS_SYMBIAN
    int volume();
    void setVolume(int);
#endif

    bool isAutoCheckNewVersion();
    void setAutoCheckNewVersion(bool);

    QString version();
    void setVersion(QString);

signals:
    void preferFormatChanged();
    void autoPlayChanged();
    void autoCheckNewVersionChanged();
    void versionChanged();
#ifdef Q_OS_SYMBIAN
    void volumeChanged();
#endif

public slots:
    void loadSettings();
    void saveSettings();
    void clearSettings();

private:
    QSettings *settings;
    //QScopedPointer<QSettings> settings;

    QString m_preferFormat;
    bool m_autoPlay;
    bool m_autoCheckNewVersion;
    QString m_version;
#ifdef Q_OS_SYMBIAN
    int m_volume;
#endif
};

#endif // SETTINGS_H
