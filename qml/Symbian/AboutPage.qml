import QtQuick 1.1
import com.nokia.symbian 1.1
import "BaseComponent"

MyPage{
    id: aboutpage;
    title: qsTr("About");

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
        contentHeight: aboutcolumn.height;
        clip: true;
        Column{
            id: aboutcolumn;
            Item{
                width: 360;
                height: 270;
                Column{
                    anchors.centerIn: parent;
                    spacing: 3;
                    Image{
                        anchors.horizontalCenter: parent.horizontalCenter;
                        source: "../../QVideo.svg";
                    }
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter;
                        text: "QVideo";
                        color: "#3c3c3c";
                    }
                    Text{
                        anchors.horizontalCenter: parent.horizontalCenter;
                        text: qsTr("Version:") + appVersion;
                        color: "#787878";
                    }
                }
            }
            MyListHeading{
                text: qsTr("About author");
            }
            MyListItem{
                Row{
                    spacing: 6;
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 15;
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        source: "../pic/avatar.png";
                        sourceSize: Qt.size(45, 45);
                    }
                    Text{
                        anchors.verticalCenter: parent.verticalCenter;
                        text: "QShen";
                        color: "#3c3c3c";
                        font.pixelSize: 21;
                    }
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 15;
                    }
                    source: privateStyle.imagePath("toolbar-next", true);
                    smooth: true;
                    sourceSize: Qt.size(20, 20);
                }
                onClicked: {
                    Qt.openUrlExternally("http://tieba.baidu.com/home/main?un=qazxdrcssc2006&fr=home");
                }
            }
            MyListItem{
                Row{
                    spacing: 6;
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 15;
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        source: "../pic/tbclient.svg";
                        sourceSize: Qt.size(45, 45);
                    }
                    Text{
                        anchors.verticalCenter: parent.verticalCenter;
                        text: qsTr("Baidu Tieba");
                        color: "#3c3c3c";
                        font.pixelSize: 21;
                    }
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 15;
                    }
                    source: privateStyle.imagePath("toolbar-next", true);
                    smooth: true;
                    sourceSize: Qt.size(20, 20);
                }
                onClicked: {
                    Qt.openUrlExternally("http://tieba.baidu.com/home/main?un=qazxdrcssc2006&fr=home");
                }
            }
            MyListItem{
                Row{
                    spacing: 6;
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 15;
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        source: "../pic/Weibo_logo.svg";
                        sourceSize: Qt.size(45, 45);
                    }
                    Text{
                        anchors.verticalCenter: parent.verticalCenter;
                        text: qsTr("Weibo");
                        color: "#3c3c3c";
                        font.pixelSize: 21;
                    }
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 15;
                    }
                    source: privateStyle.imagePath("toolbar-next", true);
                    smooth: true;
                    sourceSize: Qt.size(20, 20);
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
                        leftMargin: 15;
                    }
                    text: "Qt";
                    color: "#3c3c3c";
                    font.pixelSize: 21;
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 15;
                    }
                    source: privateStyle.imagePath("toolbar-next", true);
                    smooth: true;
                    sourceSize: Qt.size(20, 20);
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
                        leftMargin: 15;
                    }
                    text: "Qt Quick Components";
                    color: "#3c3c3c";
                    font.pixelSize: 21;
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 15;
                    }
                    source: privateStyle.imagePath("toolbar-next", true);
                    smooth: true;
                    sourceSize: Qt.size(20, 20);
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
                        leftMargin: 15;
                    }
                    text: "You-Get";
                    color: "#3c3c3c";
                    font.pixelSize: 21;
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 15;
                    }
                    source: privateStyle.imagePath("toolbar-next", true);
                    smooth: true;
                    sourceSize: Qt.size(20, 20);
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
                    spacing: 3;
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 15;
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        source: "../pic/favicon.ico";
                        sourceSize: Qt.size(45, 45);
                    }
                    Text{
                        text: qsTr("GitHub");
                        color: "#3c3c3c";
                        font.pixelSize: 21;
                    }
                }
                Image{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 15;
                    }
                    source: privateStyle.imagePath("toolbar-next", true);
                    smooth: true;
                    sourceSize: Qt.size(20, 20);
                }
                onClicked: {
                    Qt.openUrlExternally("https://github.com/QShen3/QVideo");
                }
            }
        }
    }
}
