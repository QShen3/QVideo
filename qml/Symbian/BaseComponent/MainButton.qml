// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Image{
    property alias icoUrl: icon.source;
    source: "../../pic/main-button.svg";
    Image{
        id:icon;
        width: 150;
        height: 75;
        anchors.centerIn: parent;
        smooth: true;
    }
}
