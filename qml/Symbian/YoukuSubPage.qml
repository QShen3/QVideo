// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../JavaScript/Youku.js" as Youku
import "BaseComponent"
import "Delegate"

MyPage{
    id: youkusubpage;
    property bool loaded: false;
    property string cid;
    property string ob: "";
    property string filter: "";
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
            iconSource: "../pic/pull_down.svg";
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
                        subtabtext = model.title;
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
    Component{
        id: subpagetype1;
        Item{
            width: 360;
            height: youkusubpage.height - head.height;
            Flickable{
                anchors.fill: parent;
                flickableDirection: Flickable.VerticalFlick;
                contentHeight: type1column.height;
                clip: true;
                Column{
                    id: type1column;
                    spacing: 9;
                    SliderView{
                        width: 360;
                        height: 234;
                        model: slidermodel;
                        visible: slidermodel.count > 0;
                        Image{
                            anchors.top: parent.top;
                            source: "../pic/Poster_Shadow_01.png";
                            z: 2;
                        }
                        Image{
                            anchors.bottom: parent.bottom;
                            source: "../pic/Poster_Shadow_03.png";
                            z: 2;
                        }
                        Image{
                            anchors.top: parent.bottom;
                            source: "../pic/HeadShadow.png"
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
        }
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

    onVisibleChanged: {
        if(visible && !loaded){
            Youku.youku.getSubTabs(cid, loadsubtabs, showSubTabFailureInfo);
            subtabind.visible = true;
            subtabbtn.visible = false;
        }
    }

    function loadsubtabs(oritxt){
        var obj = JSON.parse(oritxt);

        for(var i in obj.results){
            if(obj.results[i].sub_channel_type !== 2){
                if(obj.results[i].sub_channel_type === 1){
                    obj.results[i].filter = "";
                    subtabtext.text = obj.results[i].title;
                    Youku.youku.getSubPage(cid, obj.results[i].sub_channel_id, obj.results[i].sub_channel_type, filter, ob, 1, loadsubpagetype1, showSubPageFailureInfo);
                    subpageind.open();
                }
                subtabsmodel.append(obj.results[i]);
            }
        }

        subtabind.visible = false;
        subtabbtn.visible = true;
    }

    function loadsubpagetype1(oritxt){
        var obj = JSON.parse(oritxt);

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

    function showSubTabFailureInfo(error){
        signalcenter.showMessage(error);
        subtabind.visible = false;
        subtabbtn.visible = true;
    }
    function showSubPageFailureInfo(error){
        signalcenter.showMessage(error);
        subpageind.close();
    }
}
