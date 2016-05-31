// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1

Item{
    id: root;
    signal clicked;
    property alias text: searchtext.text;
    height: 40;
    TextField{
        id: searchtext;
        //height: 27;
        anchors{
            left: parent.left;
            right: searchbutton.left;
            rightMargin: 12;
            verticalCenter: parent.verticalCenter;
        }
        //platformLeftMargin: 36;
        /*Item {
            id: clearButton;
            anchors {
                right: parent.right;
                //rightMargin: platformStyle.paddingMedium;
                rightMargin: 12;
                verticalCenter: parent.verticalCenter;
            }
            //height: platformStyle.graphicSizeSmall;
            height: 36;
            //width: platformStyle.graphicSizeSmall;
            width: 36;
            //opacity: root.activeFocus ? 1 : 0;
            opacity: searchtext.text == "" ? 0 : 1;
            Behavior on opacity {
                NumberAnimation { duration: 100; }
            }
            Image {
                anchors.fill: parent;
                //sourceSize: Qt.size(platformStyle.graphicSizeSmall, platformStyle.graphicSizeSmall);
                sourceSize: Qt.size(36, 36);
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
        }*/
        //Component.onCompleted: console.log(height);
    }
    Button{
        id: searchbutton;
        anchors.right: parent.right;
        anchors.verticalCenter: parent.verticalCenter;
        width: height;

        //iconSource: privateStyle.toolBarIconPath("toolbar-search", true);
        iconSource: "image://theme/icon-m-toolbar-search";
        onClicked: {
            root.clicked();
        }
    }
}
