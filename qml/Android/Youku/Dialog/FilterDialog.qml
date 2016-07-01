import QtQuick 2.5
import Material 0.2
import "../../../JavaScript/Youku.js" as Youku
import "../Delegate"

Dialog{
    id: filterDialog;
    title: qsTr("Filter");
    hasActions: true
    positiveButtonText: qsTr("OK");
    negativeButtonText: qsTr("Cancle");

    Item{
        //width: 330;
        width: parent.width;
        height: column.height;
        //anchors.horizontalCenter: parent.horizontalCenter;
        Column{
            id: column;
            width: parent.width;
            Repeater{
                model: filtermodel;
                delegate: FilterComponent{}
            }
            Item{
                height: sorttitle.height * 3;
                width: parent.width;
                Text{
                    id: sorttitle;
                    anchors{
                        left: parent.left;
                        leftMargin: Units.dp(8);
                        verticalCenter: parent.verticalCenter;
                    }
                    color: Palette.colors["blue"]["500"];
                    //text: sortmodel.get(0).title;
                }
                Flickable{
                    id: flicker;
                    anchors{
                        left: sorttitle.right;
                        right: parent.right;
                        margins: Units.dp(8);
                        verticalCenter: parent.verticalCenter;
                    }
                    height: parent.height;
                    contentWidth: sortrow.width;
                    clip: true;
                    flickableDirection: Flickable.HorizontalFlick;
                    Row{
                        id: sortrow;
                        anchors.verticalCenter: parent.verticalCenter;
                        //spacing: 10;
                        Repeater{
                            model: sortmodel;
                            Button{
                                text: model.title;
                                onClicked: {
                                    sorttitle.text = model.title;
                                    ob = model.value;
                                }
                                Component.onCompleted: {
                                    if(index === 0){
                                        sorttitle.text = model.title;
                                    }
                                }
                            }
                        }
                    }
                }
                Scrollbar{
                    flickableItem: flicker;
                }
            }
        }
    }

    onAccepted: {
        filterString = "";
        for(var i in filter){
            if(i === 0){
                filterString += (filter[i].cat + ":" + filter[i].value);
            }
            else{
                filterString += ("|" + filter[i].cat + ":" + filter[i].value);
            }
        }
        pg = 1;
        Youku.youku.getSubPage(cid, sub_channel_id, sub_channel_type, filterString, ob, 1, loadsubpage, showSubPageFailureInfo);
        indicator.open();
    }
}
