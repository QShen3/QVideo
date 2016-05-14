// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../JavaScript/Youku.js" as Youku
import "../BaseComponent"
import "Component"
import "Delegate"

MyPage{
    id: searchpage;

    property string format: "";
    property string cid: "";
    property string seconds: "0";
    property string secondsEnd: "0";
    property string ob: "0";
    property int pg: 1;
    title: qsTr("Sreach");

    Head{
        id: head;
        color: "#06a7e1";
        titleText: title;
        z: 1;
    }

    tools: MyToolBarLayout{
        ToolButton{
            iconSource: "toolbar-back";
            onClicked:{
                pageStack.pop();
            }
            platformInverted: true;
        }
        ToolButton{
            iconSource: "toolbar-settings"
            platformInverted: true;
            onClicked: pageStack.push(Qt.resolvedUrl("../SettingPage.qml"));
        }
    }

    Text{
        anchors.centerIn: parent;
        text: qsTr("There are no results...");
        visible: videomodel.count==0 && programmodel.count==0 && !hotview.visible;
    }

    SearchField{
        id: searchfield;
        anchors{
            left: parent.left;
            top: head.bottom;
            right: parent.right;
            margins: 12;
        }
        onClicked: {
            if(text != ""){
                mainindicator.open();
                pg = 1;
                Youku.youku.getDSearch(text, loadProgram, showLoadFailureInfo);
                Youku.youku.getSearch(text, format, cid, seconds, secondsEnd, ob, pg.toString(), loadVideos, showLoadFailureInfo);
            }
        }
    }

    GridView{
        id: hotview;
        anchors{
            left: parent.left;
            top: searchfield.bottom;
            topMargin: 15;
            right: parent.right;
            bottom: parent.bottom;
        }
        visible: searchfield.text == "";
        clip: true;
        cellWidth: 180;
        cellHeight: 60;
        model: hotwordsmodel;
        delegate: HotWordComponent{}
        LoadingIndicator{
            id: hotwordsindicator;
            anchors.centerIn: parent;
        }
    }

    Flickable{
        id: mainview;
        anchors{
            left: parent.left;
            top: searchfield.bottom;
            topMargin: 15;
            right: parent.right;
            bottom: parent.bottom;
        }
        visible: !hotview.visible;
        clip: true;
        contentHeight: program.height + videos.height + 15;
        flickableDirection: Flickable.VerticalFlick;
        Column{
            id: program;
            spacing: 12;
            anchors{
                left: parent.left;
                right: parent.right;
                top: parent.top;
            }
            Repeater{
                model: programmodel;
                delegate: SearchProgramComponent{}
            }
        }

        Grid{
            id: videos;
            anchors{
                left: parent.left;
                right: parent.right;
                top: program.bottom;
                topMargin: 15;
            }
            columns: 2;
            Repeater{
                model: videomodel;
                delegate: SearchVideoComponent{}
            }
        }

        LoadingIndicator{
            id: mainindicator;
            anchors.centerIn: parent;
        }

        onMovementEnded: {
            if(contentY >= (contentHeight - height - 1)){
                console.log("page++")
                pg++;
                Youku.youku.getSearch(searchfield.text, format, cid, seconds, secondsEnd, ob, pg.toString(), loadVideos, showLoadFailureInfo);
                mainindicator.open();
            }
        }
    }
    ScrollDecorator{
        platformInverted: true;
        flickableItem: mainview;
    }

    ListModel{
        id: hotwordsmodel;
    }

    ListModel{
        id: programmodel;
    }

    ListModel{
        id: videomodel;
    }

    Component.onCompleted: {
        Youku.youku.getHot("8", loadHotWords, showLoadHotFailureInfo);
        hotwordsindicator.open();
    }

    function loadHotWords(oritxt){
        var obj = JSON.parse(oritxt);

        if(obj.status !== "success"){
            showLoadHotFailureInfo(obj.status);
            return;
        }

        hotwordsmodel.clear();
        for(var i in obj.data){
            hotwordsmodel.append(obj.data[i]);
        }
        hotwordsindicator.close();
    }

    function loadProgram(oritxt){
        var obj = JSON.parse(oritxt);

        if(obj.status !== "success"){
            showLoadFailureInfo(obj.status);
        }

        programmodel.clear();
        for(var i in obj.results){
            if(obj.results[i].is_youku === 1){
                programmodel.append(obj.results[i]);
            }
        }
        mainindicator.close();
    }

    function loadVideos(oritxt){
        var obj = JSON.parse(oritxt);

        if(obj.status !== "success"){
            showLoadFailureInfo(obj.status);
        }

        if(obj.results.length === 0){
            signalcenter.showMessage(qsTr("No more avaliable!"));
            mainindicator.close();
            pg--;
            return;
        }

        if(obj.pg === 1){
            videomodel.clear();
        }

        for(var i in obj.results){
            if(!obj.results[i].showid){
                obj.results[i].showid = "";
            }
            videomodel.append(obj.results[i]);
        }
        mainindicator.close();
    }

    function showLoadHotFailureInfo(error){
        hotwordsindicator.close();
        signalcenter.showMessage(error);
    }

    function showLoadFailureInfo(error){
        mainindicator.close();
        signalcenter.showMessage(error);
    }
}
