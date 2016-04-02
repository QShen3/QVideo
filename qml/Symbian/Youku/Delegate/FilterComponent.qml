// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Item{
    id: root;
    property int myIndex: model.index;
    height: titletext.height + 27;
    width: 330;
    Text{
        id: titletext;
        anchors{
            left: parent.left;
            leftMargin: 10;
            verticalCenter: parent.verticalCenter;
        }
        color: "#1056dd"
        text: model.items.get(0).title;
    }
    Flickable{
        anchors{
            left: titletext.right;
            right: parent.right;
            margins: 10;
            verticalCenter: parent.verticalCenter;
        }
        height: parent.height;
        contentWidth: filterrow.width;
        clip: true;
        flickableDirection: Flickable.HorizontalFlick;
        Row{
            id: filterrow;
            anchors.verticalCenter: parent.verticalCenter;
            spacing: 10;
            Repeater{
                model: items;
                Text{
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
                }
            }
        }
    }
}
