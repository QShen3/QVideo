import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../BaseComponent"
Rectangle{
    id: root;
    width: 360;
    color: "#f5f5f5";
    MyListItem{
        id: title;
        anchors{
            top: parent.top;
            left: parent.left;
            right: parent.right;
        }
        Row{
            anchors{
                verticalCenter: parent.verticalCenter;
                left: parent.left;
                leftMargin: 9;
            }
            spacing: 12;
            Image{
                anchors.verticalCenter: parent.verticalCenter;
                source: privateStyle.imagePath("toolbar-previous", true);
                smooth: true;
                sourceSize: Qt.size(20, 20);
            }
            Text{
                anchors.verticalCenter: parent.verticalCenter;
                text: qsTr("Detail");
                color: "#3c3c3c";
            }
        }
        onClicked: {
            loader.state = "";
        }
    }
    Flickable{
        anchors{
            fill: parent;
            topMargin: title.height;
        }
        flickableDirection: Flickable.VerticalFlick;
        contentHeight: info.height + 30;
        clip: true;
        Column{
            id: info;
            anchors{
                left: parent.left;
                right: parent.right;
                top: parent.top;
                margins: 15;
            }
            spacing: 15;
            Text{
                width: 330;
                wrapMode: Text.WordWrap;
                text: qsTr("Name:") + detailpage.title;
                color: "#3c3c3c";
            }
            Text{
                width: 330;
                wrapMode: Text.WordWrap;
                text: qsTr("Reputation:") + reputation;
                color: "#3c3c3c";
            }
            Text{
                width: 330;
                wrapMode: Text.WordWrap;
                text: qsTr("Area:") + area.toString();
                color: "#3c3c3c";
            }
            Text{
                width: 330;
                wrapMode: Text.WordWrap;
                text: qsTr("Original:") + original.toString();
                color: "#3c3c3c";
            }
            Text{
                width: 330;
                wrapMode: Text.WordWrap;
                text: qsTr("Voice:") + voice.toString();
                color: "#3c3c3c";
            }
            Rectangle{
                anchors.horizontalCenter: parent.horizontalCenter;
                width: 360;
                height: 1;
                color: "#000000";
                opacity: 0.1;
            }
            Text{
                width: 330;
                wrapMode: Text.WordWrap;
                text: desc;
                color: "#3c3c3c";
            }
        }
    }
}
