import QtQuick 1.1
QtObject{

    function showMessage(msg){
        if (msg||false){
            console.log(msg)
            infobanner.text = msg;
            infobanner.show()
        }
    }
}
