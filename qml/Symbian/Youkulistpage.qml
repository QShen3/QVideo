// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"
import "Youkucom"
import "../js/main.js" as Script
import com.nokia.extras 1.1
Mypage
      {
       property string cid;
       property string ob:"1";
       property int pg: 1;
       property string area:"|";
       property string genre:"|";
       property string releaseyear:"|";
       property bool firstStart:true;
       id:youkulistpage;
       title: "优酷";
       onVisibleChanged: if (visible && firstStart)
                                  {
                                   firstStart = false
                                   Script.getyoukulist(cid,ob,pg,area,genre,releaseyear);
                                  }
       tools: ToolBarLayout
                           {
                            ToolButton
                                      {
                                       iconSource: "toolbar-back";
                                       onClicked: pageStack.pop();
                                       platformInverted: true;
                                      }
                            ToolButton
                                      {
                                       iconSource: "toolbar-list"
                                       platformInverted: true;
                                       onClicked:
                                                {
                                                 switch(cid)
                                                       {
                                                        case "100":cartoonwinnowdia.open();return;
                                                        case "97":tvdramawinnowdia.open();return;
                                                        case "85":varietywinnowdia.open();return;
                                                        case "96":moviewinnowdia.open();return;
                                                       }
                                                }
                                      }
                            ToolButton
                                      {
                                       iconSource: "toolbar-settings"
                                       platformInverted: true;
                                      }
                           }
       Cartoonwinnowdia
                       {
                        id:cartoonwinnowdia;
                        onDiaaccepted:
                                     {
                                      genre=gettype();
                                      area=getarea();
                                      releaseyear=getyear();
                                      pg=1;
                                      Script.getyoukulist(cid,ob,pg,area,genre,releaseyear);
                                     }
                       }
       TVdramawinnowdia
                       {
                        id:tvdramawinnowdia;
                        onDiaaccepted:
                                     {
                                      genre=gettype();
                                      area=getarea();
                                      releaseyear=getyear();
                                      pg=1;
                                      Script.getyoukulist(cid,ob,pg,area,genre,releaseyear);
                                     }
                       }
       Varietywinnowdia
                       {
                        id:varietywinnowdia;
                        onDiaaccepted:
                                     {
                                      genre=gettype();
                                      area=getarea();
                                      releaseyear=getyear();
                                      pg=1;
                                      Script.getyoukulist(cid,ob,pg,area,genre,releaseyear);
                                     }
                       }
       Moviewinnowdia
                     {
                      id:moviewinnowdia;
                      onDiaaccepted:
                                   {
                                    genre=gettype();
                                    area=getarea();
                                    releaseyear=getyear();
                                    pg=1;
                                    Script.getyoukulist(cid,ob,pg,area,genre,releaseyear);
                                   }
                     }
       ContextMenu
                  {
                   id: sortmenu;
                   platformInverted: true;
                   MenuLayout
                             {
                              MenuItem
                                      {
                                       text: "最新上线"
                                       onClicked:
                                                {
                                                 ob="1";
                                                 pg=1;
                                                 Script.getyoukulist(cid,ob,pg,area,genre,releaseyear);
                                                }
                                       platformInverted: true;
                                      }
                              MenuItem
                                      {
                                       text: "最热播放"
                                       onClicked:
                                                {
                                                 ob="2";
                                                 pg=1;
                                                 Script.getyoukulist(cid,ob,pg,area,genre,releaseyear);
                                                }
                                       platformInverted: true;
                                      }
                              MenuItem
                                      {
                                       text: "最多评论"
                                       onClicked:
                                                {
                                                 ob="3";
                                                 pg=1;
                                                 Script.getyoukulist(cid,ob,pg,area,genre,releaseyear);
                                                }
                                       platformInverted: true;
                                      }
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
                         source: "../pic/youku_logo.svg";
                         smooth: true;
                         width: 110;
                         height: 55;
                        }
                   ToolButton
                             {
                              anchors.right: parent.right;
                              anchors.verticalCenter: parent.verticalCenter;
                              iconSource: "../pic/Winnow_button.svg";
                              smooth: true;
                              anchors.rightMargin: 10;
                              platformInverted: true;
                              onClicked:
                                       {
                                        sortmenu.open();
                                       }
                             }
                   z:1;
                  }       
       ListModel
                {
                 id:youkulist;
                }
       Rectangle
                {
                 anchors.left: parent.left;
                 anchors.right: parent.right;
                 anchors.top: head.bottom;
                 height: 25;
                 color: "#f1f1f1"
                 z:1;
                 Text
                     {
                      anchors.verticalCenter: parent.verticalCenter;
                      anchors.left: parent.left;
                      anchors.leftMargin: 10;
                      text:
                          {
                           switch(ob)
                                 {
                                  case "1":return "最新上线 "+genre+area+releaseyear;
                                  case "2":return "最热播放 "+genre+area+releaseyear;
                                  case "3":return "最多评论 "+genre+area+releaseyear;
                                 }
                          }
                      font.pixelSize: 14;
                     }
                }
       Flickable
                {
                 id:mainview;
                 flickableDirection: Flickable.VerticalFlick;
                 contentHeight: grid.height+70;
                 anchors
                        {
                         top:head.bottom;
                         topMargin:25;
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
                               delegate: Youkulistdele{}
                               model: youkulist;                            
                              }

                     }
                 ListRect
                         {
                          anchors.right: grid.right;
                          anchors.left: grid.left;
                          anchors.top: grid.bottom;
                          anchors.topMargin: 20;
                          height: 30;
                          Text
                              {
                               anchors.centerIn: parent;
                               text: "下一页";
                              }
                          MouseArea
                                   {
                                    anchors.fill: parent;
                                    onClicked:
                                             {
                                              pg++;
                                              Script.getyoukulist(cid,ob,pg,area,genre,releaseyear);
                                             }
                                   }
                          visible: !app.loading;
                         }
                }
       ScrollBar
                {
                 flickableItem: mainview;
                 anchors.left: mainview.right;
                 anchors.top: mainview.top;
                }
       Component.onCompleted:
                {
                 Script.youkulist=youkulist;
                }
      }

