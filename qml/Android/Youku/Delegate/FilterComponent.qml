import QtQuick 2.5
import Material 0.2

Item{
    id: root;
    property int myIndex: model.index;
    height: titletext.height * 3;
    width: parent.width
    Text{
        id: titletext;
        anchors{
            left: parent.left;
            leftMargin: Units.dp(8);
            verticalCenter: parent.verticalCenter;
        }
        color: Palette.colors["blue"]["500"];
        text: model.items.get(0).title;
    }
    Flickable{
        id: flicker;
        anchors{
            left: titletext.right;
            right: parent.right;
            margins: Units.dp(8);
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
                Button{
                    text: model.title;
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
    Scrollbar{
        flickableItem: flicker;
    }
}
