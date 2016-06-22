import QtQuick 2.5
import QtQuick.Layouts 1.3
import Material 0.2
import "BaseComponent"

Page{
    id: homepage;
    title: "QVideo";

    actions: [
        Action{
            iconName: "action/settings";
            hoverAnimation: true;
        },
        Action{
            iconName: "file/file_download";
            hoverAnimation: true;
        }
    ]

    GridLayout{
        anchors{
            left: parent.left;
            top: parent.top;
            right: parent.right;
            topMargin: Units.dp(20);
            leftMargin: Units.dp(8);
            rightMargin: Units.dp(8);
        }
        rowSpacing: Units.dp(20);
        columns: parseInt(width / Units.dp(200)) || 1

        MainButton{
            Layout.alignment: Qt.AlignCenter
            icoUrl: "../pic/youku_logo.svg";
            Ink{
                anchors.fill: parent;
                onClicked: {

                    pageStack.push(Qt.resolvedUrl("Youku/MainPage.qml"));
                }
            }
        }
        MainButton{
            Layout.alignment: Qt.AlignCenter
            icoUrl: "../pic/tudou_logo.svg";
            Ink{
                anchors.fill: parent;
                onClicked: {

                }
            }
        }
        MainButton{
            Layout.alignment: Qt.AlignCenter
            icoUrl: "../pic/PPTV_logo.svg";
            Ink{
                anchors.fill: parent;
                onClicked: {

                }
            }
        }
        MainButton{
            Layout.alignment: Qt.AlignCenter
            icoUrl: "../pic/Qiyi_logo.svg";
            Ink{
                anchors.fill: parent;
                onClicked: {

                }
            }
        }
        MainButton{
            Layout.alignment: Qt.AlignCenter
            icoUrl: "../pic/letv_logo.svg";
            Ink{
                anchors.fill: parent;
                onClicked: {

                }
            }
        }

    }
}


