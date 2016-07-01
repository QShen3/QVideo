import QtQuick 2.5
import QtQuick.Window 2.2
import Material 0.2
import "../../../JavaScript/Youku.js" as Youku
import "../Delegate"
import "../Dialog"
Component{
    Item{
        Flickable{
            id: flicker;
            anchors.fill: parent;
            contentHeight: subpageColumn.height;
            flickableDirection: Flickable.VerticalFlick;
            clip: true;
            maximumFlickVelocity: Screen.height * 5;
            Grid{
                id: subpageColumn;
                width: parent.width;
                columns: 3;
                Repeater{
                    model: subpageModel;
                    delegate: SubPageComponent{}
                }
            }
            onMovementEnded: {
                if(contentY >= (contentHeight - height)){
                    console.log("page++")
                    pg++;
                    indicator.open();
                    Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, filterString, ob, pg, loadsubpage, showSubPageFailureInfo);
                }
            }
        }

        ListModel{
            id: subpageModel;
        }

        ListModel{
            id: filtermodel;
        }

        ListModel{
            id: sortmodel;
        }

        Scrollbar{
            flickableItem: flicker;
        }

        ActionButton{
            id: filterbutton;
            anchors{
                left: parent.left;
                bottom: parent.bottom;
                margins: Units.dp(28);
            }
            iconName: "awesome/filter";
            action: Action{
                text: qsTr("filter");
                onTriggered: {
                    filterDialog.open();
                }
            }
            visible: filtermodel.count!=0 && sortmodel.count!=0 && sub_channel_type==4;
        }

        FilterDialog{
            id: filterDialog;
        }

        Component.onCompleted: {
            indicator.open();
            Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, filterString, ob, 1, loadsubpage, showSubPageFailureInfo);
            if(sub_channel_type==4){
                Youku.youku.getFilter(cid, loadFilter, showSubPageFailureInfo);
            }
        }

        function loadsubpage(oritxt){
            var obj = JSON.parse(oritxt);

            if(obj.pg === "1"){
                subpageModel.clear();
            }

            if(obj.results.length === 0){
                signalcenter.showMessage(qsTr("No more avaliable!"));
                indicator.close();
                pg--;
                return;
            }

            for(var i in obj.results){
                subpageModel.append(obj.results[i]);
            }
            indicator.close();
        }

        function loadFilter(oritxt){
            var obj = JSON.parse(oritxt);

            var temp = new Array;
            for(var i in obj.results.filter){
                filtermodel.append(obj.results.filter[i]);
                temp[i] = new Object;
                temp[i].cat = obj.results.filter[i].cat;
                temp[i].value = obj.results.filter[i].items[0].value;
            }
            filter = temp;

            for(i in obj.results.sort){
                sortmodel.append(obj.results.sort[i]);
            }
        }
    }
}
