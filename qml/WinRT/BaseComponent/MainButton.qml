import QtQuick 2.5
import Material 0.2


Card{
    property alias icoUrl: icon.source;
    width: Units.dp(150);
    height: Units.dp(100);
    //width: 200;
    Image{
        id:icon;
        anchors.centerIn: parent;
        sourceSize.width: parent.width;
        sourceSize.height:  parent.width / 2;
        width: sourceSize.width;
        height: sourceSize.height;
    }
}

