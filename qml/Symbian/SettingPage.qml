// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "BaseComponent"
MyPage{
    id: settingpage;
    title: qsTr("Settings");
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
        anchors{
            fill: parent;
            topMargin: head.height + 20;
        }
        flickableDirection: Flickable.VerticalFlick;
        clip: true;
        contentHeight: settingscolumn.height;
        Column{
            id: settingscolumn;
            width: 360;
            CheckBox{
                anchors.left: parent.left;
                anchors.leftMargin: 10;
                text: qsTr("Auto play");
                platformInverted: true;
                checked: settings.autoPlay;
                onCheckedChanged: settings.autoPlay = checked;
            }
            SelectionListItem{
                title: qsTr("Prefer format for Youku");
                subTitle: settings.preferFormat==="mp4" ? qsTr("High quality") : qsTr("General quality");
                platformInverted: true;
                onClicked: preferformat.open();
            }
            Rectangle{
                height: 21;
                width: 1;
            }

            Button{
                anchors.horizontalCenter: parent.horizontalCenter;
                platformInverted: true;
                width: 300;
                text: qsTr("About");
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                }
            }

        }

    }
    ContextMenu{
        id: preferformat;
        platformInverted: true;
        MenuLayout{
            MenuItem{
                text: qsTr("High quality");
                platformInverted: true;
                onClicked: settings.preferFormat = "mp4";
            }
            MenuItem{
                text: qsTr("General quality");
                platformInverted: true;
                onClicked: settings.preferFormat = "3gphd";
            }
        }
    }
}
