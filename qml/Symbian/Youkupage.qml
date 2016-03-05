// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "BaseComponent"
import "../JavaScript/Request.js" as Request
MyPage{
    id:youkupage;
    title: qsTr("Youku");

    Head{
        id:head;
        titleText: title;
        z:1;
        Image{
            anchors.verticalCenter: parent.verticalCenter;
            anchors.right: parent.right;
            source: "../pic/youku_logo.svg";
        }
    }
    tools: ToolBarLayout{
        ToolButton{
            iconSource: "toolbar-back";
            onClicked: pageStack.pop();
            platformInverted: true;
        }
        ToolButton{
            iconSource: "toolbar-search"
            platformInverted: true;
        }
        ToolButton{
            iconSource: "toolbar-settings"
            platformInverted: true;
        }
    }

    Grid{
        anchors.fill: parent;
        anchors.rightMargin: 13;
        anchors.leftMargin: 13;
        anchors.topMargin: head.height+10;
        spacing: 14;
        columns: 2;
        Selectbutton{
            buttontext: "动漫";
            MouseArea{
                anchors.fill:parent;
                onClicked: pageStack.push(Qt.resolvedUrl("Youkulistpage.qml"),{cid:"100"});
            }
        }
        Selectbutton{
            buttontext: "电影";
            MouseArea
            {
                anchors.fill:parent;
                onClicked: pageStack.push(Qt.resolvedUrl("Youkulistpage.qml"),{cid:"96"});
            }
        }
        Selectbutton{
            buttontext: "电视剧";
            MouseArea
            {
                anchors.fill:parent;
                onClicked: pageStack.push(Qt.resolvedUrl("Youkulistpage.qml"),{cid:"97"});
            }
        }
        Selectbutton{
            buttontext: "综艺";
            MouseArea
            {
                anchors.fill:parent;
                onClicked: pageStack.push(Qt.resolvedUrl("Youkulistpage.qml"),{cid:"85"});
            }
        }
    }
}
