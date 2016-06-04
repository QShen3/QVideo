// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import com.nokia.meego 1.1
QueryDialog{
    id: root;
    property string changeLog;
    property string url;
    titleText: qsTr("New Version");
    acceptButtonText: qsTr("Yes");
    rejectButtonText: qsTr("Cancle");
    message: qsTr("Find new version, download now?") + "\n\n" + changeLog;

    onAccepted: {
        //Script.getDownloadUrl("567bf5897632d31254955cd8", app.user.auth, "9Store", "http://apps-images.9smart.cn/565060f95f9ad8de5a4e0674/i/567bf5897632d31254955cd8", "symbian");
        Qt.openUrlExternally(url);
    }

    function openDialog(change, u){
        changeLog = change;
        url = u;
        open();
    }
}
