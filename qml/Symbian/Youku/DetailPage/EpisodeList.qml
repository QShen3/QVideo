// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../../JavaScript/Youku.js" as Youku
import "../../BaseComponent"
import "../Delegate"

Rectangle {
    id: root;

    width: 360;
    color: "#f5f5f5";
    MyListItem{
        id: title;
        anchors{
            top: parent.top;
            left: parent.left;
            right: parent.right;
        }
        Row{
            anchors{
                verticalCenter: parent.verticalCenter;
                left: parent.left;
                leftMargin: 9;
            }
            spacing: 12;
            Image{
                anchors.verticalCenter: parent.verticalCenter;
                source: "../../../pic/icon-m-toolbar-next.png";
                rotation: 180;
                sourceSize: Qt.size(20, 20);
                //source: privateStyle.imagePath("toolbar-previous");
            }
            Text{
                anchors.verticalCenter: parent.verticalCenter;
                text: qsTr("Episode");
            }
        }
        onClicked: {
            loader.state = "";
        }
    }
    GridView{
        id: episodeview;
        anchors.fill: parent;
        anchors.topMargin: title.height;
        clip: true;
        cellHeight: 60;
        cellWidth: 60;
        model: fullvideomodel;
        delegate: EpisodeComponent{}

        onMovementEnded: {
            console.log(contentY + " " + contentHeight + " " + height)
            if(contentY >= (contentHeight - height - 1)){
                console.log("page++")
                episodePage++;
                loadingindicator.open();
                Youku.youku.getVideos(id, "vid|titl|lim|is_new|pv", "2", episodePage.toString(), "100", loadFullVideos, showVideosFailureInfo);
            }
        }

        LoadingIndicator{
            id: loadingindicator;
            anchors.centerIn: parent;
        }
    }

    /*onVisibleChanged: {
        console.log(fullvideomodel.count + " here");
        if(fullvideomodel.count === 0){
            episodePage = 1;
            loadingindicator.open();
            Youku.youku.getVideos(id, "vid|titl|lim|is_new|pv", "2", episodePage.toString(), "100", loadFullVideos, showVideosFailureInfo);
        }
    }*/
    Component.onCompleted: {
        if(fullvideomodel.count === 0){
            episodePage = 1;
            loadingindicator.open();
            Youku.youku.getVideos(id, "vid|titl|lim|is_new|pv", "2", episodePage.toString(), "100", loadFullVideos, showVideosFailureInfo);
        }
    }

    function loadFullVideos(oritxt){
        loadingindicator.close();
        var obj = JSON.parse(oritxt);
        if(obj.status !== "success"){
            showVideosFailureInfo(obj.status);
            return;
        }
        if(obj.results.length === 0){
            signalcenter.showMessage(qsTr("No more avaliable!"));
            episodePage--;
            return;
        }
        if(obj.pg === 1){
            fullvideomodel.clear();
        }
        for(var i in obj.results){
            fullvideomodel.append(obj.results[i]);
        }
    }
}
