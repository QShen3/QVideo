// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

PathView{
    id:cover;
    //height: 170;
    //width: 360;
    //clip: true;
    preferredHighlightBegin: 0.5;
    preferredHighlightEnd: 0.5;
    highlightMoveDuration: 200;
    path: Path{
        startX: -cover.width*cover.count/2+cover.width/2;
        startY: cover.height/2;
        PathLine{
            x:cover.width*cover.count/2+cover.width/2;
            y:cover.height/2;
        }
    }
    Timer{
        running: cover.visible && cover.count>0 && !cover.moving;
        interval: 3000;
        repeat: true;
        onTriggered: cover.incrementCurrentIndex();
    }
}
