// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: root;
    property alias model: repeater.model;
    property alias delegate: repeater.delegate;
    width: 200;
    height: column.height + 36;
    anchors.centerIn: parent;
    state: "closed";
    color: "black";
    radius: 12;
    Column{
        id: column;
        anchors.centerIn: parent;
        spacing: 18;
        Repeater{
            id: repeater;
        }
    }

    states: [
        State {
            name: "opened";
            PropertyChanges {
                target: root;
                visible: true;
                opacity: 0.5;
                scale: 1;
            }
        },
        State {
            name: "closed";
            PropertyChanges {
                target: root;
                visible: false;
                opacity: 0;
                scale: 0.5;
            }
        }
    ]

    transitions: [
        Transition {
            from: "opened";
            to: "closed";
            reversible: true;
            PropertyAnimation{
                target: root;
                properties: "scale,opacity";
                duration: 200;
            }
        }
    ]

    Timer {
        id: hideTimer;
        running: root.state === "opened";
        interval: 5000;
        onTriggered: root.state = "closed";
    }

    function open(){
        if(state != "opened"){
            state = "opened";
        }
    }

    function close(){
        if(state != "closed"){
            state = "closed";
        }
    }
}
