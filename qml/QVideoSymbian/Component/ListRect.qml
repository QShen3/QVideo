// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Rectangle
         {
          id:root;
          width: 100;
          height: 62;
          color: "white";
          property int shadowsize:3;
          Rectangle
                   {
                    anchors.top: parent.bottom;
                    anchors.right: parent.right;
                    anchors.left: parent.left;
                    height:shadowsize;
                    gradient: Gradient
                                      {
                                       GradientStop
                                                   {
                                                    position: 0.0;
                                                    color: "lightgray" ;
                                                   }
                                       GradientStop
                                                   {
                                                    position: 1.0;
                                                    color: "#f1f1f1";
                                                   }
                                      }
                   }
          Rectangle
                   {
                    anchors.horizontalCenter: parent.right;
                    anchors.horizontalCenterOffset: shadowsize/2;
                    anchors.verticalCenter: parent.verticalCenter;
                    width:parent.height;
                    height:shadowsize;
                    rotation:-90;
                    gradient: Gradient
                                      {
                                       GradientStop
                                                   {
                                                    position: 0.0;
                                                    color: "lightgray" ;
                                                   }
                                       GradientStop
                                                   {
                                                    position: 1.0;
                                                    color: "#f1f1f1";
                                                   }
                                      }
                   }
     /*NumberAnimation on scale
                    {
                     id:anim1;
                     //running:ListView.onAdd;

                     duration:200;
                     from:0.7;
                     to:1;
                    }
     NumberAnimation on opacity
                    {
                     id:anim2;
                     //running:ListView.onAdd;
                     duration:200;
                     from:0.5;
                     to:1;
                    }*/
    }
