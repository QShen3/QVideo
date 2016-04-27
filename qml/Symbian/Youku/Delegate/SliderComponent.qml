// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Image{
    width: 360;
    //height: 234;
    //height: 360 / sourceSize.width * sourceSize.height;
    height: 202.5;
    //sourceSize: Qt.size(360, 202.5);
    source: model.img;
    clip: true;
    fillMode: Image.PreserveAspectCrop;
    Text{
        anchors{
            left: parent.left;
            bottom: parent.bottom;
            margins: 12;
        }
        text: model.title;
        font.pixelSize: 21;
        color: "white";
    }
    MouseArea{
        anchors.fill: parent;
        onClicked: {
            if(model.is_vv === 1){
                pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title, currentVideoId: model.tid});
            }
            else
                pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title});
        }
    }
}
