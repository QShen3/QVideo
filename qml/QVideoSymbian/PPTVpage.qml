// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"
import "../js/main.js" as Script
Mypage
      {
       id:youkupage;
       title: "PPTV";
       tools: ToolBarLayout
                           {
                            ToolButton
                                      {
                                       iconSource: "toolbar-back";
                                       onClicked: pageStack.pop();
                                       platformInverted: true;
                                      }

                           }
       ListHeading
                  {
                   id:head;
                   height: 55;
                   platformInverted: true;
                   Rectangle
                            {
                             anchors.fill: parent;
                             gradient: Gradient
                                               {
                                                GradientStop
                                                            {
                                                             position: 1;
                                                             color: "lightgray";
                                                            }
                                                GradientStop
                                                            {
                                                             position: 0;
                                                             color: "white";
                                                            }
                                               }
                             opacity: 0.8;
                            }
                   Image
                        {
                         anchors.left: parent.left;
                         anchors.verticalCenter: parent.verticalCenter;
                         source: "../pic/PPTV_logo.svg";
                         smooth: true;
                         width: 110;
                         height: 55;
                        }
                   z:1;
                  }
       Grid
           {
            anchors.fill: parent;
            anchors.rightMargin: 13;
            anchors.leftMargin: 13;
            anchors.topMargin: head.height+10;
            spacing: 14;
            columns: 2;
            Selectbutton
                        {
                         buttontext: "动漫";
                         MouseArea
                                  {
                                   anchors.fill:parent;
                                    onClicked: pageStack.push(Qt.resolvedUrl("PPTVlistpage.qml"),{type:"3"});
                                  }
                        }
            Selectbutton
                        {
                         buttontext: "电影";
                        }
            Selectbutton
                        {
                         buttontext: "电视剧";
                        }
            Selectbutton
                        {
                         buttontext: "综艺";
                        }
           }
      }
