import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import Material 0.2
import "../../../JavaScript/Youku.js" as Youku
import "../../BaseComponent"
import "../Delegate"
Item {
    Flickable{
        id: tagView;
        anchors.fill: parent;
        anchors.topMargin: Units.dp(8);
        contentHeight: tagLayout.height;
        maximumFlickVelocity: Screen.height * 5;
        clip: true;
        GridLayout{
            id: tagLayout;
            width: parent.width;
            columns: parseInt(width / Units.dp(100)) || 1;
            rowSpacing: Units.dp(8);
            Repeater{
                model: tagModel;
                delegate: TagComponent{
                    onClicked: {
                        pageStack.push(Qt.resolvedUrl("../SubPage.qml"),
                                       {title: model.title, cid: model.channel_id});
                    }
                }
            }
        }
    }
    Scrollbar{
        flickableItem: tagView;
    }

    LoadingIndicator{
        id: tagViewIndicator;
        anchors.centerIn: parent;
    }
    ListModel{
        id: tagModel;
    }
    Component.onCompleted: {
        tagViewIndicator.open();
        Youku.youku.getTag(loadTag, showFailureInfo);
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
                        tagModel.append(obj.channels[i].tags[j]);
                    }
                }
                break;
            }
        }
        tagViewIndicator.close();
    }

    function showFailureInfo(error){
        signalcenter.showMessage(error);
        tagViewIndicator.close();
    }
}
