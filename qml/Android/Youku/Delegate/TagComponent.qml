import QtQuick 2.5
import QtQuick.Layouts 1.3
import Material 0.2
Item {
    id: root;
    signal clicked;
    width: icon.width * 2;
    height: column.height * 1.5;
    Layout.alignment: Qt.AlignCenter
    Column{
        id: column;
        anchors.centerIn: parent;
        width: icon.width;
        Image{
            id: icon;
            //sourceSize: Qt.size(50, 50);
            //height: sourceSize.height;
            //width: sourceSize.width;
            height: Units.dp(50);
            width: Units.dp(50);
            smooth: true;
            source: model.icon;
        }
        Label{
            anchors.horizontalCenter: parent.horizontalCenter;
            style: "subheading";
            text: model.title;
        }
    }
    Ink{
        anchors.fill: parent;
        circular: true;
        onClicked: root.clicked();
    }

}
