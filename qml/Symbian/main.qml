import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
import "BaseComponent"
PageStackWindow{
    id: app;
    property bool loading;

    platformInverted: true;

    showStatusBar: true;

    initialPage: HomePage{}

    InfoBanner{
        id:infobanner;
    }

    Corners{
        id:corners;
        z:1;
    }

    SignalCenter{
        id:signalcenter;
    }

}
