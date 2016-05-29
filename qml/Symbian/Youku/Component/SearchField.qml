// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1

Item{
    id: root;
    signal clicked;
    property alias text: searchtext.text;
    height: 30;
    TextField{
        id: searchtext;
        //height: 27;
        anchors{
            left: parent.left;
            right: searchbutton.left;
            rightMargin: 9;
            verticalCenter: parent.verticalCenter;
        }
        //platformLeftMargin: 36;
        platformInverted: true;
        Item {
            id: clearButton;
            anchors {
                right: parent.right;
                //rightMargin: platformStyle.paddingMedium;
                rightMargin: 9;
                verticalCenter: parent.verticalCenter;
            }
            //height: platformStyle.graphicSizeSmall;
            height: 27;
            //width: platformStyle.graphicSizeSmall;
            width: 27;
            //opacity: root.activeFocus ? 1 : 0;
            opacity: searchtext.text == "" ? 0 : 1;
            Behavior on opacity {
                NumberAnimation { duration: 100; }
            }
            Image {
                anchors.fill: parent;
                //sourceSize: Qt.size(platformStyle.graphicSizeSmall, platformStyle.graphicSizeSmall);
                sourceSize: Qt.size(27, 27);
                source: privateStyle.imagePath(clearMouseArea.pressed?"qtg_graf_textfield_clear_pressed":"qtg_graf_textfield_clear_normal", true);
            }
            MouseArea {
                id: clearMouseArea;
                anchors.fill: parent;
                onClicked: {
                    searchtext.closeSoftwareInputPanel();
                    searchtext.text = "";
                    app.forceActiveFocus();
                    //searchtext.parent.forceActiveFocus();
                }
            }
        }
        //Component.onCompleted: console.log(height);
        onFocusChanged: {
            console.log("focus changed:" + focus);
            //forceActiveFocus()
        }
    }
    Button{
        id: searchbutton;
        anchors.right: parent.right;
        anchors.verticalCenter: parent.verticalCenter;
        platformInverted: true;
        iconSource: privateStyle.toolBarIconPath("toolbar-search", true);
        onClicked: {
            root.clicked();
        }
    }
}
