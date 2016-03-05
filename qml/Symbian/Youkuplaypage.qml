// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "BaseComponent"
import "../JavaScript/Youku.js" as Youku
MyPage{
    id:youkuplaypage;
    property bool firstStart:true;
    property string id;
    property string thumurl;
    property string ykplaydet;
    property string ykplaycomp;
    property string ykplaystat;
    property string ykplayurl;
    property string ykplaydata;
    property int ykplaydatanum;
    onVisibleChanged: if (visible && firstStart){
                          firstStart = false;
                          Youku.youku.getDetail(id, loadDetail, loadFail);
                          Youku.youku.getVideos(id, "1", "50", loadVideos, loadFail);
                          //Script.getyoukuvideoinfo(id);
                          //Script.getykep(id,"1","50",0)
                      }
    tools: ToolBarLayout{
        ToolButton{
            iconSource: "toolbar-back";
            onClicked: pageStack.pop();
            platformInverted: true;
        }
    }
    ListModel{
        id:ykplaydir;
    }
    ListModel{
        id:ykplayactor;
    }
    ListModel{
        id:ykplaygen;
    }
    ListModel{
        id:ykep;
    }
    Head{
        id:head;
        titleText: title;
        z:1;
    }
    Flickable{
        anchors.top: head.bottom;
        anchors.topMargin: 10;
        anchors.right: parent.right;
        anchors.left: parent.left;
        anchors.rightMargin: 10;
        anchors.leftMargin: 10;
        anchors.bottom: parent.bottom;
        flickableDirection: Flickable.VerticalFlick;
        contentHeight: thumandinfo.height+detail.height+episode.height+30;
        ListRect{
            id:thumandinfo
            height: thum.height+info.height+20;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.top: parent.top;
            shadowsize: 5;
            Image{
                id:thum;
                anchors.top: parent.top;
                anchors.topMargin: 5;
                anchors.right: parent.right;
                anchors.rightMargin: 5;
                anchors.left: parent.left;
                anchors.leftMargin: 5;
                height: 185.625;
                sourceSize.height: height;
                sourceSize.width: width;
                smooth: true;
                source: thumurl;
            }
            Column{
                id:info;
                anchors.top: thum.bottom;
                anchors.topMargin: 10;
                anchors.left: thum.left;
                anchors.leftMargin: 5;
                spacing: 5;
                Text{
                    text: "片名："+title;
                    font.pixelSize: 15;
                    width: thum.width-10;
                    wrapMode: Text.WrapAnywhere;
                }
                Text{
                    text:"状态："+ykplaycomp+" "+ykplaystat;
                    font.pixelSize: 15;
                    width: thum.width-10;
                    wrapMode: Text.WrapAnywhere;
                }
                Row{
                    Text{
                        text: "类型：";
                        font.pixelSize:15;
                    }
                    Repeater{
                        model: ykplaygen;
                        Text{
                            text: model.genre+" ";
                            font.pixelSize: 15;
                        }
                    }
                }
                Row{
                    Text{
                        text: "导演/原作：";
                        font.pixelSize: 15;
                    }
                    Repeater{
                        model: ykplaydir;
                        Text{
                            text: model.dire+" ";
                            font.pixelSize: 15;
                        }
                    }
                }
                Row{
                    Text{
                        text: "演员：";
                        font.pixelSize: 15;
                    }
                    Repeater{
                        model: ykplayactor;
                        Text{
                            text: model.actor+" ";
                            font.pixelSize: 15;
                        }
                    }
                }
            }
        }
        ListRect{
            id:detail;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.top: thumandinfo.bottom;
            anchors.topMargin: 10;
            shadowsize: 5;
            height: detailtext.height+20;
            Text{
                id:detailtext;
                anchors.left: parent.left;
                anchors.right: parent.right;
                anchors.top: parent.top;
                anchors.margins: 10;
                wrapMode: Text.WrapAnywhere;
                text: "简介："+ykplaydet;
                font.pixelSize: 15;
            }
        }
        ListRect{
            id: episode;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.top: detail.bottom;
            anchors.topMargin: 10;
            height: eptopbuttons.height+epview.height+20;
            shadowsize: 5;
            Eptopbuttons{
                id:eptopbuttons;
                anchors.top: parent.top;
            }
            Grid{
                id:epview;
                anchors.left: parent.left;
                anchors.right: parent.right;
                anchors.top: eptopbuttons.bottom;
                anchors.margins: 10;
                spacing: 10;
                columns: 8;
                Repeater{
                    id:epbuttons;
                    property string selectitem;
                    EpButton{
                        text: index+1;
                        onClicked:{
                            epbuttons.selectitem=text;
                            switch(eptopbuttons.selectitem){
                            case 1:
                                //Script.getykplayurl(model.videoid,2);
                                Youku.youku.getPlayUrl(model.videoid, "mp4hd", loadPlayUrl, loadFail)
                                break;
                            case 2:
                                //Script.getykplayurl(model.videoid,1);
                                //Youku.youku.getPlayUrl(model.videoid, "3gphd", loadPlayUrl, loadFail)
                                break;
                            case 3:
                                //Script.getykplayurl(model.videoid,1);
                                break;
                            }
                        }
                        isnew: model.is_new;
                    }
                    model: ykep;
                }
            }
        }
    }

    function loadDetail(oritxt){
        var obj = JSON.parse(oritxt);
        ykplaydet = obj.detail.desc;
        ykplaystat = obj.detail.stripe_bottom;
        if(obj.detail.completed===1)
            ykplaycomp = "已完结";
        else ykplaycomp = "未完结";
        ykplayactor.clear();
        ykplaydir.clear();
        ykplaygen.clear();
        if(obj.detail.tag_type==="动漫"){
            for(var i in obj.detail.original){
                ykplaydir.append({"dire":obj.detail.original[i]});
            }
            for(i in obj.detail.voice){
                ykplayactor.append({"actor":obj.detail.voice[i]});
            }
        }
        else{
            for(var i in obj.detail.director){
                ykplaydir.append({"dire":obj.detail.director[i]});
            }
            for(i in obj.detail.performer){
                ykplayactor.append({"actor":obj.detail.performer[i]});
            }
        }
        for(i in obj.detail.genre){
            ykplaygen.append({"genre":obj.detail.genre[i]});
        }
    }
    function loadVideos(oritxt){
        var obj=JSON.parse(oritxt)
        if(obj.pg===1){
            ykep.clear();
        }
        for(var i in obj.results){
            ykep.append(obj.results[i]);
        }
    }
    function loadPlayUrl(oritxt){
        console.log(oritxt)
        var obj = JSON.parse(oritxt);
        if(obj.error.code !== 0){
            loadFail(obj.error);
            return;
        }
        var Urls = "";
        for(var i in obj.videoinfo.urls){
            Urls += obj.videoinfo.urls[i];
            Urls += "\n";
        }
        utility.launchPlayer(Urls);
    }

    function loadFail(erro){
        signalcenter.showMessage(erro);
    }

}
