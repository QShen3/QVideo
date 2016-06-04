import QtQuick 1.1
import com.nokia.meego 1.1
import "../../BaseComponent"
import "../Delegate"
Component{
    id: subpagetype1;
    Item{
        width: 480;
        height: youkusubpage.height - head.height;
        Flickable{
            id: flicker;
            anchors.fill: parent;
            flickableDirection: Flickable.VerticalFlick;
            contentHeight: type1column.height;
            clip: true;
            Column{
                id: type1column;
                spacing: 12;
                SliderView{
                    width: 480;
                    height: 270;
                    model: slidermodel;
                    visible: slidermodel.count > 0;
                    Image{
                        anchors.top: parent.top;
                        width: parent.width;
                        source: "../../../pic/Poster_Shadow_01.png";
                        z: 2;
                    }
                    /*Image{
                        anchors.bottom: parent.bottom;
                        source: "../../../pic/Poster_Shadow_03.png";
                        z: 2;
                    }*/
                    Image{
                        anchors.top: parent.bottom;
                        width: parent.width;
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
            platformStyle: ScrollDecoratorStyle{
                inverted: true;
            }
        }
    }
}
