// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"

Rectangle{
    id: root;
    width: 480;
    height: 60 + cell.height;
    color: "#f5f5f5";
    Image{
        anchors.bottom: parent.top;
        width: parent.width;
        rotation: 180;
        source: "../../../pic/HeadShadow.png";
        opacity: 0.1;
    }

    Row{
        id: title;
        spacing: 16;
        Rectangle{
            height: 60;
            width: 7;
            color: "#06a7e1";
        }
        Text {
            text: model.title;
            font.pixelSize: 28
            anchors.verticalCenter: parent.verticalCenter;
        }
    }
    Column{
        id: cell;
        anchors.top: title.bottom;
        width: 480;
        Repeater{
            model: cells;
            //Component.onCompleted: console.log(parent);
            delegate: Grid{
                columns: 2;
                width: 480;
                Repeater{
                    model: contents;
                    delegate: ListRect{
                        width: 240;
                        height: trumble.height + 72;
                        Image{
                            id: trumble;
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: 238;
                            //height: 178 / sourceSize.width * sourceSize.height;
                            height: 200;
                            source: img;
                            Text{
                                anchors{
                                    left: parent.left;
                                    bottom: parent.bottom;
                                    margins: 8;
                                }
                                text: model.stripe;
                                color: "white";
                                font.pixelSize: 20;
                                //Component.onCompleted: console.log(font.pixelSize)
                            }
                            Image{
                                source: "../../../pic/vip_icon_corner_free.png";
                                sourceSize: Qt.size(60, 60);
                                height: sourceSize.height;
                                width: sourceSize.width;
                                visible: model.paid === 1;
                            }

                            onStatusChanged: {
                                if(status == Image.Ready){
                                    height = 238 / sourceSize.width * sourceSize.height;
                                }
                            }
                        }
                        Column{
                            anchors{
                                top: trumble.bottom;
                                left: parent.left;
                                margins: 12;
                            }
                            Text{
                                width: 216;
                                clip: true;
                                text: model.title;
                                font.pixelSize: 20;
                                color: "#3c3c3c";
                            }
                            Text{
                                width: 216;
                                clip: true;
                                text: model.subtitle;
                                color: "#787878";
                                font.pixelSize: 16;
                            }
                        }
                        onClicked: {
                            if(model.is_vv === 1){
                                pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title, currentVideoId: model.tid});
                            }
                            else
                                pageStack.push(Qt.resolvedUrl("../DetailPage.qml"), {id: model.tid, title: model.title});
                        }
                    }
                }
            }
        }
    }
}
