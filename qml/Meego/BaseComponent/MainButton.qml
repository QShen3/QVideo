// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Image{
    property alias icoUrl: icon.source;
    source: "../../pic/main-button.svg";
    sourceSize: Qt.size(213, 113);
    Image{
        id:icon;
        width: 200;
        height: 100;
        anchors.centerIn: parent;
        smooth: true;
    }
}
