// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"

ListRect{
    width: 160;
    height: trumble.height + 64;
    Image{
        id: trumble;
        anchors.horizontalCenter: parent.horizontalCenter
        width: 158;
        //height: 178 / sourceSize.width * sourceSize.height;
        height: 133;
        //smooth: true;
        source: img;
        Text{
            anchors{
                left: parent.left;
                bottom: parent.bottom;
                margins: 5;
            }
            text: model.stripe;
            color: "white";
            font.pixelSize: 20;
            //Component.onCompleted: console.log(font.pixelSize)
        }
        Image{
            source: "../../../pic/vip_icon_corner_free.png";
            sourceSize: Qt.size(60, 60);
            height: sourceSize.height;
            width: sourceSize.width;
            visible: model.paid === 1;
        }
        onStatusChanged: {
            if(status == Image.Ready){
                height = 158 / sourceSize.width * sourceSize.height;
            }
        }
    }
    Column{
        anchors{
            top: trumble.bottom;
            left: parent.left;
            margins: 8;
        }
        Text{
            width: 144;
            clip: true;
            text: model.title;
            font.pixelSize: 20;
            color: "#3c3c3c";
        }
        Text{
            width: 144;
            clip: true;
            text: model.subtitle;
            color: "#787878";
            font.pixelSize: 16;
        }
    }
    onClicked: {
        if(model.is_vv === 1){
            pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title, currentVideoId: model.tid});
        }
        else
            pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title});
    }
}
