// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../BaseComponent"
Column{
    width: 360;
    MyListItem{
        height: 188;
        width: 360;
        Image{
            id: thumb;
            sourceSize: Qt.size(125, 188);
            height: sourceSize.height;
            width: sourceSize.width;
            source: model.show_vthumburl;
        }
        Column{
            anchors{
                left: thumb.right;
                top: parent.top;
                right: parent.right;
                margins: 9;
            }
            spacing: 3;
            Text{
                width: parent.width - 42;
                text: model.showname;
                wrapMode: Text.WordWrap;
                font.pixelSize: 24;
                maximumLineCount: 2;
                color: "#3C3C3C";
            }
            Text{
                width: parent.width;
                text: model.summary;
                font.pixelSize: 15;
                wrapMode: Text.WordWrap;
                color: "#787878";
            }
            Text{
                width: parent.width;
                text: model.notice;
                font.pixelSize: 15;
                wrapMode: Text.WordWrap;
                color: "#787878";
            }
        }
        Text{
            anchors{
                top: parent.top;
                right: parent.right;
                margins: 12;
            }
            text: model.reputation;
            color: "#DD1810";
            font.pixelSize: 21;
        }
        Row{
            anchors{
                right: parent.right;
                bottom: parent.bottom;
                margins: 15;
            }
            Button{
                platformInverted: true;
                text: qsTr("Play");
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.showid, title: model.title});
                }
            }
        }

        onClicked: {
            pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.showid, title: model.title});
        }
    }
    MyListItem{
        enabled: false;
        height: 60;
        width: 360;
        Row{
            anchors.fill: parent;
            Repeater{
                model: serises;
                Item{
                    width: 60;
                    height: 60;
                    Text{
                        anchors.centerIn: parent;
                        text: model.show_videostage;
                        color: "#3c3c3c";
                    }
                    Rectangle{
                        anchors.fill: parent;
                        color: "#787878";
                        opacity: 0.2;
                        visible: mousearea.pressed;
                    }

                    MouseArea{
                        id: mousearea
                        anchors.fill: parent;
                        onClicked: {
                            pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.videoid, title: model.title, currentVideoId: model.videoid});
                        }
                    }
                }
            }
        }
    }
}
