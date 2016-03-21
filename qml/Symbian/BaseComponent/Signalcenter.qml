import QtQuick 1.1
QtObject{

    function showMessage(msg){
        if (msg||false){
            infobanner.text = msg;
            infobanner.open();
        }
    }
}
