// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../JavaScript/Youku.js" as Youku
import "../BaseComponent"
import "Component"
import "Delegate"

MyPage{
    id: detailpage;
    property bool isLoaded: false;
    property bool firstStart: true;

    property string id;
    property string userName;
    property string userId;
    property int totalVideo;
    property string showDate: "";
    property string reputation: "";
    property variant genre;
    property variant area;
    property variant director;
    property variant performer;
    property variant host;
    property variant original;
    property variant voice;
    property variant production;
    property string desc: "";

    property string currentVideoId: "";
    property string currentFormat: "";

    property int episodePage: 1;
    property int relatePage: 1;

    tools: MyToolBarLayout{
        ToolButton{
            iconSource: "toolbar-back";
            onClicked:{
                videoplayer.stop();
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
            onClicked: pageStack.push(Qt.resolvedUrl("../SettingPage.qml"));
        }
    }

    VideoPlayer{
        //Rectangle{
        id: videoplayer;
        //anchors.horizontalCenter: parent.horizontalCenter;
        width: parent.width;
        height: width / 16 * 9;
        z: 2;
        //color: "black"
        //urls: ["file:///E:/Others/[00].mp4", "file:///E:/Others/[01].mp4"];
        //total: 2;

    }

    Flickable{
        anchors{
            fill: parent;
            //topMargin: videoplayer.height + minivideocontroler.height;
            topMargin: videoplayer.height
        }
        clip: true;
        contentHeight: column.height;
        Column{
            id: column;
            anchors{
                left: parent.left;
                right: parent.right;
                top: parent.top;
            }
            spacing: 6;
            MyListItem{
                Text{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        left: parent.left;
                        leftMargin: 10;
                    }
                    width: 195;
                    clip: true;
                    text: title;
                }
                Row{
                    anchors{
                        verticalCenter: parent.verticalCenter;
                        right: parent.right;
                        rightMargin: 15;
                    }
                    height: 45;
                    spacing: 12;
                    Text{
                        anchors.verticalCenter: parent.verticalCenter;
                        text: qsTr("Details");
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        sourceSize: Qt.size(20, 20);
                        smooth: true;
                        source: "../../pic/icon-m-toolbar-next.png";
                    }
                }
                onClicked: {
                    loader.source = "DetailPage/VideoInfo.qml";
                    loader.state = "open";
                }
            }
            MyListItem{
                height: videosmodel.count==0 ? 0 : 105;
                visible: videosmodel.count != 0;
                //enabled: false;
                Row{
                    spacing: 12;
                    height: 45;
                    Rectangle{
                        height: 45;
                        width: 5;
                        color: "#06a7e1";
                    }
                    Text {
                        text: qsTr("Choose episode");
                        font.pixelSize: 18
                        anchors.verticalCenter: parent.verticalCenter;
                    }
                }
                Row{
                    anchors{
                        right: parent.right;
                        rightMargin: 15;
                    }
                    height: 45;
                    spacing: 12;
                    Text{
                        anchors.verticalCenter: parent.verticalCenter;
                        //text: qsTr("Updated to Episode ") + totalVideo;
                        text: totalVideo;
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        sourceSize: Qt.size(20, 20);
                        smooth: true;
                        source: "../../pic/icon-m-toolbar-next.png";
                    }
                }
                ListView{
                    anchors{
                        top: parent.top;
                        topMargin: 45;
                        left: parent.left;
                        right: parent.right;
                    }
                    clip: true;
                    height: 60;
                    orientation: ListView.Horizontal;
                    model: videosmodel;
                    delegate: EpisodeComponent{}
                }
                onClicked: {
                    loader.source = "DetailPage/EpisodeList.qml";
                    loader.state = "open";
                }
            }
            MyListItem{
                Image{
                    id: userAvatar;
                    anchors{
                        left: parent.left;
                        leftMargin: 15;
                        verticalCenter: parent.verticalCenter;
                    }
                    sourceSize: Qt.size(45, 45);
                }
                Text{
                    anchors{
                        left: userAvatar.right;
                        leftMargin: 12;
                        verticalCenter: parent.verticalCenter;
                    }
                    text: userName;
                }
            }
            MyListItem{
                height: 45 + relatevideo.height;
                Row{
                    spacing: 12;
                    height: 45;
                    Rectangle{
                        height: 45;
                        width: 5;
                        color: "#06a7e1";
                    }
                    Text {
                        text: qsTr("Relate");
                        font.pixelSize: 18
                        anchors.verticalCenter: parent.verticalCenter;
                    }
                }
                Row{
                    anchors{
                        right: parent.right;
                        rightMargin: 15;
                    }
                    height: 45;
                    spacing: 12;
                    Text{
                        anchors.verticalCenter: parent.verticalCenter;
                        text: qsTr("More ");
                    }
                    Image{
                        anchors.verticalCenter: parent.verticalCenter;
                        sourceSize: Qt.size(20, 20);
                        smooth: true;
                        source: "../../pic/icon-m-toolbar-next.png";
                    }
                }
                Grid{
                    id: relatevideo;
                    anchors{
                        left: parent.left;
                        right: parent.right;
                        top: parent.top;
                        topMargin: 45;
                    }
                    columns: 3;
                    Repeater{
                        model: relatemodel;
                        delegate: RelateComponent{}
                    }
                }
                onClicked: {
                    loader.source = "DetailPage/RelateList.qml";
                    loader.state = "open";
                }
            }

        }
    }
    Loader{
        id: loader
        anchors{
            top: parent.top;
            left: parent.left;
            bottom: parent.bottom;
            topMargin: videoplayer.height;
        }
        width: 360;
        states: [
            State{
                name: "";
                PropertyChanges{
                    target: loader;
                    anchors.leftMargin: 360;
                }
            },
            State{
                name: "open";
                PropertyChanges{
                    target: loader;
                    anchors.leftMargin: 0;
                }
            }
        ]
        transitions: [
            Transition {
                NumberAnimation{
                    properties: "anchors.leftMargin";
                    easing.type: Easing.OutCubic;
                }
            }
        ]
    }


    ListModel{
        id: videosmodel;
    }
    ListModel{
        id: fullvideomodel;
    }

    ListModel{
        id: streammodel;
    }

    ListModel{
        id: relatemodel;
    }
    ListModel{
        id: fullrelatemodel;
    }
    Binding{

    }

    function loadDetail(oritxt){
        var obj = JSON.parse(oritxt);
        if(obj.status !== "success"){
            showVideosFailureInfo(obj.status);
            return;
        }
        id = obj.detail.showid ? obj.detail.showid : obj.detail.videoid;
        title = obj.detail.title;
        showDate = obj.detail.showdate ? obj.detail.showdate : "";
        totalVideo = obj.detail.episode_total ? obj.detail.episode_total : 0;
        reputation = obj.detail.reputation ? obj.detail.reputation : "";
        genre = obj.detail.genre;
        area = obj.detail.area;
        director = obj.detail.director;
        performer = obj.detail.performer;
        host = obj.detail.host;
        original = obj.detail.original;
        voice = obj.detail.voice;
        production = obj.detail.production;
        desc = obj.detail.desc ? obj.detail.desc : "";

        userId = obj.detail.userid;
        userName = obj.detail.username;

        Youku.youku.getUserinfo(userId, "0", "0", loadUserinfo, showVideosFailureInfo);

        if(obj.detail.paid === 1){
            signalcenter.showMessage(qsTr("This Video is only for Youku's VIP. You may not be able to watch it completely."));
        }
    }

    function loadVideos(oritxt){
        var obj = JSON.parse(oritxt);
        if(obj.status !== "success"){
            showVideosFailureInfo(obj.status);
            return;
        }
        totalVideo = obj.total;
        if(obj.pg === 1){
            videosmodel.clear();
        }
        for(var i in obj.results){
            videosmodel.append(obj.results[i]);
        }
        if(currentVideoId == ""){
            if(obj.results.length === 0){
                currentVideoId = id;
            }
            else{
                currentVideoId = obj.results[0].videoid;
            }
        }
        Youku.youku.getPlay(currentVideoId, loadStreams, showVideosFailureInfo);
        /*if(settings.autoPlay){
            if(settings.preferFormat == "mp4"){

            }

            var command = "you-get --json --format=mp4 http://v.youku.com/v_show/id_" + currentVideoId + ".html";
            Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
        }*/
    }

    function loadStreams(oritxt){
        //console.log(oritxt);
        var obj = JSON.parse(oritxt);

        if(obj.e.code !== 0){
            showVideosFailureInfo(obj.e.desc);
            return;
        }

        streammodel.clear();
        for(var i in obj.data.stream){
            if(obj.data.stream[i].stream_type === "3gphd"){
                streammodel.append({
                                       "stream_type": "3gphd",
                                       "video_profile": qsTr("General quality"),
                                   })
            }
            else if(obj.data.stream[i].stream_type === "mp4" || obj.data.stream[i].stream_type === "mp4hd"){
                streammodel.append({
                                       "stream_type": "mp4",
                                       "video_profile": qsTr("High quality"),
                                   })
            }
        }

        if(streammodel.count == 0){
            signalcenter.showMessage(qsTr("No supported formats..."));
            return;
        }

        if(firstStart){
            if(settings.autoPlay){
                if(settings.preferFormat == "mp4"){
                    for(var i=0; i<streammodel.count; i++){
                        if(streammodel.get(i).stream_type === "mp4"){
                            var command = "get-video " + "mp4" + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                            currentFormat = "mp4";
                            Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
                            break;
                        }
                    }
                    if(i == streammodel.count){
                        var command = "get-video " + streammodel.get(0).stream_type + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                        currentFormat = streammodel.get(0).stream_type;
                        Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
                    }
                }
                else{
                    for(var i=0; i<streammodel.count; i++){
                        if(streammodel.get(i).stream_type === "3gphd"){
                            var command = "get-video " + "3gphd" + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                            currentFormat = "3gphd";
                            Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
                            break;
                        }
                    }
                    if(i == streammodel.count){
                        var command = "get-video " + streammodel.get(0).stream_type + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                        currentFormat = streammodel.get(0).stream_type;
                        Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
                    }
                }
            }
            firstStart = false;
        }
        else{
            if(settings.preferFormat == "mp4"){
                for(var i=0; i<streammodel.count; i++){
                    if(streammodel.get(i).stream_type === "mp4"){
                        var command = "get-video " + "mp4" + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                        currentFormat = "mp4";
                        Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
                        break;
                    }
                }
                if(i == streammodel.count){
                    var command = "get-video " + streammodel.get(0).stream_type + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                    currentFormat = streammodel.get(0).stream_type;
                    Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
                }
            }
            else{
                for(var i=0; i<streammodel.count; i++){
                    if(streammodel.get(i).stream_type === "3gphd"){
                        var command = "get-video " + "3gphd" + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                        currentFormat = "3gphd";
                        Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
                        break;
                    }
                }
                if(i == streammodel.count){
                    var command = "get-video " + streammodel.get(0).stream_type + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                    currentFormat = streammodel.get(0).stream_type;
                    Youku.youku.getUrls(command, loadUrls, showVideosFailureInfo);
                }
            }
        }
    }

    function loadUrls(oritxt){
        var obj = JSON.parse(oritxt);
        videoplayer.setVideos(obj.streams[currentFormat].src, obj.streams.mp4.pieces[0].segs, true);

        videoplayer.start();
    }

    function loadUserinfo(oritxt){
        var obj = JSON.parse(oritxt);
        if(obj.status !== "success"){
            showVideosFailureInfo(obj.status);
            return;
        }
        userAvatar.source = obj.results.middle;
        userName = obj.results.name;
    }

    function loadRelate(oritxt){
        var obj = JSON.parse(oritxt);
        if(obj.status !== "success"){
            showVideosFailureInfo(obj.status);
            return;
        }
        if(obj.pg === 1){
            relatemodel.clear();
        }
        for(var i in obj.results){
            relatemodel.append(obj.results[i]);
        }
    }

    function showVideosFailureInfo(error){
        signalcenter.showMessage(error);
    }

    onVisibleChanged: {
        if(visible && !isLoaded){
            Youku.youku.getVideos(id, "vid|titl|lim|is_new|pv", "2", "1", "100", loadVideos, showVideosFailureInfo);
            Youku.youku.getDetail("", id, loadDetail, showVideosFailureInfo);
            Youku.youku.getRelate(id, "1", "6", loadRelate, showVideosFailureInfo);
            isLoaded = true;
        }
    }

}
