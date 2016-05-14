import QtQuick 1.1
import com.nokia.symbian 1.1
import "BaseComponent"
MyPage{
    id:homepage;
    title: "QVideo";

    Head{
        id:head;
        titleText: title;
        z:1;
    }

    tools: MyToolBarLayout{

        ToolButton{
            iconSource: "toolbar-back";
            onClicked:{
                if(quitTimer.running){
                    //saveDownloadData();
                    Qt.quit();
                }
                else{
                    infobanner.text=qsTr("Please click again to quit");
                    infobanner.open();
                    quitTimer.start();
                }
            }
            platformInverted: true;
        }
        /*ToolButton{
            iconSource: "../pic/pull_down.svg";
            onClicked: pageStack.push(Qt.resolvedUrl("Downloadpage.qml"))
            platformInverted: true;
        }*/
        ToolButton{
            iconSource: "toolbar-settings"
            platformInverted: true;
            onClicked: pageStack.push(Qt.resolvedUrl("SettingPage.qml"));
        }
        Timer{
            id: quitTimer;
            interval: 3000;
            running: false;
            repeat: false;
        }
        /*Rectangle{
            anchors.fill: parent;
            color: "yellow"
        }*/
    }

    Grid{
        anchors.fill: parent;
        anchors.rightMargin: 13;
        anchors.leftMargin: 13;
        anchors.topMargin: head.height+10;
        spacing: 14;
        columns: 2;
        MainButton{
            icoUrl: "../pic/youku_logo.svg";
            MouseArea{
                anchors.fill: parent;
                onClicked: pageStack.push(Qt.resolvedUrl("Youku/MainPage.qml"))
            }
        }
        MainButton{
            icoUrl: "../pic/tudou_logo.svg";
            MouseArea{
                anchors.fill: parent;
                //onClicked: pageStack.push(Qt.resolvedUrl("Tudoupage.qml"))
                onClicked: signalcenter.showMessage(qsTr("Stay tuned..."));
            }
        }
        MainButton{
            icoUrl: "../pic/PPTV_logo.svg";
            MouseArea{
                anchors.fill: parent;
                //onClicked: pageStack.push(Qt.resolvedUrl("PPTVpage.qml"));
                onClicked: signalcenter.showMessage(qsTr("Stay tuned..."));
            }
        }
        MainButton{
            icoUrl: "../pic/Qiyi_logo.svg";
            MouseArea{
                anchors.fill: parent;
                //onClicked: pageStack.push(Qt.resolvedUrl("PPTVpage.qml"));
                onClicked: signalcenter.showMessage(qsTr("Stay tuned..."));
            }
        }
        MainButton{
            icoUrl: "../pic/letv_logo.svg";
            MouseArea{
                anchors.fill: parent;
                //onClicked: pageStack.push(Qt.resolvedUrl("PPTVpage.qml"));
                onClicked: signalcenter.showMessage(qsTr("Stay tuned..."));
            }
        }
    }
    Keys.onPressed: {
        console.log("hkey"+  key)
    }

}
