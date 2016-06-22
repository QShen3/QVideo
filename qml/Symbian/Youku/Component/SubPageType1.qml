import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../BaseComponent"
import "../Delegate"
Component{
    id: subpagetype1;
    Item{
        width: 360;
        height: youkusubpage.height - head.height;
        Flickable{
            id: flicker;
            anchors.fill: parent;
            flickableDirection: Flickable.VerticalFlick;
            contentHeight: type1column.height;
            clip: true;
            Column{
                id: type1column;
                spacing: 9;
                SliderView{
                    width: 360;
                    height: 202.5;
                    model: slidermodel;
                    visible: slidermodel.count > 0;
                    Image{
                        anchors.top: parent.top;
                        source: "../../../pic/Poster_Shadow_01.png";
                        z: 2;
                    }
                    Image{
                        anchors.top: parent.bottom;
                        source: "../../../pic/HeadShadow.png"
                    }
                    delegate: SliderComponent{

                    }
                }

                Repeater{
                    model: boxmodel;
                    delegate: BoxComponent{}
                }
            }
        }
        ScrollDecorator{
            flickableItem: flicker;
            platformInverted: true;
        }
    }
}
