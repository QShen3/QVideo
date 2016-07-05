import QtQuick 2.5
//import QtMultimedia 5.6
import Material 0.2
import "../../JavaScript/Youku.js" as Youku
import "Component"

Page{
    id: detailPage;
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

    actions: [
        Action{
            iconName: "action/search";
            hoverAnimation: true;
        },
        Action{
            iconName: "action/settings";
            hoverAnimation: true;
        },
        Action{
            iconName: "file/file_download";
            hoverAnimation: true;
        }
    ]

    VideoPlayer{
        id: videoPlayer;
        width: parent.width;
        height: width / 16 * 9;
        z: 2;
    }

    ListModel{
        id: videosmodel;
    }
    ListModel{
        id: streammodel;
    }

    Component.onCompleted: {
        Youku.youku.getVideos(id, "vid|titl|lim|is_new|pv", "2", "1", "100", loadVideos, showVideosFailureInfo);
    }

    function loadVideos(oritxt){
        var obj = JSON.parse(oritxt);
        if(obj.status !== "success"){
            showVideosFailureInfo(obj.status);
            return;
        }
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
    }

    function loadStreams(oritxt){
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
            else if(obj.data.stream[i].stream_type === "flv"){
                streammodel.append({
                                       "stream_type": "flv",
                                       "video_profile": qsTr("General quality"),
                                   })
            }
            else if(obj.data.stream[i].stream_type === "flvhd"){
                streammodel.append({
                                       "stream_type": "flvhd",
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
                        if(streammodel.get(i).stream_type === "3gphd" || streammodel.get(i).stream_type === "flv" || streammodel.get(i).stream_type === "flvhd"){
                            var command = "get-video " + streammodel.get(i).stream_type + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                            currentFormat = streammodel.get(i).stream_type;
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
                    if(streammodel.get(i).stream_type === "3gphd"  || streammodel.get(i).stream_type === "flv" || streammodel.get(i).stream_type === "flvhd"){
                        var command = "get-video " + "3gphd" + " http://v.youku.com/v_show/id_" + currentVideoId + ".html";
                        currentFormat = streammodel.get(i).stream_type;
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
        //console.log(oritxt);
        var obj = JSON.parse(oritxt)
        for(var i in obj.streams[currentFormat].src){
            videoPlayer.playList.addItem(obj.streams[currentFormat].src[i]);
        }
        videoPlayer.start();
    }

    function showVideosFailureInfo(error){
        signalcenter.showMessage(error);
    }
}
