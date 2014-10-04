import QtQuick 1.1
import com.nokia.symbian 1.1
Page
    {
     id: root;
     property string title;
     property bool loading;
     Binding
            {
             target: app;
             property: "title";
             value: root.title;
             when: root.status === PageStatus.Active && title != "";
            }
    }
