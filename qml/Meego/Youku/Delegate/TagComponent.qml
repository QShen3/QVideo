// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"

ListRect{
    id: root;
    width: 160;
    height: 220;
    Column{
        anchors.centerIn: parent;
        spacing: 32;
        Image{
            anchors.horizontalCenter: parent.horizontalCenter;
            height: 93;
            width: 93;
            smooth: true;
            source: model.icon;
        }
        Text{
            anchors.horizontalCenter: parent.horizontalCenter;
            text: model.title;
            font.pixelSize: 24;
            color: "#3c3c3c";
        }
    }
}
