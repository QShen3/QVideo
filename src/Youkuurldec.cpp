#include"Youkuurldec.h"
#include <QtCore/QCoreApplication>
#include <QDebug>
Youkuurldec::Youkuurldec(QObject *parent) :QObject(parent)
{
 //key="qwer3as2jin4fdsa";
    key="mykeymykeymykeym";
}
QString Youkuurldec::aesdec(QString datas, int blanknum)
       {

        int i;
        QByteArray data;
        data.resize(datas.size());
        for(i=0;i<datas.size();i++)
           {
            data.append(datas.at(i));
           }

        TAesClass aes;
        aes.InitializePrivateKey(Bits128, (UCHAR*)key.constData());
        QByteArray temp = QByteArray::fromBase64(data);
        char decodedData[4096];
        aes.OnAesUncrypt((LPVOID)temp.constData(), (DWORD)temp.length(), (LPVOID)decodedData);
        QString decodedByteArray;
        decodedByteArray.resize(strlen(decodedData)-blanknum);

        for(i=0;i<strlen(decodedData)-blanknum;i++)
           {
            decodedByteArray[i]=QChar(decodedData[i]);
           }
        //qDebug("here");
        //QByteArray decodedByteArray;
        //decodedByteArray.append(decodedData, strlen(decodedData)-blanknum);
        return decodedByteArray;
       }
