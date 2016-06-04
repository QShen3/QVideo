import QtQuick 1.1
import com.nokia.meego 1.1
import "BaseComponent"
MyPage{
    id:homepage;
    title: "QVideo";

    Head{
        id:head;
        titleText: title;
        z:1;
    }

    tools: ToolBarLayout{

        ToolIcon{
            iconId: "toolbar-back";
            onClicked:{
                if(quitTimer.running){
                    //saveDownloadData();
                    Qt.quit();
                }
                else{
                    infobanner.text=qsTr("Please click again to quit");
                    infobanner.show()
                    quitTimer.start();
                }
            }
            platformStyle: ToolItemStyle{
                inverted: true;
            }
        }
        /*ToolButton{
            iconId: "../pic/pull_down.svg";
            onClicked: pageStack.push(Qt.resolvedUrl("Downloadpage.qml"))
            platformInverted: true;
        }*/
        ToolIcon{
            iconId: "toolbar-settings"
            platformStyle: ToolItemStyle{
                inverted: true;
            }
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
        anchors.rightMargin: 17;
        anchors.leftMargin: 17;
        anchors.topMargin: head.height + 13;
        spacing: 19;
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
}
