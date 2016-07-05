import QtQuick 2.5
import QtQuick.Window 2.2
import Material 0.2
import QtMultimedia 5.6
//import "../../BaseComponent"

Item {
    id: root;
    property alias playList: playList
    width: parent.width;
    height: width / 16 * 9;

    clip: true;

    states: [
        State{
            name: "";
            PropertyChanges {
                target: root;
                width: root.parent.width;
                height: width / 16 * 9;
                rotation: 0;
                x: 0;
                y: 0;
            }
            /*PropertyChanges{
                target: app;
                showStatusBar: true;
                showToolBar: true;
            }*/
        },
        State{
            name: "FullScreen";
            PropertyChanges{
                target: root;
                width: Screen.height
                height: Screen.width;
                rotation: 90;
                x: - (width - height) / 2;
                y: (width - height) / 2;
            }
            /*PropertyChanges{
                target: app;
                showStatusBar: false;
                showToolBar: false;
            }*/
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
        autoPlay: false;
        playlist: playList;
        ProgressCircle{
            id: busyindicator;
            anchors.centerIn: parent;
            visible: parent.status === (MediaPlayer.Buffering | MediaPlayer.Loading);
        }
    }

    Playlist{
        id: playList;
    }

    function start(){
        video.play();
    }
}
