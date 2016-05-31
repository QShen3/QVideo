// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1
import "BaseComponent"

MyPage{
    id: licensePage;
    property string fileName;
    property string textString: qsTr("******profile******");
    title: qsTr("License");

    Head{
        id:head;
        titleText: title;
        z:1;
    }

    tools: ToolBarLayout{
        ToolIcon{
            iconId: "toolbar-back";
            onClicked:{
                pageStack.pop();
            }
            platformStyle: ToolItemStyle{
                inverted: true;
            }
        }
    }

    Flickable{
        id: licenseflicker;
        anchors{
            fill: parent;
            topMargin: head.height + 27;
        }
        flickableDirection: Flickable.VerticalFlick;
        clip: true;
        contentHeight: license.height;
        Text{
            id: license;
            anchors.horizontalCenter: parent.horizontalCenter;
            width: 440;
            wrapMode: Text.WordWrap;
            font.pixelSize: 24;
            text: title===qsTr("License")?utility.readFile(fileName):textString;
            color: "#3c3c3c";
        }
    }
    ScrollDecorator{
        flickableItem: licenseflicker;
        platformStyle: ScrollDecoratorStyle{
            inverted: true;
        }
    }
}
