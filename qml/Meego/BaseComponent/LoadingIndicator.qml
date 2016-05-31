import QtQuick 1.1
import com.nokia.meego 1.1
Button{
    id:loadingind;
    width: 60;
    height: 60;
    state: "close";
    /*platformStyle: ButtonStyle{
        inverted: true;
    }*/

    BusyIndicator{
        id:indicator
        /*platformStyle: BusyIndicatorStyle{
            inverted: true;
        }*/
        anchors.centerIn: parent;
        running: parent.state == "open";
    }
    function open(){
        if(loadingind.state != "open"){
            loadingind.state="open";
        }
    }
    function close(){
        if(loadingind.state != "close"){
            loadingind.state="close";
        }
    }
    states:[
        State{
            name:"close";
            PropertyChanges{
                target: loadingind;
                scale:0.5;
                opacity:0;
            }
        },
        State{
            name:"open";
            PropertyChanges{
                target: loadingind;
                scale:1;
                opacity:0.6;
            }
        }
    ]
    transitions:[
        Transition{
            from: "close";
            to:"open";
            PropertyAnimation{
                target: loadingind;
                properties: "scale,opacity";
                duration: 200;
            }
            reversible: true;
        }
    ]

}
