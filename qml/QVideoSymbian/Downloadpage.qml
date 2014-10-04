import QtQuick 1.1
import "Component"
import com.nokia.symbian 1.1
Mypage
      {
       id:downloadpage;
       tools: ToolBarLayout
                           {
                            ToolButton
                                       {
                                        iconSource: "toolbar-back";
                                        onClicked: pageStack.pop();
                                        platformInverted: true;
                                       }
                           }
       Dllistdele
                 {
                  id:dlistdele;
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
                  }
       ListView
               {
                id:listview;
                anchors.top: head.bottom;
                anchors.topMargin: 5;
                anchors.left: parent.left;
                anchors.right: parent.right;
                anchors.bottom: parent.bottom;
                model: downloadmodel;
                delegate:dlistdele;
               }
      }
