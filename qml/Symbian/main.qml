import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
import QtMobility.systeminfo 1.1
import "../JavaScript/Utility.js" as Utility
import "BaseComponent"
import "Dialog";
PageStackWindow{
    id: app;
    property bool loading;

    platformInverted: true;

    showStatusBar: true;

    focus: true;

    //showToolBar: false;

    initialPage: HomePage{}

    InfoBanner{
        id:infobanner;
    }

    Corners{
        id:corners;
        z:1;
        visible: app.showStatusBar;
    }

    VolumeIndicator {
        id: volumeIndicator

        function initVolume() {
            console.log("volume: " + deviceInfo.voiceRingtoneVolume);
            if (deviceInfo.voiceRingtoneVolume == 0) {
                saveVolumeListener.target = null
                volumeIndicator.volume = 0
            }
            else {
                //volumeIndicator.volume = qmlApi.getVolume()
                volumeIndicator.volume = settings.volume;
                saveVolumeListener.target = volumeIndicator
            }
        }

        function startTracking() {
            saveVolumeListener.target = volumeIndicator
        }

        Connections {
            id: saveVolumeListener
            target: null
            //onVolumeChanged: qmlApi.saveVolume(volumeIndicator.volume)
            onVolumeChanged: settings.volume = volumeIndicator.volume;
        }

        DeviceInfo {
            id: deviceInfo
            monitorCurrentProfileChanges: true
            onCurrentProfileChanged: {
                volumeIndicator.initVolume()
            }
        }
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

    Keys.onVolumeUpPressed: {
        volumeIndicator.volumeUp()
    }
    Keys.onVolumeDownPressed: volumeIndicator.volumeDown()
    Keys.onUpPressed: volumeIndicator.volumeUp()
    Keys.onDownPressed: volumeIndicator.volumeDown()


    Component.onCompleted: {
        //console.log(children[3].children[0].source);
        //children[4].children[0].source = "";
        volumeIndicator.initVolume();
        if(settings.autoCheckNewVersion){
            Utility.utility.getVersion(loadVersionInfo, signalcenter.showMessage);
        }
        Utility.utility.getMessage();
        if(appVersion > settings.version){
            firstopendialog.open();
            settings.version = appVersion;
        }
    }


    function loadVersionInfo(oritxt){
        var obj = JSON.parse(oritxt);

        if(Utility.versionStringToInt(obj.symbian.version) > Utility.versionStringToInt(appVersion)){
            if(utility.getLocale().substring(0, 2) === "zh"){
                newversiondialog.openDialog(obj.symbian.changeLog.zh, obj.symbian.url);
            }
            else{
                newversiondialog.openDialog(obj.symbian.changeLog.en, obj.symbian.url);
            }
        }
    }

    function loadMessage(oritxt){
        var obj = JSON.parse(oritxt);
        var timeStamp = Math.round(new Date().getTime()/1000);

        if(obj.symbian.hasMessage){
            if(timeStamp < obj.symbian.endDate){
                messagedialog.openDialog(obj.symbian.message);
            }
        }
    }
}
