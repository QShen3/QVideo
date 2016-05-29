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
    Q_PROPERTY(int volume READ volume WRITE setVolume NOTIFY volumeChanged)

public:
    explicit Settings(QObject *parent = 0);
    ~Settings();

    QString getPreferFormat();
    void setPreferFormat(QString newPreferFormat);

    bool autoPlay();
    void setAutoPlay(bool newAutoPlay);

    int volume();
    void setVolume(int);

    bool isAutoCheckNewVersion();
    void setAutoCheckNewVersion(bool);

    QString version();
    void setVersion(QString);

signals:
    void preferFormatChanged();
    void autoPlayChanged();
    void autoCheckNewVersionChanged();
    void versionChanged();

    void volumeChanged();

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

    int m_volume;
};

#endif // SETTINGS_H
