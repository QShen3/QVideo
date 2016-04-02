import QtQuick 1.1
import com.nokia.symbian 1.1
import "../../../JavaScript/Youku.js" as Youku
import "../Delegate"
CommonDialog{
    id: root;
    platformInverted: true;
    titleText: qsTr("Filter");
    buttonTexts: ["OK", "Cancle"];
    content: Item{
        width: 330;
        height: column.height;
        anchors.horizontalCenter: parent.horizontalCenter;
        Column{
            id: column;
            width: parent.width;
            Repeater{
                model: filtermodel;
                delegate: FilterComponent{}
            }
            Item{
                height: sorttitle.height + 27;
                width: 330;
                Text{
                    id: sorttitle;
                    anchors{
                        left: parent.left;
                        leftMargin: 10;
                        verticalCenter: parent.verticalCenter;
                    }
                    color: "#1056dd";
                    text: sortmodel.get(0).title;
                }
                Flickable{
                    anchors{
                        left: sorttitle.right;
                        right: parent.right;
                        margins: 10;
                        verticalCenter: parent.verticalCenter;
                    }
                    height: parent.height;
                    contentWidth: sortrow.width;
                    clip: true;
                    flickableDirection: Flickable.HorizontalFlick;
                    Row{
                        id: sortrow;
                        anchors.verticalCenter: parent.verticalCenter;
                        spacing: 10;
                        Repeater{
                            model: sortmodel;
                            Text{
                                text: model.title;
                                MouseArea{
                                    anchors.fill: parent;
                                    onClicked: {
                                        sorttitle.text = model.title;
                                        ob = model.value;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    onButtonClicked: {
        if(index === 0){
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
        }
    }
}
