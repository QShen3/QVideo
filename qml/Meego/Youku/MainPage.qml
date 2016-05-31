// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1
import "../../JavaScript/Youku.js" as Youku
import "../BaseComponent"
import "Delegate"

MyPage{
    id: youkupage;
    title: qsTr("Youku");

    Head{
        id:head;
        color: "#06a7e1";
        Image{
            anchors{
                verticalCenter: parent.verticalCenter;
                left: parent.left;
                leftMargin: 12;
            }
            sourceSize: Qt.size(110, 55);
            source: "../../pic/youku_logo.svg";
        }
        z:1;
    }

    tools: ToolBarLayout{
        ToolIcon{
            iconId: "toolbar-back";
            onClicked:{
                pageStack.pop();
            }
            platformStyle: ToolItemStyle{
                inverted: true;
            }
        }
        /*ToolButton{
            iconId: "../../pic/pull_down.svg";
            //onClicked: pageStack.push(Qt.resolvedUrl("Downloadpage.qml"))
            platformInverted: true;
        }*/
        ToolIcon{
            iconId: "toolbar-search";
            platformStyle: ToolItemStyle{
                inverted: true;
            }
            onClicked: pageStack.push(Qt.resolvedUrl("SearchPage.qml"));
        }
        ToolIcon{
            iconId: "toolbar-settings"
            platformStyle: ToolItemStyle{
                inverted: true;
            }
            onClicked: pageStack.push(Qt.resolvedUrl("../SettingPage.qml"));
        }
    }

    GridView{
        id: gridview;
        anchors{
            fill: parent;
            topMargin: head.height;
        }
        clip: true;
        cellHeight: 220;
        cellWidth: 160;
        model: tagmodel;
        delegate: TagComponent{
            onClicked: {
                pageStack.push(Qt.resolvedUrl("SubPage.qml"),
                               {title: model.title, cid: model.channel_id});
            }
        }
        LoadingIndicator{
            id: tagviewind;
            anchors.centerIn: parent;
        }
    }
    ScrollDecorator{
        flickableItem: gridview;
        platformStyle: ScrollDecoratorStyle{
            inverted: true;
        }
    }


    ListModel{
        id: tagmodel;
    }

    Component.onCompleted: {
        Youku.youku.getTag(loadTag, showFailureInfo);
        tagviewind.open();
    }

    function loadTag(oritxt){

        var obj = JSON.parse(oritxt);

        if(obj.status !== "success"){
            showFailureInfo(obj.status);
            return;
        }

        for(var i in obj.channels){
            //console.log(obj.channels[i].tags.length)
            if((obj.channels[i].type === 0) && (obj.channels[i].tags.length > 0)){

                for(var j in obj.channels[i].tags){
                    if(obj.channels[i].tags[j].jump_type === 2
                            && obj.channels[i].tags[j].channel_id !== 1001
                            && obj.channels[i].tags[j].channel_id !== 1002
                            && obj.channels[i].tags[j].channel_id !== 2010
                            && obj.channels[i].tags[j].channel_id !== 2001){
                        tagmodel.append(obj.channels[i].tags[j]);
                    }
                }
                break;
            }
        }
        tagviewind.close();
    }

    function showFailureInfo(error){
        signalcenter.showMessage(error);
        tagviewind.close();
    }
}
