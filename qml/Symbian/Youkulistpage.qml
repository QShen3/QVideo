// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "BaseComponent"
import "Delegate"
import "Youku"
import "../JavaScript/Youku.js" as Youku
import com.nokia.extras 1.1
MyPage{
    property string cid;
    property string ob:"1";
    property int pg: 1;
    property string area:"|";
    property string genre:"|";
    property string releaseyear:"|";
    property bool firstStart:true;
    id: youkulistpage;
    title: qsTr("Youku");
    onVisibleChanged: if (visible && firstStart){
                          firstStart = false
                          Youku.youku.getList(cid, ob, pg, "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
                      }
    Head{
        id:head;
        Image{
            anchors.left: parent.left;
            anchors.verticalCenter: parent.verticalCenter;
            source: "../pic/youku_logo.svg";
            smooth: true;
            width: 110;
            height: 55;
        }
        ToolButton{
            anchors.right: parent.right;
            anchors.verticalCenter: parent.verticalCenter;
            iconSource: "../pic/Winnow_button.svg";
            smooth: true;
            anchors.rightMargin: 10;
            platformInverted: true;
            onClicked:{
                sortmenu.open();
            }
        }
        z:1;
    }
    tools: ToolBarLayout{
        ToolButton{
            iconSource: "toolbar-back";
            onClicked: pageStack.pop();
            platformInverted: true;
        }
        ToolButton{
            iconSource: "toolbar-list"
            platformInverted: true;
            onClicked:{
                switch(cid){
                case "100":cartoonwinnowdia.open();return;
                case "97":tvdramawinnowdia.open();return;
                case "85":varietywinnowdia.open();return;
                case "96":moviewinnowdia.open();return;
                }
            }
        }
        ToolButton{
            iconSource: "toolbar-settings"
            platformInverted: true;
        }
    }
    CartoonWinnowDia{
        id:cartoonwinnowdia;
        onDiaaccepted:{
            genre=gettype();
            area=getarea();
            releaseyear=getyear();
            pg=1;
            Youku.youku.getList(cid, ob, pg, "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
        }
    }
    TVdramaWinnowDia{
        id:tvdramawinnowdia;
        onDiaaccepted:{
            genre=gettype();
            area=getarea();
            releaseyear=getyear();
            pg=1;
            Youku.youku.getList(cid, ob, pg, "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
        }
    }
    VarietyWinnowDia{
        id:varietywinnowdia;
        onDiaaccepted:{
            genre=gettype();
            area=getarea();
            releaseyear=getyear();
            pg=1;
            Youku.youku.getList(cid, ob, pg, "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
        }
    }
    MovieWinnowDia{
        id:moviewinnowdia;
        onDiaaccepted:{
            genre=gettype();
            area=getarea();
            releaseyear=getyear();
            pg=1;
            Youku.youku.getList(cid, ob, pg, "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
        }
    }
    ContextMenu {
        id: sortmenu;
        platformInverted: true;
        MenuLayout{
            MenuItem{
                text: "最新上线"
                onClicked:{
                    ob="1";
                    pg=1;
                    Youku.youku.getList(cid, ob, pg, "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
                }
                platformInverted: true;
            }
            MenuItem{
                text: "最热播放"
                onClicked:{
                    ob="2";
                    pg=1;
                    Youku.youku.getList(cid, ob, pg, "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
                }
                platformInverted: true;
            }
            MenuItem{
                text: "最多评论"
                onClicked:{
                    ob="3";
                    pg=1;
                    Youku.youku.getList(cid, ob, pg, "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
                }
                platformInverted: true;
            }
        }
    }

    ListModel{
        id:youkulist;
    }
    Rectangle{
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.top: head.bottom;
        height: 25;
        color: "#f1f1f1"
        z:1;
        Text{
            anchors.verticalCenter: parent.verticalCenter;
            anchors.left: parent.left;
            anchors.leftMargin: 10;
            text:{
                switch(ob) {
                case "1":return "最新上线 "+genre+area+releaseyear;
                case "2":return "最热播放 "+genre+area+releaseyear;
                case "3":return "最多评论 "+genre+area+releaseyear;
                }
            }
            font.pixelSize: 14;
        }
    }
    Flickable {
        id:mainview;
        flickableDirection: Flickable.VerticalFlick;
        clip: true;
        contentHeight: grid.height+70;
        anchors{
            top:head.bottom;
            topMargin:25;
            left:parent.left;
            leftMargin:10;
            right:parent.right;
            rightMargin:10;
            bottom:parent.bottom;
        }
        Grid{
            id:grid;
            anchors.right: parent.right;
            anchors.left: parent.left;
            spacing:20;
            columns: 2;
            Repeater{
                id:list;
                delegate: YoukuListDele{}
                model: youkulist;
            }

        }
        ListRect{
            anchors.right: grid.right;
            anchors.left: grid.left;
            anchors.top: grid.bottom;
            anchors.topMargin: 20;
            height: 30;
            Text{
                anchors.centerIn: parent;
                text: "下一页";
            }
            MouseArea{
                anchors.fill: parent;
                onClicked:{
                    pg++;
                    Youku.youku.getList(cid, ob, pg, "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
                }
            }
            visible: !app.loading;
        }
    }
    ScrollBar{
        flickableItem: mainview;
        anchors.left: mainview.right;
        anchors.top: mainview.top;
    }
    Component.onCompleted: {

    }

    function loadList(oritxt){
        var obj = JSON.parse(oritxt);
        if(obj.status !== "success"){
            loadFail(obj.status);
            return;
        }

        if(obj.pg==="1"){
            youkulist.clear();
        }
        for(var i in obj.results){
            youkulist.append(obj.results[i]);
        }
    }
    function loadFail(erro){
        signalcenter.showMessage(erro);
    }
}

