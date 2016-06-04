// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"
ListRect{
    width: 240;
    height: 80;
    Text{
        anchors.centerIn: parent;
        width: 216;
        clip: true;
        text: (index+1) + " " + model.keyword;
        font.pixelSize: 24;
        color: "#3c3c3c";
    }
    onClicked: {
        searchfield.text = model.keyword;
    }
}
