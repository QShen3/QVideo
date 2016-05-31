import QtQuick 1.1
import com.nokia.meego 1.1
import "../../BaseComponent"
Rectangle{
    id: root;
    width: 480;
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
                leftMargin: 12;
            }
            spacing: 16;
            Image{
                anchors.verticalCenter: parent.verticalCenter;
                //source: privateStyle.imagePath("toolbar-previous", true);
                source: "image://theme/icon-m-toolbar-previous";
                smooth: true;
                sourceSize: Qt.size(27, 27);
            }
            Text{
                anchors.verticalCenter: parent.verticalCenter;
                font.pixelSize: 24;
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
        contentHeight: info.height + 40;
        clip: true;
        Column{
            id: info;
            anchors{
                left: parent.left;
                right: parent.right;
                top: parent.top;
                margins: 20;
            }
            spacing: 20;
            Text{
                width: 440;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Name:") + detailpage.title;
                color: "#3c3c3c";
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Show date:") + showDate;
                color: "#3c3c3c";
                visible: showDate !== "";
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Reputation:") + reputation;
                color: "#3c3c3c";
                visible: reputation !== "";
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Genre:") + (genre===undefined ? "" : genre.toString());
                color: "#3c3c3c";
                visible: genre !== undefined;
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Area:") + (area===undefined ? "" : area.toString());
                color: "#3c3c3c";
                visible: area !== undefined;
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Director:") + (director===undefined ? "" : director.toString());
                color: "#3c3c3c";
                visible: director !== undefined;
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Performer:") + (performer===undefined ? "" : performer.toString());
                color: "#3c3c3c";
                visible: performer !== undefined;
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Host:") + (host===undefined ? "" : host.toString());
                color: "#3c3c3c";
                visible: host !== undefined;
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Original:") + (original===undefined ? "" : original.toString());
                color: "#3c3c3c";
                visible: original !== undefined;
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Voice:") + (voice===undefined ? "" : voice.toString());
                color: "#3c3c3c";
                visible: voice !== undefined;
            }
            Text{
                width: 440;
                height: visible ? paintedHeight : 0;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: qsTr("Production:") + (production===undefined ? "" : production.toString());
                color: "#3c3c3c";
                visible: production !== undefined;
            }
            Rectangle{
                anchors.horizontalCenter: parent.horizontalCenter;
                width: 480;
                height: 1;
                color: "#000000";
                opacity: 0.1;
            }
            Text{
                width: 440;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                text: desc;
                color: "#3c3c3c";
            }
        }
    }
}
