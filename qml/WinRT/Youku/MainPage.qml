import QtQuick 2.5
import Qt.labs.controls 1.0
import Material 0.2
import "MainPage"

Page{
    id: mainPage;
    property var contents: swipeView.contentChildren;
    title: qsTr("Youku");
    tabs: contents;
    backgroundColor: Palette.colors["grey"]["50"];
    tabBar.fullWidth: {
        switch(Device.type){
        case 0:
            return true;
        case 1:
            return false;
        case 2:
            return false;
        case 3:
            return false;
        case 4:
            return false;
        case 5:
            return true;
        default:
            return true;
        }
    }

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

    SwipeView{
        id: swipeView;
        anchors.fill: parent;
        currentIndex: tabBar.selectedIndex;


        Loader{
            id: mainTab;
            property string title: qsTr("Home");
            property string iconName: "action/home";
            width: swipeView.width;
            height: swipeView.height;
            sourceComponent: MainTabComponent{}
        }
        Loader{
            id: channelTab;
            property string title: qsTr("Channel");
            property string iconName: "navigation/apps";
            width: swipeView.width;
            height: swipeView.height;
            active: false;
            sourceComponent: ChannelTabComponent{}
        }
        Binding{
            target: tabBar;
            property: "selectedIndex";
            value: swipeView.currentIndex;
        }
        onCurrentItemChanged: {
            /*switch(currentItem){
            case channelTab:
                if(!channelTab.active){
                    channelTab.active = true;
                }
                break;
            default:
                break;
            }*/
            if(!currentItem.active){
                currentItem.active = true;
            }
        }
    }   
}
