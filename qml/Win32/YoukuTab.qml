import QtQuick 2.4
import QtQuick.Layouts 1.2
import Material 0.2
import Material.ListItems 0.1 as ListItem
import "../JavaScript/Youku.js" as Youku
import "Delegate"

Tab{
    id: youkutab;

    property string cid: "100";
    property string ob: "1";
    property int pg: 1;
    property string area: "|";
    property string genre: "|";
    property string releaseyear: "|";
    title: "Youku";

    sourceComponent: delegate;
    Component{
        id: delegate;
        Item{
            Sidebar{
                id: sidebar;
                expanded: true;
                Column{
                    width: parent.width;
                    ListItem.Standard {
                        text: qsTr("Cartoon");
                    }
                }
            }

            Flickable{
                id: flickable;
                anchors{
                    left: sidebar.right;
                    right: parent.right;
                    top: parent.top;
                    bottom: parent.bottom;
                }
                clip: true;

                contentHeight: Math.max(loader.implicitHeight + 40, height)
                Loader{
                    id: loader;
                    anchors.fill: parent;
                    sourceComponent: Item{
                        implicitHeight: list.height;
                        GridLayout{
                            id: list;
                            anchors.centerIn: parent
                            width: parent.width
                            columns: parseInt(parent.width / Units.dp(100)) || 1
                            rowSpacing: Units.dp(20)
                            Repeater{
                                model: youkulistmodel;
                                delegate: YoukuListItem{}
                            }
                        }
                    }
                }
            }
            Scrollbar {
                flickableItem: flickable
            }
            ListModel{
                id: youkulistmodel;
            }
            Component.onCompleted: {
                Youku.youku.getList(cid, ob, pg.toString(), "area:" + area + "genre:" + genre + "releaseyear:" + releaseyear, loadList, loadFail);
            }

            function loadList(oritxt){
                var obj = JSON.parse(oritxt);
                if(obj.status !== "success"){
                    loadFail(obj.status);
                    return;
                }

                if(obj.pg==="1"){
                    youkulistmodel.clear();
                }
                for(var i in obj.results){
                    youkulistmodel.append(obj.results[i]);
                }
            }
            function loadFail(erro){
                signalcenter.showMessage(erro);
            }
        }
    }
}
