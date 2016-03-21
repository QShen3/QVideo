// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Rectangle{
    id:root;
    signal clicked;
    width: 100;
    height: 62;
    //color: "white";
    color: "#f5f5f5";
    Rectangle{
        anchors.top: parent.top;
        width: parent.width;
        height: 1;
        color: "#ffffff";
        opacity: 0.75;
    }
    Rectangle{
        anchors.bottom: parent.bottom;
        width: parent.width;
        height: 1;
        color: "#000000";
        opacity: 0.1;
    }
    Rectangle{
        anchors.left: parent.left;
        height: parent.height;
        width: 1;
        color: "#ffffff";
        opacity: 0.75;
    }
    Rectangle{
        anchors.right: parent.right;
        height: parent.height;
        width: 1;
        color: "#000000";
        opacity: 0.1;
    }
    Rectangle{
        anchors.fill: parent;
        color: "#787878";
        opacity: 0.2;
        visible: mousearea.pressed;
    }
    Image{
        anchors.top: parent.bottom;
        width: parent.width;
        source: "../../pic/HeadShadow.png";
        opacity: 0.1;
    }

    MouseArea{
        id:mousearea;
        anchors.fill: parent;
        z: 1;
        onClicked: root.clicked();
    }
}
