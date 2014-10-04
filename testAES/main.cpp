#include <QtCore/QCoreApplication>
#include <QDebug>

#include "TAesClass.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);


    FILE *fp;
    fp=fopen("out.txt","w");
    int i;



    //服务器返回的blank_num值
    int blank_num = 0;
    //服务器返回的data值
    QByteArray data = "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";

    // AES解密的帮助类
    TAesClass aes;

    // 优酷密钥，常量
    QByteArray key = "qwer3as2jin4fdsa";
    // 初始化密钥
    aes.InitializePrivateKey(Bits128, (UCHAR*)key.constData());

    // 先做Base64解密
    QByteArray temp = QByteArray::fromBase64(data);

    char decodedData[4096];
    // 再做AES解密
    aes.OnAesUncrypt((LPVOID)temp.constData(), (DWORD)temp.length(), (LPVOID)decodedData);

    // 用于保存解密结果
    QByteArray decodedByteArray;
    decodedByteArray.append(decodedData, strlen(decodedData)-blank_num);

    // 输出结果
    qDebug() << decodedByteArray;


    for(i=0;i<decodedByteArray.size();i++)
       {
        fprintf(fp,"%c",decodedByteArray.at(i));
       }


    return a.exec();
}
