import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
import "BaseComponent"
PageStackWindow
{
    id: app;
    property bool loading;

    platformInverted:true;

    showStatusBar: true;

    InfoBanner{
        id:infobanner;
    }
    LoadingIndicator{
        id:loadingind;
    }
    Corners{
        id:corners;
        z:1;
    }

    Signalcenter{
        id:signalcenter;
    }


    Timer{
        id:processingtimer;
        interval: 60000;
        onTriggered: signalcenter.loadFailed("erro");
    }

    Connections{
        target: signalcenter;
        onLoadStarted:
        {
            app.loading=true;
            loadingind.open();
            processingtimer.restart();
        }
        onLoadFinished:
        {
            app.loading=false;
            loadingind.close();
            processingtimer.stop();
        }
        onLoadFailed:
        {
            app.loading=false;
            loadingind.close();
            processingtimer.stop();
            showmessage(errorstring);
        }
    }

    ListModel{
        id:downloadmodel;
    }

    Component.onCompleted:{
        pageStack.push(Qt.resolvedUrl("HomePage.qml"));
    }
}
