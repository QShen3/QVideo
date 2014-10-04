// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Row
   {
    id:root;
    property int selectitem:1;
    anchors.horizontalCenter: parent.horizontalCenter;
    Rectangle
             {
              height: 30;
              width: 3;
              color: "lightblue";
             }
    Eptopbutton
               {
                id:buttona;
                height: 30;
                width: 50;
                state: "focus";
                Text
                    {
                     anchors.verticalCenter: parent.verticalCenter;
                     anchors.horizontalCenter: parent.horizontalCenter;
                     text: "清晰";
                    }
                MouseArea
                         {
                          anchors.fill: parent;
                          onClicked:
                                   {
                                    buttona.state="focus";
                                    buttonb.state="nofocus";
                                    buttonc.state="nofocus";
                                    selectitem=1;
                                   }
                         }
               }
    Rectangle
             {
              height: 30;
              width: 3;
              color: "lightblue";
             }
    Eptopbutton
               {
                id:buttonb;
                height: 30;
                width: 50;
                state: "nofocus";
                Text
                    {
                     anchors.verticalCenter: parent.verticalCenter;
                     anchors.horizontalCenter: parent.horizontalCenter;
                     text: "流畅";
                    }
                MouseArea
                         {
                          anchors.fill: parent;
                          onClicked:
                                   {
                                    buttonb.state="focus";
                                    buttona.state="nofocus";
                                    buttonc.state="nofocus";
                                    selectitem=2;
                                   }
                         }
               }
    Rectangle
             {
              height: 30;
              width: 3;
              color: "lightblue";
             }
    Eptopbutton
               {
                id:buttonc;
                height: 30;
                width: 50;
                state: "nofocus";
                Text
                    {
                     anchors.verticalCenter: parent.verticalCenter;
                     anchors.horizontalCenter: parent.horizontalCenter;
                     text: "下载";
                    }
                MouseArea
                         {
                          anchors.fill: parent;
                          onClicked:
                                   {
                                    buttonc.state="focus";
                                    buttona.state="nofocus";
                                    buttonb.state="nofocus";
                                    selectitem=3;
                                   }
                         }
               }
    Rectangle
             {
              height: 30;
              width: 3;
              color: "lightblue";
             }
   }
