import QtQuick 2.5
import Material 0.2
Rectangle {
    width: parent.width / 3;
    height: trumble.height + Units.dp(44);
    color: Palette.colors["grey"]["100"];
    Image{
        id: trumble;
        width: parent.width - 1;
        height: width / 9 *16;
        source: img;
        Label{
            anchors{
                left: parent.left;
                bottom: parent.bottom;
                margins: Units.dp(4);
            }
            text: model.stripe;
            color: Palette.colors["grey"]["200"];
            style: "caption";
        }
        Image{
            source: "../../../pic/vip_icon_corner_free.png";
            sourceSize: Qt.size(Units.dp(40), Units.dp(40));
            height: sourceSize.height;
            width: sourceSize.width;
            visible: model.paid === 1;
        }
        onStatusChanged: {
            if(status == Image.Ready && height != width / sourceSize.width * sourceSize.height){
                height = width / sourceSize.width * sourceSize.height;
            }
        }
    }
    Column{
        width: parent.width;
        anchors{
            top: trumble.bottom;
            left: parent.left;
            margins: Units.dp(4);
        }
        Label{
            width: parent.width - Units.dp(8);
            clip: true;
            text: model.title;
            style: "body1";
        }
        Label{
            width: parent.width - Units.dp(4);
            clip: true;
            text: model.subtitle;
            style: "caption";
        }
    }
    Rectangle{
        color: Palette.colors["grey"]["300"];
        width: 1;
        height: Units.dp(44);
        anchors{
            right: trumble.right
            top: trumble.bottom;
        }
    }
    Ink{
        anchors.fill: parent;
        onClicked: {
            if(model.is_vv === 1){
                //pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title, currentVideoId: model.tid});
            }
            else{
                //pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title});
            }
        }
    }
}
