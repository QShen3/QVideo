import QtQuick 2.5
import Material 0.2

Image{
    width: parent.width;
    height: width / 16 * 9;
    source: model.img;
    clip: true;
    fillMode: Image.PreserveAspectCrop;
    Label{
        anchors{
            left: parent.left;
            bottom: parent.bottom;
            margins: Units.dp(12);
        }
        text: model.title;
        style: "subheading"
        color: Palette.colors["grey"]["100"];
    }
    Image{
        source: "../../../pic/vip_icon_corner_free.png";
        sourceSize: Qt.size(Units.dp(45), Units.dp(45));
        height: sourceSize.height;
        width: sourceSize.width;
        visible: model.paid === 1;
    }
    MouseArea{
        anchors.fill: parent;
        onClicked: {
            /*if(model.is_vv === 1){
                pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title, currentVideoId: model.tid});
            }
            else
                pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title});
        */
        }
    }
}
