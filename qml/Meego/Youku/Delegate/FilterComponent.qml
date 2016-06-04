// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1

Item{
    id: root;
    property int myIndex: model.index;
    height: titletext.height + 36;
    width: 440;
    Text{
        id: titletext;
        anchors{
            left: parent.left;
            leftMargin: 13;
            verticalCenter: parent.verticalCenter;
        }
        color: "#1080dd"
        font.pixelSize: 24;
        text: model.items.get(0).title;
    }
    Flickable{
        id: flicker;
        anchors{
            left: titletext.right;
            right: parent.right;
            margins: 13;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height;
        contentWidth: filterrow.width;
        clip: true;
        flickableDirection: Flickable.HorizontalFlick;
        Row{
            id: filterrow;
            anchors.verticalCenter: parent.verticalCenter;
            //spacing: 10;
            Repeater{
                model: items;
                /*Text{
                    text: model.title;
                    MouseArea{
                        anchors.fill: parent;
                        onClicked: {
                            titletext.text = model.title;
                            var temp = filter;
                            temp[myIndex].value = model.value;
                            filter = temp;
                            //console.log(filter[myIndex].value);
                        }
                    }
                }*/
                ToolButton{
                    text: model.title;
                    flat: true;
                    width: 160;
                    platformStyle: ToolButtonStyle{
                        inverted: true;
                    }
                    onClicked: {
                        titletext.text = model.title;
                        var temp = filter;
                        temp[myIndex].value = model.value;
                        filter = temp;
                    }
                }
            }
        }
    }
    ScrollDecorator{
        flickableItem: flicker;
        platformStyle: ScrollDecoratorStyle{
            inverted: true;
        }
    }
}
