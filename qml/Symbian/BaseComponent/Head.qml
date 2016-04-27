// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Rectangle{
    property alias titleText: headtext.text;
    property alias shadowOpacity: shadow.opacity;
    anchors.top: parent.top;
    height: 55;
    width: 360;
    color: "#f5f5f5";
    //source: "../../pic/Headerbar.svg";
    Image {
        anchors.fill: parent;
        source: "../../pic/Headerbar.svg";
    }
    Text{
        id:headtext;
        anchors{
            verticalCenter: parent.verticalCenter;
            verticalCenterOffset: 1;
            left: parent.left;
            leftMargin: 15;
        }
        font.pixelSize: 24;
    }
    Image{
        id:shadow;
        anchors.top: parent.bottom;
        source: "../../pic/HeadShadow.png";
        opacity: 0.75;
    }
}
