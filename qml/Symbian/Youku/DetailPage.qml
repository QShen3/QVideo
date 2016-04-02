// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../JavaScript/Youku.js" as Youku
import "../BaseComponent"
import "Component"

MyPage{
    id: detailpage;
    property string id;

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

    VideoPlayer{
        id: videoplayer;
        width: parent.width;
        height: width / 16 * 9;

        urls: ["file:///E:/Others/[00].mp4", "file:///E:/Others/[01].mp4"];
        total: 2;
    }

    ListModel{
        id: videosmodel;
    }

    function loadVideos(oritxt){
        var obj = JSON.parse(oritxt);
        if(obj.status === "success"){
            videosmodel.clear();
            for(var i in obj.results){
                videosmodel.append(obj.results[i]);
            }
            var command = "you-get -y localhost:23333 --json http://v.youku.com/v_show/id_" + obj.results[0].videoid + ".html";
            Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
        }
        else{
            showVideosFailureInfo(obj.status);
        }
    }

    function loadUrls(oritxt){
        console.log(oritxt);
        var obj = JSON.parse(oritxt);


    }

    function showVideosFailureInfo(error){
        signalcenter.showMessage(error);
    }

    onVisibleChanged: {
        //console.log(id)
        if(visible){
            videoplayer.start(0, 0);
        }
    }

}
