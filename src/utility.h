#ifndef UTILITY_H
#define UTILITY_H
#include <QObject>

class Utility : public QObject
{
    Q_OBJECT
public:
    explicit Utility(QObject *parent = 0);
    Q_INVOKABLE void launchPlayer(const QString &source);
};
#endif // UTILITY_H
