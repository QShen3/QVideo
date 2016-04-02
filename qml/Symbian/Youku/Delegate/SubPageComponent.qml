// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"

ListRect{
    width: 120;
    height: trumble.height + 36;
    Image{
        id: trumble;
        anchors.horizontalCenter: parent.horizontalCenter
        width: 118;
        //height: 178 / sourceSize.width * sourceSize.height;
        height: 100;
        source: img;
        Text{
            anchors{
                left: parent.left;
                bottom: parent.bottom;
                margins: 4;
            }
            text: model.stripe;
            color: "white";
            font.pixelSize: 10;
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
            text: model.title;
            font.pixelSize: 10;
        }
        Text{
            text: model.subtitle;
            color: "gray";
            font.pixelSize: 8;
        }
    }
    onClicked: {
        pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid});
    }
}
