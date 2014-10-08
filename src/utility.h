#ifndef UTILITY_H
#define UTILITY_H
#include <QObject>

class Utility : public QObject
             {
              Q_OBJECT
              public:
                    explicit Utility(QObject *parent = 0);
                    Q_INVOKABLE void launchPlayer(const QString &source);
                    Q_INVOKABLE void writedlache(QString dlache);
                    Q_INVOKABLE QString readdlache();
             };
#endif // UTILITY_H
