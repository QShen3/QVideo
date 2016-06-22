#ifndef UTILITY_H
#define UTILITY_H
#include <QObject>

class Utility : public QObject
{
    Q_OBJECT
public:
    explicit Utility(QObject *parent = 0);
    ~Utility();

    Q_INVOKABLE QString readFile(QString url);
    Q_INVOKABLE QString getLocale();


    Q_INVOKABLE int getStatusBarHeight();

};
#endif // UTILITY_H
