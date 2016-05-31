import QtQuick 1.1
import com.nokia.meego 1.1
Dialog{
    id:root;
    title: qsTr("New Features");
    content: Flickable{
        anchors{
            left: parent.left;
            right: parent.right;
            top: parent.top;
        }
        height: 360;
        clip: true;
        contentHeight: text.height;
        Text{
            id: text;
            anchors{
                left: parent.left;
                right: parent.right;
                top: parent.top;
            }
            font.pixelSize: 24;
            color: "white";
            wrapMode: Text.WordWrap;
            //text: qsTr("2015.11.15\nV 0.7.0\n\n1.Add support for Tencent Weibo\n2.Some optimization");
            text: qsTr("Thank you for using this software.There are something need to be explained at first:\n1.This software only support Youku now.But I will add support to other sites in future.\n2.These sites usually change their algorithm of extracting video url.So I put the extrctor on my Web server.Once there are some unexpected things happen,I will stop the server.\n3.Because of the limited of Symbian system,the video will flash when you flick the screen.I haven't find any solution now.\n4.Auto playing can be closed in settings.");
        }
    }
}

