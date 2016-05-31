import QtQuick 1.1
import com.nokia.meego 1.1
import "BaseComponent"

MyPage{
    id: aboutpage;
    title: qsTr("About");

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
        anchors{
            fill: parent;
            topMargin: head.height + 27;
        }
        flickableDirection: Flickable.VerticalFlick;
        contentHeight: aboutcolumn.height;
        clip: true;
        Column{
            id: aboutcolumn;
            width: 480;
            Item{
                width: 480;
                height: 360;
                Column{
                    anchors.centerIn: parent;
                    spacing: 4;
                    Image{
                        anchors.horizontalCenter: parent.horizontalCenter;                        
                        source: "../../QVideo.svg";
                    }
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter;
                        text: "QVideo";
                        font.pixelSize: 24;
                        color: "#3c3c3c";
                    }
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter;
                        text: qsTr("Version:") + appVersion;
                        font.pixelSize: 24;
                        color: "#787878";
                    }
                }
            }
            MyListHeading{
                text: qsTr("About author");
            }
            MyListItem{
                Row{
                    spacing: 8;
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 20;
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        source: "../pic/avatar.png";
                        sourceSize: Qt.size(60, 60);
                    }
                    Text{
                        anchors.verticalCenter: parent.verticalCenter;
                        text: "QShen";
                        color: "#3c3c3c";
                        font.pixelSize: 28;
                    }
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 20;
                    }
                    source: "image://theme/icon-m-toolbar-next";
                    smooth: true;
                    sourceSize: Qt.size(27, 27);
                }
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("LicensePage.qml"),{title: "QShen"})
                    //Qt.openUrlExternally("http://tieba.baidu.com/home/main?un=qazxdrcssc2006&fr=home");
                }
            }
            MyListItem{
                Row{
                    spacing: 8;
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 20;
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        source: "../pic/tbclient.svg";
                        sourceSize: Qt.size(60, 60);
                    }
                    Text{
                        anchors.verticalCenter: parent.verticalCenter;
                        text: qsTr("Baidu Tieba");
                        color: "#3c3c3c";
                        font.pixelSize: 28;
                    }
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 20;
                    }
                    //source: privateStyle.imagePath("toolbar-next", true);
                    source: "image://theme/icon-m-toolbar-next";
                    smooth: true;
                    sourceSize: Qt.size(27, 27);
                }
                onClicked: {
                    Qt.openUrlExternally("http://tieba.baidu.com/home/main?un=qazxdrcssc2006");
                }
            }
            MyListItem{
                Row{
                    spacing: 8;
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 20;
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        source: "../pic/Weibo_logo.svg";
                        sourceSize: Qt.size(60, 60);
                    }
                    Text{
                        anchors.verticalCenter: parent.verticalCenter;
                        text: qsTr("Weibo");
                        color: "#3c3c3c";
                        font.pixelSize: 28;
                    }
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 20;
                    }
                    source: "image://theme/icon-m-toolbar-next";
                    smooth: true;
                    sourceSize: Qt.size(27, 27);
                }
                onClicked: {
                    Qt.openUrlExternally("http://weibo.com/QShen3");
                }
            }
            MyListHeading{
                text: qsTr("Third-party licenses");
            }
            MyListItem{
                Text{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 20;
                    }
                    text: "Qt";
                    color: "#3c3c3c";
                    font.pixelSize: 28;
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 20;
                    }
                    source: "image://theme/icon-m-toolbar-next";
                    smooth: true;
                    sourceSize: Qt.size(27, 27);
                }
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("LicensePage.qml"), {fileName: ":/License/ThirdPart/Qt_4.7.4_License"});
                }
            }
            MyListItem{
                Text{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 20;
                    }
                    text: "Qt Quick Components";
                    color: "#3c3c3c";
                    font.pixelSize: 27;
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 20;
                    }
                    source: "image://theme/icon-m-toolbar-next";
                    smooth: true;
                    sourceSize: Qt.size(27, 27);
                }
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("LicensePage.qml"), {fileName: ":/License/ThirdPart/Qt_Quick_Components_License"});
                }
            }
            MyListItem{
                Text{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 20;
                    }
                    text: "You-Get";
                    color: "#3c3c3c";
                    font.pixelSize: 28;
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 20;
                    }
                    source: "image://theme/icon-m-toolbar-next";
                    smooth: true;
                    sourceSize: Qt.size(27, 27);
                }
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("LicensePage.qml"), {fileName: ":/License/ThirdPart/You-Get_License"});
                }
            }
            MyListHeading{
                text: qsTr("About project");
            }
            MyListItem{
                Row{
                    spacing: 4;
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 20;
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        source: "../pic/favicon.ico";
                        sourceSize: Qt.size(60, 60);
                    }
                    Text{
                        text: qsTr("GitHub");
                        color: "#3c3c3c";
                        font.pixelSize: 28;
                    }
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 20;
                    }
                    source: "image://theme/icon-m-toolbar-next";
                    smooth: true;
                    sourceSize: Qt.size(27, 27);
                }
                onClicked: {
                    Qt.openUrlExternally("https://github.com/QShen3/QVideo");
                }
            }
            Rectangle{
                height: 28;
                width: 1;
            }
            Text{
                anchors.horizontalCenter: parent.horizontalCenter;
                color: "#787878";
                font.pixelSize: 24;
                text: "Designed and developed by QShen,2016"
            }
        }
    }
}
