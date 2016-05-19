// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"

ListRect{
    width: 180;
    height: 165;
    Image{
        id: thumb;
        width: 180;
        height: 101;
        sourceSize: Qt.size(180, 101);
        source: model.img;
        Text{
            anchors{
                right: parent.right;
                bottom: parent.bottom;
                margins: 3;
            }
            color: "white";
            font.pixelSize: 15;
            text: model.duration;
        }
        Image{
            source: "../../../pic/vip_icon_corner_free.png";
            sourceSize: Qt.size(45, 45);
            height: sourceSize.height;
            width: sourceSize.width;
            visible: model.paid === 1;
        }
    }
    Column{
        anchors{
            left: parent.left;
            top: thumb.bottom;
            margins: 6;
        }
        Text{
            width: 168;
            color: "#3c3c3c";
            text: model.title;
            font.pixelSize: 15;
            wrapMode: Text.WordWrap;
            maximumLineCount: 2;
        }
        Text{
            color: "#787878";
            text: qsTr("Played:") + model.total_pv;
            font.pixelSize: 12;
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
