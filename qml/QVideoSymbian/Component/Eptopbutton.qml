// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle
         {         
          Rectangle
                   {
                    id:root;
                    anchors.fill: parent;
                    gradient: Gradient
                                      {
                                       GradientStop
                                                   {
                                                    position: 0.0;
                                                    color: "lightblue" ;
                                                   }
                                       GradientStop
                                                   {
                                                    position: 1.0;
                                                    color: "white";
                                                   }
                                      }
                   }
          states:
                [
                 State
                      {
                       name: "nofocus"
                       PropertyChanges
                                      {
                                       target: root;
                                       opacity:0;
                                      }
                      },
                 State
                      {
                       name:"focus"
                       PropertyChanges
                                      {
                                       target: root;
                                       opacity:1;
                                      }
                      }
                ]
          transitions:
                     [
                      Transition
                                {
                                 from: "nofocus";
                                 to:"focus";
                                 PropertyAnimation
                                                  {
                                                   target: root;
                                                   properties: "opacity";
                                                   duration: 100;
                                                  }
                                 reversible: true;
                                }
                     ]
         }
