// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.symbian 1.1
Component
         {
          id:delegate;
          Item
              {
               id:wrapper;
               property bool currenturl;
               property bool fileexist;
               width: 360;
               height: 70;
               Text
                   {
                    id:name;
                    anchors.top: parent.top;
                    anchors.topMargin: 15;
                    anchors.left: parent.left;
                    anchors.leftMargin: 20;
                    text: model.name;
                    font.pixelSize: 18;
                   }
               ProgressBar
                          {
                           id:progress;
                           anchors.top: name.bottom;
                           anchors.topMargin: 10;
                           width: 300;
                           anchors.left: name.left;
                          }
               Rectangle
                        {
                         anchors.left: parent.left;
                         anchors.right: parent.right;
                         anchors.bottom: parent.bottom;
                         color: "lightgray";
                         height: 2;
                        }
               MouseArea
                        {
                         anchors.fill: parent;
                         onClicked:
                                  {
                                   if(progress.value===1)
                                     {
                                      Qt.openUrlExternally("file:///"+model.file);
                                     }
                                  }
                        }          
               Timer
                    {
                     interval: 500;
                     running: true;
                     repeat: true;
                     triggeredOnStart: true;
                     onTriggered:
                                {
                                 currenturl=qcurl.iscurrenturl(model.url);
                                 fileexist=qcurl.isfileexist(model.file);
                                 if(currenturl===true)
                                   {
                                    progress.value=qcurl.getprogress();
                                   }
                                 if((currenturl===false)&&(fileexist===false))
                                   {
                                    progress.value=0;
                                   }
                                 if((currenturl===false)&&(fileexist===true))
                                   {
                                    progress.value=1;
                                    running=false;
                                   }
                                }
                    }
              }
         }
