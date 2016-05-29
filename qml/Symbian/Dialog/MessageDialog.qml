import QtQuick 1.1
import com.nokia.symbian 1.1
CommonDialog{
    id:root;
    property string message: "";
    titleText: qsTr("Message");
    platformInverted: true;
    buttonTexts: [qsTr("OK")];
    height: 430;
    content:Text{
        anchors{
            left: parent.left;
            right: parent.right;
            top: parent.top;
            margins: 15;
        }
        wrapMode: Text.WordWrap;
        text: message;
    }

    function openDialog(m){
        message = m;
        open();
    }
}

