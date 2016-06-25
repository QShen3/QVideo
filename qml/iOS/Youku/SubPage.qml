import QtQuick 2.5
import QtQuick.Controls 2.0
import Material 0.2
import "../../JavaScript/Youku.js" as Youku
import "../BaseComponent"
import "SubPage"

Page{
    id: subPage;
    //property bool loaded: false;
    property string cid;

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
                property string sub_channel_type: model.sub_channel_type;
                property string sub_channel_id: model.sub_channel_id;
                property var filter: []
                property string filterString: model.filter;
                property string ob: "";
                property int pg: 1;

                width: subPageView.width;
                height: subPageView.height;
                active: index == 0 ? true : false;

                sourceComponent: {
                    switch(model.sub_channel_type){
                    case 1:
                        return type1Component;
                    case 3:
                        return type4Component;
                    case 4:
                        return type4Component;
                    }
                }
            }
        }
        Binding{
            target: tabBar;
            property: "selectedIndex";
            value: subPageView.currentIndex;
        }
        onCurrentItemChanged: {
            if((currentItem != undefined) && (!currentItem.active)){
                currentItem.active = true;
            }
        }
    }

    LoadingIndicator{
        id: indicator;
        anchors.centerIn: parent;
    }

    Type1Component{
        id: type1Component;
    }
    Type4Component{
        id: type4Component;
    }

    ListModel{
        id: subtabsmodel;
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
                if(obj.results[i].highlight === 1){
                    tabBar.selectedIndex = i;
                    //return;
                }
            }
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
