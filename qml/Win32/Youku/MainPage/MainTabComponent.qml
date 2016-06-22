import QtQuick 2.5
import Material 0.2
Item{
    property string title: qsTr("Home");
    property string iconName: "action/home";
    width: swipeView.width;
    height: swipeView.height;
    Rectangle{
        anchors.fill: parent;
        color: Palette.colors["blue"]["700"];
    }
}
