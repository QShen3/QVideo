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

    property string id;
    property string userName;
    property string userId;
    property int totalVideo;
    property string reputation ;
    property variant area;
    property variant original;
    property variant voice;
    property string desc;

    property string currentVideoId: "";
    property string currentFormat: "";


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
            }
            MyListItem{
                height: 105;
                //enabled: false;
                Row{
                    spacing: 12;
                    height: 45;
                    Rectangle{
                        height: 45;
                        width: 5;
                        color: "#1056dd";
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
                        color: "#1056dd";
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
    }


    ListModel{
        id: videosmodel;
    }
    ListModel{
        id: streammodel;
    }

    ListModel{
        id: relatemodel;
    }
    function loadDetail(oritxt){
        var obj = JSON.parse(oritxt);
        if(obj.status !== "success"){
            showVideosFailureInfo(obj.status);
            return;
        }
        id = obj.detail.showid;
        title = obj.detail.title;
        totalVideo = obj.detail.episode_total
        reputation = obj.detail.reputation;
        area = obj.detail.area;
        original = obj.detail.original;
        voice = obj.detail.voice;
        desc = obj.detail.desc;

        userId = obj.detail.userid;
        userName = obj.detail.username;

        Youku.youku.getUserinfo(userId, "0", "0", loadUserinfo, showVideosFailureInfo);
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
            currentVideoId = obj.results[0].videoid;
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
        console.log(oritxt);
        var obj = JSON.parse(oritxt);

        if(obj.e.code !== 0){
            showVideosFailureInfo(obj.e.desc);
            return;
        }

        streammodel.clear();
        for(var i in obj.data.stream){
            if(obj.data.stream[i].stream_type === "flvhd" || obj.data.stream[i].stream_type === "flv" || obj.data.stream[i].stream_type === "3gphd"){
                streammodel.append({
                                       "stream_type": obj.data.stream[i].stream_type,
                                       "video_profile": qsTr("General quality"),
                                       "flag": "flvhd"
                                   })
            }
            else if(obj.data.stream[i].stream_type === "mp4" || obj.data.stream[i].stream_type === "mp4hd"){
                streammodel.append({
                                       "stream_type": obj.data.stream[i].stream_type,
                                       "video_profile": qsTr("High quality"),
                                       "flag": "mp4"
                                   })
            }
        }


    }

    function loadUrls(oritxt){
        //console.log(oritxt);
        var obj = JSON.parse(oritxt);

        videoplayer.setVideos(obj.streams.mp4.src, obj.streams.mp4.pieces[0].segs);
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
