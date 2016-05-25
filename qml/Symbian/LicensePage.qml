// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "BaseComponent"

MyPage{
    id: licensePage;
    property string fileName;
    title: qsTr("License");

    Head{
        id:head;
        titleText: title;
        z:1;
    }

    tools: MyToolBarLayout{
        ToolButton{
            iconSource: "toolbar-back";
            onClicked:{
                pageStack.pop();
            }
            platformInverted: true;
        }
    }

    Flickable{
        id: licenseflicker;
        anchors{
            fill: parent;
            topMargin: head.height + 20;
        }
        flickableDirection: Flickable.VerticalFlick;
        clip: true;
        contentHeight: license.height;
        Text{
            id: license;
            anchors.horizontalCenter: parent.horizontalCenter;
            width: 330;
            wrapMode: Text.WordWrap;
            text: utility.readFile(fileName);
            color: "#3c3c3c";
        }
    }
    ScrollDecorator{
        flickableItem: licenseflicker;
        platformInverted: true;
    }
}
