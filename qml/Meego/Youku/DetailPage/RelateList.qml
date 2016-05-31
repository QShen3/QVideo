// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../../../JavaScript/Youku.js" as Youku
import "../../BaseComponent"
import "../Delegate"

Rectangle {
    id: root;

    width: 480;
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
                leftMargin: 12;
            }
            spacing: 16;
            Image{
                anchors.verticalCenter: parent.verticalCenter;
                source: "image://theme/icon-m-toolbar-previous";
                //rotation: 240;
                sourceSize: Qt.size(27, 27);
                //source: privateStyle.imagePath("toolbar-previous");
            }
            Text{
                anchors.verticalCenter: parent.verticalCenter;
                font.pixelSize: 24;
                text: qsTr("Relate");
                color: "#3c3c3c";
            }
        }
        onClicked: {
            loader.state = "";
        }
    }
    Flickable{
        id: relateview;
        anchors.fill: parent;
        anchors.topMargin: title.height;
        contentHeight: grid.height;
        flickableDirection: Flickable.VerticalFlick;
        clip: true;
        Grid{
            id: grid;
            anchors{
                top: parent.top;
                left: parent.left;
                right: parent.right;
            }
            columns: 3;
            Repeater{
                model: fullrelatemodel;
                delegate: RelateComponent{}
            }
        }
        onMovementEnded: {
            if(contentY >= (contentHeight - height - 1)){
                console.log("page++")
                relatePage++;
                loadingindicator.open();
                Youku.youku.getRelate(id, relatePage.toString(), "18", loadFullRelate, showVideosFailureInfo);
            }
        }

        LoadingIndicator{
            id: loadingindicator;
            anchors.centerIn: parent;
        }
    }
    Component.onCompleted: {
        if(fullrelatemodel.count === 0){
            relatePage = 1;
            loadingindicator.open();
            Youku.youku.getRelate(id, relatePage.toString(), "15", loadFullRelate, showVideosFailureInfo);
        }
    }

    function loadFullRelate(oritxt){
        loadingindicator.close();
        var obj = JSON.parse(oritxt);
        if(obj.status !== "success"){
            showVideosFailureInfo(obj.status);
            return;
        }
        if(obj.results.length === 0){
            signalcenter.showMessage(qsTr("No more avaliable!"));
            relatePage--;
            return;
        }
        if(obj.pg === 1){
            fullrelatemodel.clear();
        }
        for(var i in obj.results){
            fullrelatemodel.append(obj.results[i]);
        }
    }


}
