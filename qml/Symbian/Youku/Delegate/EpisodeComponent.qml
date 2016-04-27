// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    width: 60;
    height: 60;
    Text{
        anchors.centerIn: parent;
        text: model.show_videostage;
        color: currentVideoId===model.videoid ? "#1056dd" : "black";
    }
    Rectangle{
        anchors.fill: parent;
        color: "#787878";
        opacity: 0.2;
        visible: mousearea.pressed;
    }

    MouseArea{
        id: mousearea
        anchors.fill: parent;
    }

}
