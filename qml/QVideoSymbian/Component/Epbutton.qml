
// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle
         {
          property alias text:text.text;
          property alias isnew:isnew.visible;
          signal clicked;
          width: 30;
          height: 30;
          color: "white";
          border.color: "lightgray";
          border.width: 1;
          Text
              {
               id:text;
               anchors.horizontalCenter: parent.horizontalCenter;
               anchors.verticalCenter: parent.verticalCenter;
               text: "gray";
              }
          Rectangle
                   {
                    id:isnew;
                    width: 15;
                    height: 15;
                    anchors.verticalCenter: parent.top;
                    anchors.horizontalCenter: parent.right;
                    color: "red";
                    radius: 5;
                    Text
                        {
                         anchors.verticalCenter: parent.verticalCenter;
                         anchors.horizontalCenter: parent.horizontalCenter;
                         text: "新"
                         font.pixelSize: 9;
                        }
                   }
          MouseArea
                   {
                    anchors.fill: parent;
                    onClicked:
                             {
                              parent.clicked();                             
                             }
                    onPressAndHold:
                                  {
                                   parent.color="lightgray";
                                  }
                   }
         }
