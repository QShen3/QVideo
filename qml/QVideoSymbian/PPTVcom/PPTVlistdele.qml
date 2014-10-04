// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "../Component"
Component
         {
          id:delegate;
          ListRect
                  {
                   width: 160;
                   height: 243;
                   shadowsize: 4;
                   Image
                        {
                         id:thum;
                         anchors.top:parent.top;
                         anchors.right: parent.right;
                         anchors.left: parent.left;
                         sourceSize.height: 213;
                         sourceSize.width: 160;
                         height: 213;
                         width: 160;
                         source: model.image;
                         smooth: true;
                        }
                   Rectangle
                            {
                             anchors.right: parent.right;
                             anchors.left: parent.left;
                             anchors.bottom: thum.bottom;
                             color: "black";
                             opacity: 0.4;
                             height: 25;
                             Text
                                 {
                                  anchors.left: parent.left;
                                  anchors.leftMargin: 3;
                                  anchors.verticalCenter: parent.verticalCenter;
                                  text: model.state+"集";
                                  font.pixelSize: 15;
                                  color: "white";
                                  smooth: true;
                                 }
                             Text
                                 {
                                  anchors.right: parent.right;
                                  anchors.rightMargin: 3;
                                  anchors.verticalCenter: parent.verticalCenter;
                                  text: model.mark;
                                  font.pixelSize: 16;
                                  color: "red";
                                  font.weight: Font.Black;
                                  smooth: true;
                                 }
                            }
                   Text
                       {
                        anchors.top: thum.bottom;
                        anchors.topMargin: 5;
                        anchors.left: parent.left;
                        anchors.leftMargin: 5;
                        text: model.title;
                        font.pixelSize: 16;
                        smooth: true
                       }
                   MouseArea
                            {
                             anchors.fill: parent;
                             onClicked: {pageStack.push(Qt.resolvedUrl("../PPTVplaypage.qml"),{vid:model.vid,ptplaycomp:model.state})
                                 }
                            }
                  }
         }
