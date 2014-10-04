// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Image
     {
      property string sour;
      source: "../../pic/main-button.svg";
      Image
           {
            width: 150;
            height: 75;
            anchors.centerIn: parent;
            source: parent.sour;
            smooth: true;
           }
     }
