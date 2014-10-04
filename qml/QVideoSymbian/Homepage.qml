import QtQuick 1.1
import com.nokia.symbian 1.1
import "Component"
Mypage
      {
       id:homepage;
       title: "Home Page";
       tools: ToolBarLayout
                           {
                            ToolButton
                                      {
                                       iconSource: "../pic/close_inverted.svg";
                                       onClicked: Qt.quit();
                                       platformInverted: true;
                                      }
                            ToolButton
                                      {
                                       iconSource: "../pic/pull_down.svg";
                                       onClicked: pageStack.push(Qt.resolvedUrl("Downloadpage.qml"))
                                       platformInverted: true;
                                      }
                            ToolButton
                                      {
                                       iconSource: "toolbar-settings"
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
                  }
       Rectangle
                {
                 id:shadow;
                 anchors.top: head.bottom;
                 anchors.right: head.right;
                 anchors.left: head.left;
                 height: 4;
                 gradient: Gradient
                                   {
                                    GradientStop
                                                {
                                                 position: 0;
                                                 color: "lightgray";
                                                }
                                    GradientStop
                                                {
                                                 position: 1;
                                                 color: "white";
                                                }
                                   }
                }
       Grid
           {
            anchors.fill: parent;
            anchors.rightMargin: 13;
            anchors.leftMargin: 13;
            anchors.topMargin: head.height+10;
            spacing: 14;
            columns: 2;
            Mainbutton
                      {
                       sour: "../../pic/youku_logo.svg";
                       MouseArea
                                {
                                 anchors.fill: parent;
                                 onClicked: pageStack.push(Qt.resolvedUrl("Youkupage.qml"))
                                }
                      }
            Mainbutton
                      {
                       sour: "../../pic/tudou_logo.svg";
                       MouseArea
                                {
                                 anchors.fill: parent;
                                 onClicked: pageStack.push(Qt.resolvedUrl("Tudoupage.qml"))
                                }
                      }
            Mainbutton
                      {
                       sour: "../../pic/PPTV_logo.svg";
                       MouseArea
                                {
                                 anchors.fill: parent;
                                 onClicked: pageStack.push(Qt.resolvedUrl("PPTVpage.qml"));
                                }
                      }
            Mainbutton
                      {
                       sour: "../../pic/QiYi_logo.svg";
                      }
            Mainbutton
                      {
                       sour: "../../pic/letv_logo.svg";
                      }
           }
       Dialog
             {
              id:opendia;
              platformInverted: true;
              content:Text
                          {
                           width:parent.width-30;
                           anchors.horizontalCenter:parent.horizontalCenter;
                           text:"Read Me First:\n本软件为测试版，目前功能不完善。\n关于播放，目前本软件只支持优酷的流畅选项。优酷的清晰选项虽然可以播放，但大约只有6分钟。土豆和PPTV虽然可以打开列表，但无法播放。\n关于下载，目前也只有优酷可以下载，清晰度为优酷播放的流畅选项，下载路径为E盘根目录，无法修改，且文件非中文名。\n关于界面，目前没有进行任何优化，无论是视觉效果还是执行效率，所以会有些许卡顿。\n最后，本软件所播放的所有内容均来自于各大视频网站，对内容不负责任，任何人也不能以任何名义对外发布该软件。\nQShen 2014 9 28";
                           wrapMode:Text.WrapAnywhere;
                          }
              buttons: ButtonRow
                             {
                              anchors.horizontalCenter:parent.horizontalCenter;
                              Button
                                    {
                                     onClicked:opendia.accept();
                                     text: "OK";
                                    }
                             }
             }
       Component.onCompleted:
                            {
                             opendia.open();
                            }
      }
