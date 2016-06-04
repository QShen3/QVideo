// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1
import "../../BaseComponent"
Column{
    width: 480;
    MyListItem{
        height: 251;
        width: 480;
        Image{
            id: thumb;
            sourceSize: Qt.size(167, 251);
            height: sourceSize.height;
            width: sourceSize.width;
            source: model.show_vthumburl;
        }
        Column{
            anchors{
                left: thumb.right;
                top: parent.top;
                right: parent.right;
                margins: 12;
            }
            spacing: 4;
            Text{
                width: parent.width - 56;
                text: model.showname;
                wrapMode: Text.WordWrap;
                font.pixelSize: 32;
                maximumLineCount: 2;
                color: "#3C3C3C";
            }
            Text{
                width: parent.width;
                text: model.summary;
                font.pixelSize: 20;
                wrapMode: Text.WordWrap;
                color: "#787878";
            }
            Text{
                width: parent.width;
                text: model.notice;
                font.pixelSize: 20;
                wrapMode: Text.WordWrap;
                color: "#787878";
            }
        }
        Text{
            anchors{
                top: parent.top;
                right: parent.right;
                margins: 16;
            }
            text: model.reputation;
            color: "#DD1810";
            font.pixelSize: 28;
        }
        Row{
            anchors{
                right: parent.right;
                bottom: parent.bottom;
                margins: 20;
            }
            Button{
                width: 120;
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
        height: 80;
        width: 480;
        Row{
            anchors.fill: parent;
            Repeater{
                model: serises;
                Item{
                    width: 80;
                    height: 80;
                    Text{
                        anchors.centerIn: parent;
                        font.pixelSize: 24;
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
