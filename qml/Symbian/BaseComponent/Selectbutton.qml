// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Image{
    property string imagesour:"../../pic/QVideo80.png";
    property string buttontext;
    source: "../../pic/main-button.svg";
    Image{
        id:image;
        anchors.left: parent.left;
        smooth: true;
        source: imagesour;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.margins: 20;
        width: height;
    }
    Text{
        anchors.left: image.right;
        anchors.leftMargin: 5;
        anchors.right: parent.right;
        anchors.verticalCenter: parent.verticalCenter;
        text: buttontext;

    }
}
