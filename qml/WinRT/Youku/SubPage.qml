import QtQuick 2.5
import Qt.labs.controls 1.0
import Material 0.2
import "../../JavaScript/Youku.js" as Youku
import "../BaseComponent"
import "SubPage"

Page{
    id: subPage;
    //property bool loaded: false;
    property string cid;
    property string sub_channel_type;
    property string sub_channel_id;
    property string ob: "";
    property string filterString: "";
    property var filter;
    property int pg: 1;

    actions: [
        Action{
            iconName: "action/search";
            hoverAnimation: true;
        },
        Action{
            iconName: "action/settings";
            hoverAnimation: true;
        },
        Action{
            iconName: "file/file_download";
            hoverAnimation: true;
        }
    ]

    tabs: subPageView.contentChildren;
    tabBar.fullWidth: {
        switch(Device.type){
        case 0:
            return true;
        case 1:
            return false;
        case 2:
            return false;
        case 3:
            return false;
        case 4:
            return false;
        case 5:
            return true;
        default:
            return true;
        }
    }

    SwipeView{
        id: subPageView;
        anchors.fill: parent;
        currentIndex: tabBar.selectedIndex;

        Repeater{
            model: subtabsmodel;
            delegate: Loader{
                property string title: model.title;
                width: subPageView.width;
                height: subPageView.height;
                //active: false;
                sourceComponent: {
                    switch(model.sub_channel_type){
                    case 1:
                        return type1Component;
                    case 3:
                        //return 0;
                    case 4:
                        //return 0;
                    }
                }
            }
        }
        Binding{
            target: tabBar;
            property: "selectedIndex";
            value: subPageView.currentIndex;
        }
        /*onCurrentItemChanged: {
            if(!currentItem.active){
                currentItem.active = true;
            }
            //console.log(currentItem.active);
        }*/
    }

    LoadingIndicator{
        id: indicator;
        anchors.centerIn: parent;
    }

    Type1Component{
        id: type1Component;
    }
    /*Component{
        id: type1Component;
        Rectangle{
            color: Palette.colors["blue"]["700"];
        }
    }*/

    ListModel{
        id: subtabsmodel;
    }
    ListModel{
        id: slidermodel;
    }
    ListModel{
        id: boxmodel;
    }
    ListModel{
        id: filtermodel;
    }
    ListModel{
        id: sortmodel;
    }
    ListModel{
        id: subpagemodel;
    }

    Component.onCompleted: {
        Youku.youku.getSubTabs(cid, loadsubtabs, showSubTabFailureInfo);
        indicator.open();
    }

    function loadsubtabs(oritxt){
        var obj = JSON.parse(oritxt);

        for(var i in obj.results){
            if(obj.results[i].sub_channel_type !== 2){
                if(obj.results[i].sub_channel_type === 1){
                    obj.results[i].filter = "";
                }
                subtabsmodel.append(obj.results[i]);
            }
        }
        //tabs = subPageView.contentItem;

        for(i in obj.results){
            if(obj.results[i].sub_channel_type === 1){
                //filterbutton.visible = false;
                //subtabtext.text = obj.results[i].title;
                sub_channel_type = obj.results[i].sub_channel_type;
                sub_channel_id = obj.results[i].sub_channel_id;
                tabBar.selectedIndex = i;
                Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, "", ob, 1, loadsubpagetype1, showSubPageFailureInfo);
                return;
            }
        }
        for(i in obj.results){
            if(obj.results[i].sub_channel_type === 3){
                //filterbutton.visible = false;
                //subtabtext.text = obj.results[i].title;
                sub_channel_type = obj.results[i].sub_channel_type;
                sub_channel_id = obj.results[i].sub_channel_id;
                filter = obj.results[i].filter;
                Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, "", ob, 1, loadsubpage, showSubPageFailureInfo);
                return;
            }
        }
        for(i in obj.results){
            if(obj.results[i].sub_channel_type === 4){
                //filterbutton.visible = true;
                //subtabtext.text = obj.results[i].title;
                if(filtermodel.count == 0 || sortmodel.count == 0){
                    Youku.youku.getFilter(cid, loadFilter, showFilterFailureInfo);
                }
                filterString = "";
                pg = 1;
                sub_channel_type = obj.results[i].sub_channel_type;
                sub_channel_id = obj.results[i].sub_channel_id;
                Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, "", ob, 1, loadsubpage, showSubPageFailureInfo);
                return;
            }
        }
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
        //subpage.sourceComponent = subpagetype1;
        indicator.close();
    }

    function loadsubpage(oritxt){
        var obj = JSON.parse(oritxt);

        if(obj.pg === "1"){
            subpagemodel.clear();
        }

        if(obj.results.length === 0){
            signalcenter.showMessage(qsTr("No more avaliable!"));
            indicator.close();
            pg--;
            return;
        }

        for(var i in obj.results){
            subpagemodel.append(obj.results[i]);
        }
        //subpage.sourceComponent = subpagetype4;
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

    function showSubTabFailureInfo(error){
        signalcenter.showMessage(error);
        indicator.close();
    }
    function showSubPageFailureInfo(error){
        signalcenter.showMessage(error);
        indicator.close();
    }
    function showFilterFailureInfo(error){
        signalcenter.showMessage(error);
    }
}
