import QtQuick 1.1
import com.nokia.symbian 1.1
import com.nokia.extras 1.1
import "Component"
import "../js/main.js" as Script
PageStackWindow
               {
                id: app;
                property bool loading;
                property alias title:titleText.text;
                platformInverted:true;
                Homepage
                        {
                         id:homepage;
                        }
                showStatusBar: true;
                Row
                   {
                    opacity: app.showStatusBar ? 1 : 0;
                    anchors
                           {
                            left: parent.left;
                            top: parent.top;
                           }
                    BusyIndicator
                                 {
                                  id: busyIndicator;
                                  width: privateStyle.statusBarHeight;
                                  height: privateStyle.statusBarHeight;
                                  running: true;
                                  visible: false;
                                 }
                    Flickable
                             {
                              id: scrollingTitle;
                              clip: true;
                              interactive: false;
                              height: privateStyle.statusBarHeight;
                              width: screen.width - 200;
                              contentWidth: Math.max(titleText.width, width);
                              contentHeight: privateStyle.statusBarHeight;
                              onWidthChanged: resetAnimation();
                              function resetAnimation()
                                      {
                                       scrollingAnimation.complete();
                                       if (titleText.width > scrollingTitle.width)
                                         {
                                          scrolling.to = titleText.width - scrollingTitle.width;
                                          scrollingAnimation.start();
                                         }
                                      }

                              Label
                                   {
                                    id: titleText;
                                    height: parent.height;
                                    verticalAlignment: Text.AlignVCenter;
                                    font.pixelSize: platformStyle.fontSizeSmall;
                                    textFormat: Text.PlainText;
                                    onTextChanged: scrollingTitle.resetAnimation();
                                   }
                              SequentialAnimation
                                                 {
                                                  id: scrollingAnimation;
                                                  PropertyAction
                                                                {
                                                                 target: scrollingTitle;
                                                                 property: "contentX";
                                                                 value: 0;
                                                                }
                                                  PauseAnimation
                                                                {
                                                                 duration: 1000;
                                                                }
                                                  PropertyAnimation
                                                                   {
                                                                    id: scrolling;
                                                                    target: scrollingTitle;
                                                                    property: "contentX";
                                                                    duration: to*30;
                                                                   }
                                                  PauseAnimation
                                                                {
                                                                 duration: 1000;
                                                                }
                                                  PropertyAnimation
                                                                   {
                                                                    target: scrollingTitle;
                                                                    property: "contentX";
                                                                    to: 0;
                                                                   }
                                                 }
                             }
                   }
                InfoBanner
                          {
                           id:infobanner;
                          }
                Corners
                       {
                        id:corners;
                        z:1;
                       }
                Signalcenter
                            {
                             id:signalcenter;                            
                            }
                Loadingind
                          {
                           id:loadingind;
                          }
                Timer
                     {
                      id:processingtimer;
                      interval: 60000;
                      onTriggered: signalcenter.loadFailed("erro");
                     }
                Connections
                           {
                            target: signalcenter;
                            onLoadStarted:
                                         {
                                          app.loading=true;
                                          loadingind.open();
                                          processingtimer.restart();
                                         }
                            onLoadFinished:
                                          {
                                           app.loading=false;
                                           loadingind.close();
                                           processingtimer.stop();
                                          }
                            onLoadFailed:
                                        {
                                         app.loading=false;
                                         loadingind.close();
                                         processingtimer.stop();
                                         showmessage(errorstring);
                                        }
                           }
                ListModel
                         {
                          id:downloadmodel;
                         }
                function showmessage(msg)
                        {
                         if(msg||false)
                           {
                            infobanner.text=msg;
                            infobanner.open();
                           }
                        }
                Component.onCompleted:
                         {
                          Script.setsignalcenter(signalcenter);
                          pageStack.push(homepage);
                         }
               }
