// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"
ListRect{
    width: 180;
    height: 60;
    Text{
        anchors.centerIn: parent;
        width: 162;
        clip: true;
        text: (index+1) + " " + model.keyword;
        font.pixelSize: 18;
        color: "#3c3c3c";
    }
    onClicked: {
        searchfield.text = model.keyword;
    }
}
