#ifndef YOUKUURLDEC_H
#define YOUKUURLDEC_H
#include"TAesClass.h"
#include <QObject>
class Youkuurldec : public QObject
{
    Q_OBJECT
public:
    explicit Youkuurldec(QObject *parent = 0);
    Q_INVOKABLE QString aesdec(QString datas,int blanknum);
private:
    QByteArray key;
};
#endif // YOUKUURLDEC_H
