import QtQuick 1.1
import com.nokia.meego 1.1
Dialog{
    id:root;
    property string message: "";
    title: qsTr("Message");
    height: 430;
    content:Flickable{
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
            color: "white";
            font.pixelSize: 24;
            wrapMode: Text.WordWrap;
            text: message;
        }
    }

    function openDialog(m){
        message = m;
        open();
    }
}

