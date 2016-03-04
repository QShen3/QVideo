// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"
import "PPTVcom"
import "../js/main.js" as Script
Mypage
      {
       id:pptvplaypage;
       property bool firstStart:true;
       property string vid;
       property string ptplaycomp;
       property string ptplayurl;
       onVisibleChanged: if (visible && firstStart)
                                  {
                                   firstStart = false;
                                   //Script.getptxml(vid);
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
       PPTVinfomodel
                    {
                     id:infomodel;
                     onStatusChanged:
                                    {
                                    if(infomodel.status==XmlListModel.Loading)
                                      {
                                       signalcenter.loadStarted();
                                      }
                                     if(infomodel.status==XmlListModel.Ready)
                                       {
                                        signalcenter.loadFinished();
                                        thum.source=infomodel.get(0).imgurl;
                                        titletext.text= "片名："+infomodel.get(0).title;
                                        typetext.text="类型："+infomodel.get(0).catalog;
                                        directtext.text="导演/原作："+infomodel.get(0).director;
                                        actortext.text="演员："+infomodel.get(0).act;
                                        detailtext.text="简介："+infomodel.get(0).content;
                                       }
                                     if(infomodel.status==XmlListModel.Error)
                                       {
                                        signalcenter.loadFailed(errorString());
                                       }
                                    }
                    }
       ListModel
                {
                 id:ptep;
                }
       ListHeading
                  {
                   id:head;
                   height: 45;
                   platformInverted: true;
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
                          shadowsize: 6;
                          Image
                               {
                                id:thum;
                                anchors.top: parent.top;
                                anchors.topMargin: 5;
                                //anchors.right: parent.right;
                                //anchors.rightMargin: 5;
                                anchors.left: parent.left;
                                anchors.leftMargin: 5;
                                height: 306;
                                width: 230;
                                smooth: true;
                                //source: infomodel.get(0).imgurl;
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
                                      id:titletext
                                      //text: "片名："+infomodel.get(0).title;
                                      font.pixelSize: 15;
                                      width: thum.width-10;
                                      wrapMode: Text.WrapAnywhere;
                                     }
                                 Text
                                     {
                                      text:"状态："+ptplaycomp+"集";
                                      font.pixelSize: 15;
                                      width: thum.width-10;
                                      wrapMode: Text.WrapAnywhere;
                                     }                                                                    
                                 Text
                                     {
                                      id:typetext;
                                      //text: "类型："+infomodel.get(0).catalog;
                                      font.pixelSize:15;
                                     }
                                 Text
                                     {
                                      id:directtext;
                                      //text: "导演/原作："+infomodel.get(0).director;
                                      font.pixelSize: 15;
                                     }
                                 Text
                                     {
                                      id:actortext;
                                      //text: "演员："+infomodel.get(0).act;
                                      font.pixelSize: 15;
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
                          shadowsize: 6;
                          height: detailtext.height;
                          Text
                              {
                               id:detailtext;
                               anchors.left: parent.left;
                               anchors.right: parent.right;
                               anchors.margins: 10;
                               wrapMode: Text.WrapAnywhere;
                               //text: "简介："+infomodel.get(0).content;
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
                          shadowsize: 6;
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
                                        Epbutton
                                                {
                                                 text: index+1;
                                                 onClicked:
                                                          {
                                                           switch(eptopbuttons.selectitem)
                                                                 {

                                                                 }
                                                          }
                                                 isnew: model.is_new;
                                                }
                                        model: ptep;
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
                                     }
                   /*onYkurlloadfinish:
                                    {
                                     ykplayurl=Script.ykplayurl;
                                     if(ykplayurl!="no")
                                       {
                                        utility.launchPlayer(ykplayurl);
                                       }
                                    }*/
                  }
       onVidChanged:
                            {
                             infomodel.source="http://epg.api.pptv.com/detail.api?auth=d410fafad87e7bbf6c6dd62434345818&vid="+vid;
                            }
      }
