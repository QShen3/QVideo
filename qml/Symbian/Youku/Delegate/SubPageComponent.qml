// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"

ListRect{
    width: 120;
    height: trumble.height + 48;
    Image{
        id: trumble;
        anchors.horizontalCenter: parent.horizontalCenter
        width: 118;
        //height: 178 / sourceSize.width * sourceSize.height;
        height: 100;
        smooth: true;
        source: img;
        Text{
            anchors{
                left: parent.left;
                bottom: parent.bottom;
                margins: 4;
            }
            text: model.stripe;
            color: "white";
            font.pixelSize: 15;
            //Component.onCompleted: console.log(font.pixelSize)
        }
        onStatusChanged: {
            if(status == Image.Ready){
                height = 118 / sourceSize.width * sourceSize.height;
            }
        }
    }
    Column{
        anchors{
            top: trumble.bottom;
            left: parent.left;
            margins: 6;
        }
        Text{
            width: 108;
            clip: true;
            text: model.title;
            font.pixelSize: 15;
        }
        Text{
            width: 108;
            clip: true;
            text: model.subtitle;
            color: "gray";
            font.pixelSize: 12;
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
