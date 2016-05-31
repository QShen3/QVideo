// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1
import "../../../JavaScript/Youku.js" as Youku
import "../../BaseComponent"
import "../Delegate"
Component{
    id: subpagetype4;
    Item {
        width: 480;
        height: youkusubpage.height - head.height;
        Flickable{
            id: flicker;
            anchors.fill: parent;
            contentHeight: subpagecolumn.height;
            flickableDirection: Flickable.VerticalFlick;
            clip: true;
            Grid{
                id: subpagecolumn
                width: 480;
                columns: 3;
                Repeater{
                    model: subpagemodel;
                    delegate: SubPageComponent{}
                }
            }
            onMovementEnded: {
                if(contentY >= (contentHeight - height)){
                    console.log("page++")
                    pg++;
                    Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, filterString, ob, pg, loadsubpage, showSubPageFailureInfo);
                    subpageind.open();
                }
            }
        }
        ScrollDecorator{
            flickableItem: flicker;
            platformStyle: ScrollDecoratorStyle{
                inverted: true;
            }
        }
    }
}
