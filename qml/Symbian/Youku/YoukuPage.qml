// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../JavaScript/Youku.js" as Youku
import "../BaseComponent"
import "Delegate"

MyPage{
    id: youkupage;
    title: qsTr("Youku");

    Head{
        id:head;
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

    GridView{
        anchors{
            fill: parent;
            topMargin: head.height;
        }
        clip: true;
        cellHeight: 180;
        cellWidth: 120;
        model: tagmodel;
        delegate: TagComponent{
            onClicked: {
                pageStack.push(Qt.resolvedUrl("YoukuSubPage.qml"),
                               {title: model.title, cid: model.channel_id});
            }
        }
        LoadingIndicator{
            id: tagviewind;
            anchors.centerIn: parent;
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
                    if(obj.channels[i].tags[j].jump_type === 2){

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
