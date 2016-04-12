// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtMultimediaKit 1.1
import com.nokia.symbian 1.1
Item{
    id: root;
    width: 360;
    height: 202.5;
    property variant urls;
    property int index: 0;
    property int total;

    states: [
        State{
            name: "";
            PropertyChanges {
                target: root;
                width: 360;
                height: 202.5;
                rotation: 0
            }
        },
        State{
            name: "FullScreen";
            PropertyChanges{
                target: root;
                width: 640;
                height: 360;
                rotation: 90;
            }
        }
    ]
    transitions: [
        Transition{
            NumberAnimation{
                properties: "width,height,rotation";
            }
        }
    ]
    Video{
        id: video;
        anchors.fill: parent;
        autoLoad: false;
        //seekable: true;
        source: urls[index];
        volume: 0;
        onStatusChanged: {
            console.log("status: " + status)
            if(status == Video.EndOfMedia){
                console.log(index + " || " + total);
                index++;
                if(index != total){
                    source = urls[index];
                    play();
                }
            }
        }
        onError: {
            index = total;
            video.stop();
            signalcenter.showMessage(errorString);
        }

        BusyIndicator{
            id: busyindicator;
            anchors.centerIn: parent;
            visible: parent.status == Video.Buffering;
        }
    }

    Item{
        id: control;
        property bool autoHide;
        property bool isPlaying;
        property int timePlayed;
        property int timeDuration;
        property bool backFreezed;

        anchors.fill: parent;
        visible: parent.state === "FullScreen"
        Timer {
            id: controlHideTimer;
            running: bottomBar.state === "";
            interval: 5000;
            onTriggered: bottomBar.state = "Hidden";
        }

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked: {
                bottomBar.state = bottomBar.state === "" ? "Hidden" : "";
            }
        }
        Item {
            id: bottomBar;
            width: parent.width;
            height: 65;
            y: parent.height - 65;

            states: [
                State {
                    name: "Hidden";
                    PropertyChanges {
                        target: bottomBar;
                        y: root.height;
                        opacity: 0.0;
                    }
                }
            ]
            transitions: [
                Transition {
                    from: ""; to: "Hidden"; reversible: true;
                    ParallelAnimation {
                        PropertyAnimation {
                            properties: "opacity"
                            easing.type: Easing.InOutExpo
                            duration: 150;
                        }
                        PropertyAnimation {
                            properties: "y"
                            duration: 350;
                        }
                    }
                }
            ]

            BorderImage {
                id: background;
                anchors.fill: parent;
                opacity: 0.8;
                source: privateStyle.imagePath("qtg_fr_toolbar",false);
                border { left: 20; top: 20; right: 20; bottom: 20; }
            }
            ToolButton {
                id: backbutton;
                enabled: !control.backFreezed;
                flat: true;
                iconSource: "toolbar-back";
                width: 50;
                height: 50;
                anchors {
                    left: parent.left;
                    leftMargin: 5;
                    verticalCenter: parent.verticalCenter;
                }
                onClicked: {
                    //root.backPressed();
                }
            }
            Rectangle {
                id: separatorLine;
                width: 1;
                color: "#303030";
                anchors {
                    top: parent.top;
                    bottom: parent.bottom;
                    left: backbutton.right;
                    leftMargin: 5;
                }
            }
            Button {
                id: playButton;
                iconSource: root.isPlaying
                            ?privateStyle.imagePath("toolbar-mediacontrol-pause")
                            :privateStyle.imagePath("toolbar-mediacontrol-play");
                width: 50;
                height: 50;
                anchors {
                    verticalCenter: parent.verticalCenter;
                    left: separatorLine.right;
                    leftMargin: 5;
                }
                onClicked: {
                    if (root.isPlaying){
                        //root.pausePressed();
                    } else {
                        //root.playPressed();
                    }
                }
            }
            Text {
                id: timeElapsedLabel;
                //text: milliSecondsToString(timePlayed);
                //font: constant.labelFont;
                color: platformStyle.colorNormalLight;
                anchors {
                    bottom: playButton.verticalCenter;
                    left: playButton.right;
                    right: parent.right;
                    leftMargin: 10;
                    rightMargin: 10;
                }
            }
            Text {
                id: timeDurationLabel;
                //text: milliSecondsToString(timeDuration);
                //font: constant.labelFont;
                color: platformStyle.colorNormalLight;
                anchors {
                    bottom: playButton.verticalCenter;
                    right: parent.right;
                    rightMargin: 10;
                }
            }
            ProgressBar {
                id: progressBar;
                anchors {
                    top: playButton.verticalCenter;
                    left: playButton.right;
                    right: timeDurationLabel.right;
                    leftMargin: 10;
                }
                //value: root.timePlayed / root.timeDuration;
            }
        }

        Row {
            id: controlButtons;
            anchors.centerIn: parent;
            //opacity: timeDuration>0 && !isPlaying ? 1 : 0;
            Behavior on opacity { NumberAnimation {} }
            spacing: 20;
            Button {
                platformAutoRepeat: true;
                anchors.verticalCenter: parent.verticalCenter;
                iconSource: privateStyle.toolBarIconPath("toolbar-mediacontrol-backwards");
                height: 50;
                width: 50;
                onClicked: {

                }
            }
            Button {
                anchors.verticalCenter: parent.verticalCenter;
                iconSource: privateStyle.toolBarIconPath("toolbar-mediacontrol-play");
                height: 60;
                width: 60;
                onClicked: {
                    video.pause();
                }
            }
            Button {
                platformAutoRepeat: true;
                anchors.verticalCenter: parent.verticalCenter;
                iconSource: privateStyle.toolBarIconPath("toolbar-mediacontrol-forward");
                height: 50;
                width: 50;
                onClicked: {

                }
            }
        }
    }

    function start(index, position){
        console.log("start");
        root.index = index;
        root.total = urls.length;
        video.source = urls[index];

        console.log(video.source);
        video.play();

        console.log("duration: " + video.duration)
        console.log("seekable: " + video.seekable)
    }


    function pause(){
        video.pause();
    }
    function stop(){
        index = total;
        video.stop();
    }

    function milliSecondsToString(milliseconds) {
        milliseconds = milliseconds > 0 ? milliseconds : 0;
        var timeInSeconds = Math.floor(milliseconds / 1000);
        var minutes = Math.floor(timeInSeconds / 60);
        var minutesString = minutes < 10 ? "0" + minutes : minutes;
        var seconds = Math.floor(timeInSeconds % 60);
        var secondsString = seconds < 10 ? "0" + seconds : seconds;
        return minutesString + ":" + secondsString;
    }
}
