// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../BaseComponent"

Rectangle{
    id: root;
    width: 360;
    height: 45 + cell.height;
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
        spacing: 12;
        Rectangle{
            height: 45;
            width: 5;
            color: "#06a7e1";
        }
        Text {
            text: model.title;
            font.pixelSize: 21
            anchors.verticalCenter: parent.verticalCenter;
        }
    }
    Column{
        id: cell;
        anchors.top: title.bottom;
        width: 360;
        Repeater{
            model: cells;
            //Component.onCompleted: console.log(parent);
            delegate: Grid{
                columns: 2;
                width: 360;
                Repeater{
                    model: contents;
                    delegate: ListRect{
                        width: 180;
                        height: trumble.height + 54;
                        Image{
                            id: trumble;
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: 178;
                            //height: 178 / sourceSize.width * sourceSize.height;
                            height: 150;
                            source: img;
                            Text{
                                anchors{
                                    left: parent.left;
                                    bottom: parent.bottom;
                                    margins: 6;
                                }
                                text: model.stripe;
                                color: "white";
                                font.pixelSize: 15;
                                //Component.onCompleted: console.log(font.pixelSize)
                            }
                            onStatusChanged: {
                                if(status == Image.Ready){
                                    height = 178 / sourceSize.width * sourceSize.height;
                                }
                            }
                        }
                        Column{
                            anchors{
                                top: trumble.bottom;
                                left: parent.left;
                                margins: 9;
                            }
                            Text{
                                width: 162;
                                clip: true;
                                text: model.title;
                                font.pixelSize: 15;
                                color: "#3c3c3c";
                            }
                            Text{
                                width: 162;
                                clip: true;
                                text: model.subtitle;
                                color: "#787878";
                                font.pixelSize: 12
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
