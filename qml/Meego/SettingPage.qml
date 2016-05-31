// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1
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
    tools: ToolBarLayout{
        ToolIcon{
            iconId: "toolbar-back";
            onClicked:{
                pageStack.pop();
            }
            platformStyle: ToolItemStyle{
                inverted: true;
            }
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
            width: 480;
            spacing: 28;
            CheckBox{
                anchors.left: parent.left;
                anchors.leftMargin: 13;
                text: qsTr("Auto play");
                platformStyle: CheckBoxStyle{
                    inverted: true;
                }

                checked: settings.autoPlay;
                onCheckedChanged: settings.autoPlay = checked;
            }
            CheckBox{
                anchors.left: parent.left;
                anchors.leftMargin: 13;
                text: qsTr("Auto check new version");
                platformStyle: CheckBoxStyle{
                    inverted: true;
                }
                checked: settings.autoCheckNewVersion;
                onCheckedChanged: settings.autoCheckNewVersion = checked;
            }
            SettingsItem{
                title: qsTr("Prefer format for Youku");
                subTitle: settings.preferFormat==="mp4" ? qsTr("High quality") : qsTr("General quality");               
                onClicked: preferformat.open();
            }
            Button{
                anchors.horizontalCenter: parent.horizontalCenter;
                /*platformStyle: ButtonStyle{
                    inverted: true;
                }*/

                width: 400;
                text: qsTr("Check for new version");
                onClicked: {
                    Utility.utility.getVersion(loadVersionInfo, signalcenter.showMessage);
                }
            }
            Button{
                anchors.horizontalCenter: parent.horizontalCenter;
                /*platformStyle: ButtonStyle{
                    inverted: true;
                }*/

                width: 400;
                text: qsTr("About");
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                }
            }

        }

    }
    Menu{
        id: preferformat;
        MenuLayout{
            MenuItem{
                text: qsTr("High quality");
                onClicked: settings.preferFormat = "mp4";
            }
            MenuItem{
                text: qsTr("General quality");
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
