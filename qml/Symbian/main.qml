import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
import QtMobility.systeminfo 1.1
import "BaseComponent"
PageStackWindow{
    id: app;
    property bool loading;

    platformInverted: true;

    showStatusBar: true;

    //focus: true;

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
    }

}
