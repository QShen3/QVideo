import QtQuick 2.4
import Material 0.2
Item{
    width: Units.dp(100);
    height: Units.dp(200);

    Card{
        anchors.fill: parent;
        radius: Units.dp(2);

        Image{
            id: thumb;
            width: parent.width;
            height: parent.height - Units.dp(50)
            source: model.show_vthumburl_hd;
            smooth: true;
        }

        Column{
            spacing: Units.dp(4);
            anchors{
                top: thumb.bottom;
                left: parent.left;
                margins: Units.dp(8);
            }
            Label{
                style: "subheading";
                text: model.showname;
            }
            Label{
                style: "body1";
                color: Theme.accentColor;
                //styleChanged:
                text: model.stripe_bottom;
            }
        }
        Component.onCompleted: {
            //console.log(height + " " + width)
        }

    }
}
