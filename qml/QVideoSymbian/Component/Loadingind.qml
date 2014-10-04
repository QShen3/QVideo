import QtQuick 1.1
import com.nokia.symbian 1.1
Rectangle
         {
          id:loadingind;
          state: "close";
          width: 200;
          height: 124;
          anchors.centerIn: parent;
          color: "gray";
          opacity: 0.6;
          radius:8;
          BusyIndicator
                       {
                        id:indicator
                        width: 52;
                        height: 52;
                        anchors.verticalCenter: parent.verticalCenter;
                        anchors.left: parent.left
                        anchors.leftMargin:10;
                        running: parent.visible;
                       }
          Text
              {
               anchors.verticalCenter: parent.verticalCenter;
               anchors.left: indicator.right;
               anchors.leftMargin: 10;
               text: "loading...";
               font.pixelSize: 24;
              }
          function open()
                  {
                   loadingind.state="open";
                  }
          function close()
                  {
                   loadingind.state="close";
                  }
          states:
                [
                 State
                      {
                       name:"close";
                       PropertyChanges
                                      {
                                       target: loadingind;
                                       scale:0.5;
                                       opacity:0;
                                      }
                      },
                 State
                      {
                       name:"open";
                       PropertyChanges
                                      {
                                       target: loadingind;
                                       scale:1;
                                       opacity:0.6;
                                      }
                      }
                ]
          transitions:
                     [
                      Transition
                                {
                                 from: "close";
                                 to:"open";
                                 PropertyAnimation
                                                  {
                                                   target: loadingind;
                                                   properties: "scale,opacity";
                                                   duration: 200;
                                                  }
                                 reversible: true;
                                }
                     ]
         }
