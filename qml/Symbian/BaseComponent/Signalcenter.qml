import QtQuick 1.1
QtObject{
    signal loadStarted;
    signal loadFinished;
    signal loadFailed(string errorstring);

    function showMessage(msg){
        if (msg||false){
            infobanner.text = msg;
            infobanner.open();
        }
    }
}
