// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../JavaScript/Utility.js" as Utility
import "BaseComponent"
MyPage{
    id: settingpage;
    title: qsTr("Settings");
    Head{
        id:head;
        titleText: title;
        z:1;
    }
    tools: MyToolBarLayout{
        ToolButton{
            iconSource: "toolbar-back";
            onClicked:{
                pageStack.pop();
            }
            platformInverted: true;
        }
    }

    Flickable{
        anchors{
            fill: parent;
            topMargin: head.height + 20;
        }
        flickableDirection: Flickable.VerticalFlick;
        clip: true;
        contentHeight: settingscolumn.height;
        Column{
            id: settingscolumn;
            width: 360;
            CheckBox{
                anchors.left: parent.left;
                anchors.leftMargin: 10;
                text: qsTr("Auto play");
                platformInverted: true;
                checked: settings.autoPlay;
                onCheckedChanged: settings.autoPlay = checked;
            }
            CheckBox{
                anchors.left: parent.left;
                anchors.leftMargin: 10;
                text: qsTr("Auto check new version");
                platformInverted: true;
                checked: settings.autoCheckNewVersion;
                onCheckedChanged: settings.autoCheckNewVersion = checked;
            }
            SelectionListItem{
                title: qsTr("Prefer format for Youku");
                subTitle: settings.preferFormat==="mp4" ? qsTr("High quality") : qsTr("General quality");
                platformInverted: true;
                onClicked: preferformat.open();
            }
            Rectangle{
                height: 21;
                width: 1;
            }
            Button{
                anchors.horizontalCenter: parent.horizontalCenter;
                platformInverted: true;
                width: 300;
                text: qsTr("Check for new version");
                onClicked: {
                    Utility.utility.getVersion(loadVersionInfo, signalcenter.showMessage);
                }
            }
            Rectangle{
                height: 21;
                width: 1;
            }
            Button{
                anchors.horizontalCenter: parent.horizontalCenter;
                platformInverted: true;
                width: 300;
                text: qsTr("About");
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                }
            }

        }

    }
    ContextMenu{
        id: preferformat;
        platformInverted: true;
        MenuLayout{
            MenuItem{
                text: qsTr("High quality");
                platformInverted: true;
                onClicked: settings.preferFormat = "mp4";
            }
            MenuItem{
                text: qsTr("General quality");
                platformInverted: true;
                onClicked: settings.preferFormat = "3gphd";
            }
        }
    }

    function loadVersionInfo(oritxt){
        var obj = JSON.parse(oritxt);

        if(Utility.versionStringToInt(obj.symbian.version) > Utility.versionStringToInt(appVersion)){
            if(utility.getLocale().substring(0, 2) === "zh"){
                newversiondialog.openDialog(obj.symbian.changeLog.zh, obj.symbian.url);
            }
            else{
                newversiondialog.openDialog(obj.symbian.changeLog.en, obj.symbian.url);
            }
        }
        else{
            signalcenter.showMessage(qsTr("The current version is the latest version"));
        }
    }
}
