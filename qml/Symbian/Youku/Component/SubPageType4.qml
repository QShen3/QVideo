// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../BaseComponent"
import "../Delegate"
Component{
    id: subpagetype4;
    Item {
        width: 360;
        height: youkusubpage.height - head.height;
        Flickable{
            anchors.fill: parent;
            contentHeight: subpagecolumn.height;
            flickableDirection: Flickable.VerticalFlick;
            clip: true;

            Grid{
                id: subpagecolumn
                width: 360;
                columns: 3;
                Repeater{
                    model: subpagemodel;
                    delegate: SubPageComponent{}
                }
            }
        }
    }
}
