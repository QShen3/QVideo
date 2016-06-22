import QtQuick 2.5
import Qt.labs.controls 1.0
import Material 0.2
import "../Delegate"

Component{
    Item {
        id: root;
        Flickable{
            id: flicker;
            anchors.fill: parent;
            flickableDirection: Flickable.VerticalFlick;
            contentHeight: column.height;
            clip: true;
            Column{
                id: column;
                width: parent.width;
                spacing: Units.dp(16);
                View{
                    width: parent.width;
                    height: parent.width / 16 * 9;
                    elevation: 1;
                    visible: slidermodel.count > 0;
                    /*SwipeView{
                        anchors.fill: parent;
                        Repeater{
                            model: slidermodel;
                            delegate: SliderComponent{}
                        }
                        Timer{
                            running: parent.visible && parent.count>0;
                            interval: 3000;
                            repeat: true;
                            onTriggered: {
                                if(parent.index == (parent.count - 1)){
                                    parent.index = 0;
                                }
                                else{
                                    parent.moveItem(parent.index, parent.index + 1);
                                }
                            }
                        }
                    }*/
                }
            }
        }
        Scrollbar{
            flickableItem: flicker;
        }
        //Component.onCompleted: console.log("here");
    }

}
