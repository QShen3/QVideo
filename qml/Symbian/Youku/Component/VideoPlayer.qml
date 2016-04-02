// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import QtMultimediaKit 1.1
import com.nokia.symbian 1.1
Item{
    id: root;
    width: 360;
    height: 202.5;
    property variant urls;
    property int index: 0;
    property int total;
    Video{
        id: video;
        anchors.fill: parent;
        autoLoad: false;
        //seekable: true;
        source: urls[index];
        volume: 0;
        onStatusChanged: {
            console.log("status: " + status)
            if(status == Video.EndOfMedia){
                console.log(index + " here " + total);
                index++;
                if(index != total){
                    source = urls[index];
                    play();
                }
            }
        }
        onError: {
            index = total;
            video.stop();
            signalcenter.showMessage(errorString);
        }

        BusyIndicator{
            id: busyindicator;
            anchors.centerIn: parent;
            visible: false;
        }
    }

    function start(index, position){
        root.index = index;
        video.source = urls[index];
        console.log(video.source);
        video.play();
        video.position = position;

        console.log("duration: " + video.duration)
        console.log("seekable: " + video.seekable)
    }
    function pause(){
        video.pause();
    }
    function stop(){
        index = total;
        video.stop();
    }
}
