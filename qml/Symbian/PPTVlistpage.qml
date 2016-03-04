// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"
import "PPTVcom"
Mypage
      {
       property string order:"n";
       property string type:"3";
       property int s: 1;
       property bool firstStart:true;
       id:pptvlistpage;
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
       PPTVmodel
                {
                 id:pptvlist;
                 onStatusChanged:
                                {
                                if(pptvlist.status==XmlListModel.Loading)
                                  {
                                   signalcenter.loadStarted();
                                  }
                                 if(pptvlist.status==XmlListModel.Ready)
                                   {
                                    signalcenter.loadFinished();
                                   }
                                 if(pptvlist.status==XmlListModel.Error)
                                   {
                                    signalcenter.loadFailed(errorString ());
                                   }
                                }
                }
       Flickable
                {
                 id:mainview;
                 flickableDirection: Flickable.VerticalFlick;
                 contentHeight: grid.height;
                 anchors
                        {
                         top:head.bottom;
                         topMargin:10
                         left:parent.left;
                         leftMargin:10;
                         right:parent.right;
                         rightMargin:10;
                         bottom:parent.bottom;
                        }
                 Grid
                     {
                      id:grid;
                      anchors.right: parent.right;
                      anchors.left: parent.left;
                      spacing:20;
                      columns: 2;
                      Repeater
                              {
                               id:list;
                               delegate: PPTVlistdele{}
                               model: pptvlist;
                              }

                     }
                 /*Button
                       {
                        anchors.top: grid.bottom;
                        anchors.horizontalCenter: parent.horizontalCenter;

                       }*/
                }
       ScrollBar
                {
                 flickableItem: mainview;
                 anchors.left: mainview.right;
                 anchors.top: mainview.top;
                }
      }
