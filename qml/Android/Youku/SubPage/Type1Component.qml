import QtQuick 2.5
import QtQuick.Window 2.2
import Material 0.2
import "../../../JavaScript/Youku.js" as Youku
import "../../BaseComponent"
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
            maximumFlickVelocity: Screen.height * 5;
            Column{
                id: column;
                width: parent.width;
                spacing: Units.dp(16);
                View{
                    width: parent.width;
                    height: parent.width / 16 * 9;
                    elevation: 1;
                    visible: slidermodel.count > 0;
                    SliderView{
                        anchors.fill: parent;
                        model: slidermodel;
                        delegate: SliderComponent{}
                    }
                }

                Repeater{
                    model: boxmodel;
                    delegate: BoxComponent{}
                }
            }
        }
        Scrollbar{
            flickableItem: flicker;
        }
        ListModel{
            id: slidermodel;
        }
        ListModel{
            id: boxmodel;
        }

        Component.onCompleted: {
            indicator.open();
            console.log(new Date().getTime());
            Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, "", "", 1, loadsubpagetype1, showSubPageFailureInfo);
        }

        function loadsubpagetype1(oritxt){

            var obj = JSON.parse(oritxt);

            slidermodel.clear();
            boxmodel.clear();

            for(var i in obj.boxes){
                if(obj.boxes[i].module_type === "slider"){
                    for(var j in obj.boxes[i].cells){
                        for(var k in obj.boxes[i].cells[j].contents){
                            if(obj.boxes[i].cells[j].contents[k].type !== "4"){
                                slidermodel.append(obj.boxes[i].cells[j].contents[k]);
                            }
                        }
                    }
                }
                else if(obj.boxes[i].module_type === "normal" && obj.boxes[i].cells[0].contents[0].type !== "4"){
                    boxmodel.append(obj.boxes[i]);
                }
            }
            indicator.close();
        }
    }

}
