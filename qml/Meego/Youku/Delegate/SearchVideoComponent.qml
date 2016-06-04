// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"

ListRect{
    width: 240;
    height: 220;
    Image{
        id: thumb;
        width: 240;
        height: 135;
        sourceSize: Qt.size(240, 135);
        source: model.img;
        Text{
            anchors{
                right: parent.right;
                bottom: parent.bottom;
                margins: 4;
            }
            color: "white";
            font.pixelSize: 20;
            text: model.duration;
        }
        Image{
            source: "../../../pic/vip_icon_corner_free.png";
            sourceSize: Qt.size(60, 60);
            height: sourceSize.height;
            width: sourceSize.width;
            visible: model.paid === 1;
        }
    }
    Column{
        anchors{
            left: parent.left;
            top: thumb.bottom;
            margins: 8;
        }
        Text{
            width: 224;
            color: "#3c3c3c";
            text: model.title;
            font.pixelSize: 20;
            wrapMode: Text.WordWrap;
            maximumLineCount: 2;
        }
        Text{
            color: "#787878";
            text: qsTr("Played:") + model.total_pv;
            font.pixelSize: 16;
        }
    }
    onClicked: {
        if(model.showid === ""){
            pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.videoid, title: model.title});
        }
        else{
            pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.showid, title: model.title, currentVideoId: model.videoid});
        }
    }
}
