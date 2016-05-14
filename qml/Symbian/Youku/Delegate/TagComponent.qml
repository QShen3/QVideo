// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"

ListRect{
    id: root;
    width: 120;
    height: 165;
    Column{
        anchors.centerIn: parent;
        spacing: 24;
        Image{
            anchors.horizontalCenter: parent.horizontalCenter;
            height: 70;
            width: 70;
            source: model.icon;
        }
        Text{
            anchors.horizontalCenter: parent.horizontalCenter;
            text: model.title;
            font.pixelSize: 18;
            color: "#3c3c3c";
        }
    }
}
