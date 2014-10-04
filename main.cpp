#include <QtGui/QApplication>
#include <QtDeclarative>
#include "qmlapplicationviewer.h"
#include "utility.h"
#include "Youkuurldec.h"
#include "Qcurl.h"
Q_DECL_EXPORT int main(int argc, char *argv[])
{
    QScopedPointer<QApplication> app(createApplication(argc, argv));

    QmlApplicationViewer viewer;

    Utility utility;
    Youkuurldec youkuurldec;
    Qcurl qcurl;
    QString data=youkuurldec.aesdec("ECFyshLb/bBpjA7WHdOMB8s32Jd5z8YJjWU83l1xAkJY5cW0h3nkNZHAy/einSZOwSAj/3EnRO47Osagf6fQ7bBQcQzxVG91TSURupj34SVnrT/24TdWks5ShQG69aj7eSTOuyLcG1IYf9d7SwQEz2Lv1/e/FB4DQnMtB9HrzH9uJ29ni+a1azY5hMMq7HQyDeSlFzxVCX2aeUenIYt+9kb0DdMTh5S5lagooejFP3nAu4FEqrYu6RnSgTub0FyGBrY0PwadWkWjx58D1Om3E2vKnYiDKvR37Vc3G+maGVnuG3xv3QyBTmtjH+QJj5ceBLVnhavt1DJoNUME42uJLelwG/9+KdUhv3LIuZ+vmIvTjL0X3mOXCJflRps5umVHeYwgcqUzPscExFg7/BIDEflJkJzZWEMpGhgGNH3akb/uSFkH5PS7avWXiu2F6Bfaq9acxu6exfjncXj1i8GSB3LEq8S24pVIL0HNW8JYTx6rvsuVUjkwjYTywU8zyHGDphntCO/VgMbneqDJHI3rcdew81CN/XMapSzrZ/HFDBQDBUnK4v/h/LObh2wKGqf4hF3LNTJ6I9gnxczMCcrYpm0u0kARz3U3XCg9j7yu6sP7KHpff+JXyTfwIyaY8uhdviUQZ033TxTE25yhvsgyW95/4P9x6Vaj0y1DNstv5i9iXtL5PGiZqsj8s/PH8/bFAom1/H/aT3Rbdc2wr14xVEaiDSv0LSDPJiDVxOmHtDUeA1I2Ywmd47YcwHs+WVwP9hwi8d1UvldGuADVOOJ7GN62SdcNdYVNNOBXwiRyUFGSEZ+Xc/C9kdyFML1ZaZqXf4I34UwdIP3XCllAea6B5t0R2+W0VnmFaqWmN8JPEV6B+DAKJQqUcIJsKH1vGEbWxlKrUDnV4Ub2yOe3C91Z36VfUMdwSl9jISRZEIiqHb4vMoWXC2jL0/Rru3GNUWZnZwR4XL22N6XPwAZf6+9dGmDND00RmWOhmJAZ8t4wheLvrQcGdPIg0dMMqrTRgpIKZxM91T2Xf5ZNnSvLKliTCDOp75VLr84agKHc9gJ8P8kqe/LsINChJbV96esdeHlHM4w0aZFDN+d9NQO4HZfzbxCNKU8Hdey2BPUM0LsvZD9WzQoGGHQZLdvzCtfCcL2kMTkiVqhnhN127e3P0sPRgp14n/IIb/lJY+fWckOpumT2nXPnZnl18C6N6aWA4s7xOKQI/RLlMz5BG9fPwQ01tA9uJPXT1PEx4cL7wZnXLQTFNOJxI79yRNVizwWyYuSxvwChGZEV6GSV6ig3RIQb0vG91fyCQUAgwlrNoF8TGAYpPFQGdq5mcSCArJe8JsGXdl7pDecAElCNUtdnyS1hR9ZZ0R1vHFcDLNSRXQa0EA41e8Zmt31O72UnI0Khz8pBopK3edhVz0+UJy2o8sa6dV9O/kUXEs9SfiFyXEimoZ0OXrqADS4vMtDDJZX1S922EWTaJPlSy+kbQ5AfRk1KtnYH9j9AOMkwTlwNM1xV2g0qwDLN6zFXkLlhUmzzDyuufNE/UwPOnus4X4zAwgZ1khD5dWnC8XCpBKBxH2nIXSCfk+33OtIbl/FohQB4CCtyHzZbdl2XetF8hs4rJU2Zbl4Tin3u09cvKoUWth4axip7v7lrZgLJ4b+pqDgimE/XprivWTfDdTw3KKcM+nIHGpO2jT7ApWjPTbIul/Z6mPFGPqlwFQdrNM0yfNc1YK1hCwU98gEsPi+6OJcvu/VcAEzDN+NvsdLJUpJ4vy3aOSAO3vpGAEEEHbs1cz45hjSeLlsy+DXQYu+M/do4FOQJdw==",4);
    //qDebug() << data;

    viewer.rootContext()->setContextProperty("youkuurldec",&youkuurldec);
    viewer.rootContext()->setContextProperty("utility", &utility);
    viewer.rootContext()->setContextProperty("qcurl",&qcurl);
    viewer.setMainQmlFile(QLatin1String("qml/QVideoSymbian/main.qml"));
    viewer.showExpanded();

    return app->exec();
}
