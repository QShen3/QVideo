// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../../JavaScript/Youku.js" as Youku
Item{
    width: 80;
    height: 80;
    Text{
        anchors.centerIn: parent;
        font.pixelSize: 24;
        text: model.show_videostage;
        color: currentVideoId===model.videoid ? "#1080dd" : "#3c3c3c";
    }
    Rectangle{
        anchors.fill: parent;
        color: "#787878";
        opacity: 0.2;
        visible: mousearea.pressed;
    }

    MouseArea{
        id: mousearea
        anchors.fill: parent;
        onClicked: {
            currentVideoId = model.videoid;
            videoplayer.isNewVideo = true;
            Youku.youku.getPlay(currentVideoId, loadStreams, showVideosFailureInfo);

        }
    }
}
