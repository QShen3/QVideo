// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../BaseComponent"
ListRect{
    width: 160;
    height: 270;
    shadowsize: 4;
    Image{
        id:thum;
        anchors.top:parent.top;
        anchors.right: parent.right;
        anchors.left: parent.left;
        sourceSize.height: 240;
        sourceSize.width: 160;
        height: 240;
        width: 160;
        source: model.show_vthumburl_hd;
        smooth: true;
    }
    Rectangle{
        anchors.right: parent.right;
        anchors.left: parent.left;
        anchors.bottom: thum.bottom;
        color: "black";
        opacity: 0.4;
        height: 25;
        Text{
            anchors.left: parent.left;
            anchors.leftMargin: 3;
            anchors.verticalCenter: parent.verticalCenter;
            text: model.middle_stripe||"";
            font.pixelSize: 15;
            color: "white";
            smooth: true;
        }
        Text {
            anchors.right: parent.right;
            anchors.rightMargin: 3;
            anchors.verticalCenter: parent.verticalCenter;
            text: model.stripe_bottom||model.reputation;
            font.pixelSize: 16;
            color: "red";
            font.weight: Font.Black;
            smooth: true;
            //visible:model.type!=="show";
        }
    }
    Text {
        anchors.top: thum.bottom;
        anchors.topMargin: 5;
        anchors.left: parent.left;
        anchors.leftMargin: 5;
        text: model.showname;
        font.pixelSize: 16;
        smooth: true
    }
    MouseArea{
        anchors.fill: parent;
        //onClicked: pageStack.push(Qt.resolvedUrl("../Youkuplaypage.qml"),{id:model.tid,title:model.showname,thumurl:model.show_thumburl_hd});
    }
}

