import QtQuick 1.1
import com.nokia.meego 1.1
import com.nokia.extras 1.1
import QtMobility.systeminfo 1.1
import "../JavaScript/Utility.js" as Script
import "BaseComponent"
import "Dialog";
PageStackWindow{
    id: app;
    property bool loading;

    platformStyle: PageStackWindowStyle{
        inverted: true;
    }

    showStatusBar: true;

    //showToolBar: false;

    initialPage: HomePage{}

    InfoBanner{
        id:infobanner;

        y: 36;
    }



    SignalCenter{
        id:signalcenter;
    }

    NewVersionDialog{
        id: newversiondialog;
    }

    MessageDialog{
        id: messagedialog;
    }
    FirstOpenDialog{
        id: firstopendialog;
    }



    Component.onCompleted: {
        //console.log(children[3].children[0].source);
        //children[4].children[0].source = "";
        if(settings.autoCheckNewVersion){
            Script.utility.getVersion(loadVersionInfo, signalcenter.showMessage);
        }
        Script.utility.getMessage();
        if(appVersion > settings.version){
            firstopendialog.open();
            settings.version = appVersion;
        }
    }


    function loadVersionInfo(oritxt){
        var obj = JSON.parse(oritxt);

        if(Script.versionStringToInt(obj.meego.version) > Script.versionStringToInt(appVersion)){
            if(utility.getLocale().substring(0, 2) === "zh"){
                newversiondialog.openDialog(obj.meego.changeLog.zh, obj.meego.url);
            }
            else{
                newversiondialog.openDialog(obj.meego.changeLog.en, obj.meego.url);
            }
        }
    }

    function loadMessage(oritxt){
        var obj = JSON.parse(oritxt);
        var timeStamp = Math.round(new Date().getTime()/1000);

        if(obj.meego.hasMessage){
            if(timeStamp < obj.meego.endDate){
                messagedialog.openDialog(obj.meego.message);
            }
        }
    }
}
