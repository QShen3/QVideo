// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"
import "../js/main.js" as Script
Mypage
      {
       id:youkuplaypage;
       property bool firstStart:true;
       property string id;
       property string thumurl;
       property string ykplaydet;
       property string ykplaycomp;
       property string ykplaystat;
       property string ykplayurl;
       property string ykplaydata;
       property int ykplaydatanum;
       onVisibleChanged: if (visible && firstStart)
                                  {
                                   firstStart = false
                                   Script.getyoukuvideoinfo(id);
                                   Script.getykep(id,"1","50",0)
                                  }
       tools: ToolBarLayout
                           {
                            ToolButton
                                      {
                                       iconSource: "toolbar-back";
                                       onClicked: pageStack.pop();
                                       platformInverted: true;
                                      }
                           }
       ListModel
                {
                 id:ykplaydir;
                }
       ListModel
                {
                 id:ykplayactor;
                }
       ListModel
                {
                 id:ykplaygen;
                }
       ListModel
                {
                 id:ykep;
                }
       ListHeading
                  {
                   id:head;
                   height: 45;
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
                   ListItemText
                               {
                                color: "#000000"
                                anchors.fill: parent.paddingItem;
                                role: "Title"
                                text: "详细信息";
                                font.pixelSize: 24
                                styleColor: "#ffffff"
                                verticalAlignment: Text.AlignVCenter
                               }
                   z:1;
                  }
       Flickable
                {
                 anchors.top: head.bottom;
                 anchors.topMargin: 10;
                 anchors.right: parent.right;
                 anchors.left: parent.left;
                 anchors.rightMargin: 10;
                 anchors.leftMargin: 10;
                 anchors.bottom: parent.bottom;
                 flickableDirection: Flickable.VerticalFlick;
                 contentHeight: thumandinfo.height+detail.height+episode.height+30;
                 ListRect
                         {
                          id:thumandinfo
                          height: thum.height+info.height+20;
                          anchors.left: parent.left;
                          anchors.right: parent.right;
                          anchors.top: parent.top;
                          shadowsize: 5;
                          Image
                               {
                                id:thum;
                                anchors.top: parent.top;
                                anchors.topMargin: 5;
                                anchors.right: parent.right;
                                anchors.rightMargin: 5;
                                anchors.left: parent.left;
                                anchors.leftMargin: 5;
                                height: 185.625;
                                sourceSize.height: height;
                                sourceSize.width: width;
                                smooth: true;
                                source: thumurl;
                               }
                          Column
                                {
                                 id:info;
                                 anchors.top: thum.bottom;
                                 anchors.topMargin: 10;
                                 anchors.left: thum.left;
                                 anchors.leftMargin: 5;
                                 spacing: 5;
                                 Text
                                     {
                                      text: "片名："+title;
                                      font.pixelSize: 15;
                                      width: thum.width-10;
                                      wrapMode: Text.WrapAnywhere;
                                     }
                                 Text
                                     {
                                      text:"状态："+ykplaycomp+" "+ykplaystat;
                                      font.pixelSize: 15;
                                      width: thum.width-10;
                                      wrapMode: Text.WrapAnywhere;
                                     }
                                 Row
                                    {
                                     Text
                                         {
                                          text: "类型：";
                                          font.pixelSize:15;
                                         }
                                     Repeater
                                             {
                                              model: ykplaygen;
                                              Text
                                                  {
                                                   text: model.genre+" ";
                                                   font.pixelSize: 15;
                                                  }
                                             }
                                    }
                                 Row
                                    {
                                     Text
                                         {
                                          text: "导演/原作：";
                                          font.pixelSize: 15;
                                         }
                                     Repeater
                                             {
                                              model: ykplaydir;
                                              Text
                                                  {
                                                   text: model.dire+" ";
                                                   font.pixelSize: 15;
                                                  }
                                              }
                                    }
                                 Row
                                    {
                                     Text
                                         {
                                          text: "演员：";
                                          font.pixelSize: 15;
                                         }
                                     Repeater
                                             {
                                              model: ykplayactor;
                                              Text
                                                  {
                                                   text: model.actor+" ";
                                                   font.pixelSize: 15;
                                                  }
                                             }
                                    }
                                }
                         }
                 ListRect
                         {
                          id:detail;
                          anchors.left: parent.left;
                          anchors.right: parent.right;
                          anchors.top: thumandinfo.bottom;
                          anchors.topMargin: 10;
                          shadowsize: 5;
                          height: detailtext.height+20;
                          Text
                              {
                               id:detailtext;
                               anchors.left: parent.left;
                               anchors.right: parent.right;
                               anchors.top: parent.top;
                               anchors.margins: 10;
                               wrapMode: Text.WrapAnywhere;
                               text: "简介："+ykplaydet;
                               font.pixelSize: 15;
                              }
                         }
                 ListRect
                         {
                          id: episode;
                          anchors.left: parent.left;
                          anchors.right: parent.right;
                          anchors.top: detail.bottom;
                          anchors.topMargin: 10;
                          height: eptopbuttons.height+epview.height+20;
                          shadowsize: 5;
                          Eptopbuttons
                                      {
                                       id:eptopbuttons;
                                       anchors.top: parent.top;
                                      }
                          Grid
                              {
                               id:epview;
                               anchors.left: parent.left;
                               anchors.right: parent.right;
                               anchors.top: eptopbuttons.bottom;
                               anchors.margins: 10;
                               spacing: 10;
                               columns: 8;
                               Repeater
                                       {
                                        id:epbuttons;
                                        property string selectitem;
                                        Epbutton
                                                {
                                                 text: index+1;
                                                 onClicked:
                                                          {
                                                           epbuttons.selectitem=text;
                                                           switch(eptopbuttons.selectitem)
                                                                 {
                                                                  case 1:
                                                                      Script.getykplayurl(model.videoid,2);
                                                                      break;
                                                                  case 2:
                                                                      Script.getykplayurl(model.videoid,1);
                                                                      break;
                                                                  case 3:
                                                                      Script.getykplayurl(model.videoid,1);
                                                                      break;
                                                                 }                                                         
                                                          }
                                                 isnew: model.is_new;
                                                }
                                        model: ykep;
                                       }
                              }
                         }
                }
       Connections
                  {
                   target: signalcenter;
                   onYkinfoloadfinish:
                                     {
                                      ykplaydet=Script.ykplaydet;
                                      ykplaycomp=Script.ykplaycomp;
                                      ykplaystat=Script.ykplaystat;
                                     }
                   onYkurlloadfinish:
                                    {
                                     ykplayurl=Script.ykplayurl;
                                     if(eptopbuttons.selectitem==3)
                                       {
                                         downloadmodel.append({"name":title+epbuttons.selectitem,"url":ykplayurl,"file":"E:/"+id+epbuttons.selectitem+".mp4"});
                                         qcurl.appenddl(ykplayurl,"E://"+id+epbuttons.selectitem+".mp4");
                                         //console.log(ykplayurl);
                                        showmessage("已加入下载列表");
                                       }
                                     else utility.launchPlayer(ykplayurl);
                                    }
                  }
       Component.onCompleted:
                {
                 Script.ykplaydir=ykplaydir;
                 Script.ykplayactor=ykplayactor;
                 Script.ykplaygen=ykplaygen;
                 Script.ykep=ykep;
                }
      }
