import QtQuick 2.5
import Qt.labs.controls 1.0
import Material 0.2
import "MainPage"

TabbedPage{
    id: mainPage;
    property var contents: [mainTab.item, channelTab.item];
    title: qsTr("Youku");
    tabs: contents;
    backgroundColor: Palette.colors["white"]["500"];
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
            width: swipeView.width;
            height: swipeView.height;
            sourceComponent: MainTabComponent{}
        }
        Loader{
            id: channelTab;
            width: swipeView.width;
            height: swipeView.height;
            sourceComponent: ChannelTabComponent{}
        }
        Binding{
            target: tabBar;
            property: "selectedIndex";
            value: swipeView.currentIndex;
        }
    }   
}
