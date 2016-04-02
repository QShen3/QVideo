// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../JavaScript/Youku.js" as Youku
import "../BaseComponent"
import "Delegate"
import "Component"
import "Dialog"

MyPage{
    id: youkusubpage;
    property bool loaded: false;
    property string cid;
    property string sub_channel_type;
    property string sub_channel_id;
    property string ob: "";
    property string filterString: "";
    property variant filter;
    property int pg: 1;
    Head{
        id:head;
        titleText: title;
        z:1;
        Row{
            anchors{
                verticalCenter: parent.verticalCenter;
                right: parent.right;
                rightMargin: 12;
            }
            spacing: 3;
            Text{
                id: subtabtext;
                anchors.verticalCenter: parent.verticalCenter;
            }

            ToolButton{
                id: subtabbtn;
                anchors.verticalCenter: parent.verticalCenter;
                visible: false;
                iconSource: "toolbar-list";
                platformInverted: true;
                onClicked: {
                    if(subtabsmodel.count > 0){
                        subtab.open();
                    }
                }
            }
            BusyIndicator{
                id: subtabind;
                visible: false;
                anchors.verticalCenter: parent.verticalCenter;
            }
        }


    }
    tools: ToolBarLayout{
        ToolButton{
            iconSource: "toolbar-back";
            onClicked:{
                pageStack.pop();
            }
            platformInverted: true;
        }
        ToolButton{
            iconSource: "../../pic/pull_down.svg";
            //onClicked: pageStack.push(Qt.resolvedUrl("Downloadpage.qml"))
            platformInverted: true;
        }
        ToolButton{
            iconSource: "toolbar-settings"
            platformInverted: true;
        }
    }

    ContextMenu{
        id: subtab;
        MenuLayout{
            id: menulayout
            Repeater{
                model: subtabsmodel;
                delegate: MenuItem{
                    text: model.title;
                    platformInverted: true;
                    parent: menulayout;
                    onClicked: {
                        subtabtext.text = model.title;
                        youkusubpage.sub_channel_type = model.sub_channel_type;
                        youkusubpage.sub_channel_id = model.sub_channel_id;
                        switch(sub_channel_type){
                        case 1:
                            filterbutton.visible = false;
                            subpage.sourceComponent = undefined;
                            Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, "", "", 1, loadsubpagetype1, showSubPageFailureInfo);
                            subpageind.open();
                            break;
                        case 3:
                            filterbutton.visible = false;
                            subpage.sourceComponent = undefined;
                            Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, model.filter, "", 1, loadsubpage, showSubPageFailureInfo);
                            subpageind.open();
                            break;
                        case 4:
                            filterbutton.visible = true;
                            subpage.sourceComponent = undefined;
                            if(filtermodel.count == 0 || sortmodel.count == 0){
                                Youku.youku.getFilter(cid, loadFilter, showFilterFailureInfo);
                            }
                            filterString = "";
                            pg = 1;
                            Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, "", ob, 1, loadsubpage, showSubPageFailureInfo);
                            subpageind.open();
                            break;
                        }
                        subtab.close();
                    }
                }
            }
        }
        platformInverted: true;
    }

    Loader{
        id: subpage;
        anchors.fill: parent;
        anchors.topMargin: head.height;
        LoadingIndicator{
            id: subpageind;
            anchors.centerIn: parent;
        }
    }

    Button{
        id: filterbutton;
        anchors{
            left: subpage.left;
            bottom: subpage.bottom;
            margins: 30;
        }
        platformInverted: true;
        opacity: 0.8;
        //iconSource: "toolbar-menu";
        visible: filtermodel.count!=0 && sortmodel.count!=0;
        onClicked: {
            filterdialog.open();
        }
    }

    FilterDialog{
        id: filterdialog;
    }

    SubPageType1{
        id: subpagetype1;
    }

    SubPageType4{
        id: subpagetype4;
    }

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

    onVisibleChanged: {
        if(visible && !loaded){
            Youku.youku.getSubTabs(cid, loadsubtabs, showSubTabFailureInfo);
            subtabind.visible = true;
            subtabbtn.visible = false;
            loaded = true;
        }
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

        subtabind.visible = false;
        subtabbtn.visible = true;

        for(i in obj.results){
            if(obj.results[i].sub_channel_type === 1){
                filterbutton.visible = false;
                subtabtext.text = obj.results[i].title;
                sub_channel_type = obj.results[i].sub_channel_type;
                sub_channel_id = obj.results[i].sub_channel_id;
                Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, "", ob, 1, loadsubpagetype1, showSubPageFailureInfo);
                subpageind.open();
                return;
            }
        }
        for(i in obj.results){
            if(obj.results[i].sub_channel_type === 3){
                filterbutton.visible = false;
                subtabtext.text = obj.results[i].title;
                sub_channel_type = obj.results[i].sub_channel_type;
                sub_channel_id = obj.results[i].sub_channel_id;
                filter = obj.results[i].filter;
                Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, "", ob, 1, loadsubpage, showSubPageFailureInfo);
                subpageind.open();
                return;
            }
        }
        for(i in obj.results){
            if(obj.results[i].sub_channel_type === 4){
                filterbutton.visible = true;
                subtabtext.text = obj.results[i].title;
                if(filtermodel.count == 0 || sortmodel.count == 0){
                    Youku.youku.getFilter(cid, loadFilter, showFilterFailureInfo);
                }
                filterString = "";
                pg = 1;
                sub_channel_type = obj.results[i].sub_channel_type;
                sub_channel_id = obj.results[i].sub_channel_id;
                Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, "", ob, 1, loadsubpage, showSubPageFailureInfo);
                subpageind.open();
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
            else if(obj.boxes[i].module_type === "normal"){
                boxmodel.append(obj.boxes[i]);
            }
        }
        subpage.sourceComponent = subpagetype1;
        subpageind.close();
    }

    function loadsubpage(oritxt){
        var obj = JSON.parse(oritxt);

        if(obj.pg === "1"){
            subpagemodel.clear();
        }

        if(obj.results.length === 0){
            signalcenter.showMessage(qsTr("No more avaliable!"));
            pg--;
            return;
        }

        for(var i in obj.results){
            subpagemodel.append(obj.results[i]);
        }
        subpage.sourceComponent = subpagetype4;
        subpageind.close();
    }

    function loadFilter(oritxt){
        var obj = JSON.parse(oritxt);

        var temp = new Array();
        for(var i in obj.results.filter){
            filtermodel.append(obj.results.filter[i]);
            temp[i] = new Object();
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
        subtabind.visible = false;
        subtabbtn.visible = true;
    }
    function showSubPageFailureInfo(error){
        signalcenter.showMessage(error);
        subpageind.close();
    }
    function showFilterFailureInfo(error){
        signalcenter.showMessage(error);
    }
}
