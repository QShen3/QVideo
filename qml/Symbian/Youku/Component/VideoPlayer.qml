// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtMultimediaKit 1.1
import QtMobility.systeminfo 1.1
import com.nokia.symbian 1.1
Item{
    id: root;
    width: 360;
    height: 202.5;
    property variant urls;
    property variant segs;

    property int index: 0;
    property int total: 0;

    property int totalMilliseconds: 0;
    property int currentMilliseconds: 0;
    property int position: 0;

    property ListModel streamModel;

    clip: true;

    states: [
        State{
            name: "";
            PropertyChanges {
                target: root;
                width: 360;
                height: 202.5;
                rotation: 0;
                x: 0;
                y: 0;
            }
            PropertyChanges{
                target: app;
                showStatusBar: true;
                showToolBar: true;
            }
        },
        State{
            name: "FullScreen";
            PropertyChanges{
                target: root;
                width: 640;
                height: 360;
                rotation: 90;
                x: -140;
                y: 140
            }
            PropertyChanges{
                target: app;
                showStatusBar: false;
                showToolBar: false;
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
    Rectangle{
        anchors.fill: parent;
        color: "white";
    }

    ScreenSaver {
        id: screenSaver;
    }

    //Rectangle{
    Video{
        id: video;
        anchors.fill: parent;
        volume: volumeIndicator.volume / 100;
        onStatusChanged: {
            videoStatusDebug(status)
            if(status == Video.EndOfMedia){                
                //stop();
                console.log(index + " || " + total);
                currentMilliseconds += segs[index].total_milliseconds_video;
                index++;
                if(index != total){
                    source = urls[index];
                    console.log(source);
                    play();
                }
                else{
                    root.stop();
                }
            }

        }
        onError: {
            videoErrorDebug(error);
            index = total;
            video.stop();
            signalcenter.showMessage(errorString);
        }
        onStarted: {
            screenSaver.setScreenSaverDelayed(true);
            adjustScreen.start();
        }
        onStopped: {
            screenSaver.setScreenSaverDelayed(false);
        }
        onVolumeChanged: {
            console.log(volume);
        }

        BusyIndicator{
            id: busyindicator;
            anchors.centerIn: parent;
            visible: parent.status == Video.Buffering;
            running: visible;
        }
    }

    Item{
        id: control;
        anchors.fill: parent;
        Timer {
            id: controlHideTimer;
            running: bottomBar.state === "";
            interval: 5000;
            onTriggered: bottomBar.state = "Hidden";
        }

        MouseArea {
            id: mouseArea;
            property int pressedX;
            property int pressedY;
            anchors.fill: parent;
            onClicked: {
                bottomBar.state = bottomBar.state === "" ? "Hidden" : "";
            }
            onPressed: {
                //console.log(mouse.x + "," + mouse.y);
                pressedX = mouse.x;
                pressedY = mouse.y;
            }
            onReleased: {
                if((mouse.x - pressedX) < -180){
                    if(video.hasVideo){
                        if(video.position > 5000){
                            video.position -= 5000;
                        }
                        else if(index > 0){
                            index--;
                            currentMilliseconds -= parseInt(segs[index].total_milliseconds_video);
                            video.source = urls[index];
                            video.play();
                        }
                    }
                }
                else if((mouse.x - pressedX) > 180){
                    if(video.hasVideo){
                        video.position += 5000;
                    }
                }

                if((mouse.y - pressedY) < -180){
                    volumeIndicator.volumeUp();
                }
                else if((mouse.y - pressedY) > 180){
                    volumeIndicator.volumeDown();
                }
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

            Rectangle {
                id: background;
                anchors.fill: parent;
                opacity: 0.5;
                color: "white";
                //source: privateStyle.imagePath("qtg_fr_toolbar",false);
                //border { left: 20; top: 20; right: 20; bottom: 20; }
            }
            Row{
                id: controlbuttons
                spacing: 9;
                anchors{
                    left: parent.left;
                    leftMargin: root.state=="" ? 3 : 9;
                    verticalCenter: parent.verticalCenter;
                }
                ToolButton{
                    anchors.verticalCenter: parent.verticalCenter;
                    platformInverted: true;
                    flat: true;
                    iconSource: video.paused ? "toolbar-mediacontrol-play" : "toolbar-mediacontrol-pause";
                    onClicked: video.paused ? video.play() : video.pause();
                }
                ToolButton{
                    anchors.verticalCenter: parent.verticalCenter;
                    platformInverted: true;
                    flat: true;
                    visible: root.state == "FullScreen";
                    iconSource: "toolbar-mediacontrol-backwards";
                    onClicked: {
                        if(video.hasVideo){
                            if(video.position > 10000){
                                video.position -= 10000;
                            }
                            else if(index > 0){
                                index--;
                                currentMilliseconds -= parseInt(segs[index].total_milliseconds_video);
                                video.source = urls[index];
                                video.play();
                            }
                        }
                    }
                }
                ToolButton{
                    anchors.verticalCenter: parent.verticalCenter;
                    platformInverted: true;
                    flat: true;
                    visible: root.state == "FullScreen";
                    iconSource: "toolbar-mediacontrol-forward";
                    onClicked: {
                        if(video.hasVideo){
                            video.position += 10000;
                        }
                    }
                }
            }

            ProgressBar {
                id: progressBar;
                anchors {
                    left: controlbuttons.right;
                    leftMargin: root.state == "" ? 3 : 9;
                    right: screenbutton.left;
                    rightMargin: root.state == "" ? 3 : 9;
                    verticalCenter: parent.verticalCenter;
                }
                platformInverted: true;
                //value: root.timePlayed / root.timeDuration;
                value: video.duration == 0 ? 0 : (currentMilliseconds + video.position) / totalMilliseconds;
            }
            Text{
                anchors.left: progressBar.left;
                anchors.top: progressBar.bottom;
                color: "black";
                font.pixelSize: 15;
                visible: root.state == "FullScreen";
                text: milliSecondsToString(currentMilliseconds + video.position);
            }
            Text{
                anchors.right: progressBar.right;
                anchors.top: progressBar.bottom;
                color: "black";
                font.pixelSize: 15;
                visible: root.state == "FullScreen";
                text: milliSecondsToString(totalMilliseconds);
            }

            ToolButton{
                id: streambutton;
                //property string currentStream: "";
                anchors{
                    right: screenbutton.left;
                    rightMargin: root.state == "" ? 3 : 9;
                    verticalCenter: parent.verticalCenter;
                }
                platformInverted: true;
                flat: true;
                text: currentFormat == "mp4" ? qsTr("High quality") : qsTr("General quality");
            }

            ToolButton{
                id: screenbutton;
                anchors{
                    right: parent.right;
                    rightMargin: root.state == "" ? 3 : 9;
                    verticalCenter: parent.verticalCenter;
                }
                platformInverted: true;
                flat: true;
                iconSource: root.state == "" ? "../../../pic/FullScreen.svg" : "../../../pic/miniScreen.svg";
                //onClicked: root.state == "" ? root.state = "FullScreen" : root.state = "";
                onClicked: {
                    if(root.state == ""){
                        root.state = "FullScreen";
                        volumeIndicator.rotation = 90;
                    }
                    else{
                        root.state = "";
                        volumeIndicator.rotation = 0;
                    }
                }
            }
        }
    }


    Timer{
        id: adjustScreen;
        interval: 500;
        onTriggered: {
            console.log("adjust");
            rotation++;
            rotation--;
        }
    }

    function setVideos(urls, segs){
        currentMilliseconds = currentMilliseconds + video.position;
        video.stop();
        root.total = segs.length;
        root.urls = urls;
        root.segs = segs;
        totalMilliseconds = 0;
        for(var i in segs){
            totalMilliseconds += parseInt(segs[i].total_milliseconds_video);
        }
    }
    function start(){
        if(totalMilliseconds == 0){
            return;
        }
        index = 0;
        if(currentMilliseconds != 0){
            var temp = currentMilliseconds
            for(var i in segs){
                if(temp - parseInt(segs[i].total_milliseconds_video) < 0){
                    index = i;
                    position = temp;
                    break;
                }
                else{
                    temp = temp - parseInt(segs[i].total_milliseconds_video);
                }
            }
        }
        video.source = urls[index];
        video.play();
    }

    function pause(){
        video.pause();
    }
    function stop(){
        index = 0;
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

    function videoStatusDebug(s){
        switch(s){
        case Video.NoMedia:
            console.log("NoMedia");
            break;
        case Video.Loading:
            console.log("Loading");
            break;
        case Video.Loaded:
            console.log("Loaded");
            break;
        case Video.Buffering:
            console.log("Buffering");
            break;
        case Video.Stalled:
            console.log("Stalled");
            break;
        case Video.EndOfMedia:
            console.log("EndOfMedia");
            break;
        case Video.InvalidMedia:
            console.log("InvalidMedia");
            break;
        case Video.UnknownStatus:
            console.log("UnknownStatus");
            break;
        default:
            console.log(s + ": Other");
            break;
        }
    }
    function videoErrorDebug(e){
        switch(e){
        case Video.NoError:
            console.log("NoError");
            break;
        case Video.ResourceError:
            console.log("ResourceError");
            break;
        case Video.FormatError:
            console.log("FormatError");
            break;
        case Video.NetworkError:
            console.log("NetworkError");
            break;
        case Video.AccessDenied:
            console.log("AccessDenied");
            break;
        case Video.ServiceMissing:
            console.log("ServiceMissing");
            break;
        }
    }
}
