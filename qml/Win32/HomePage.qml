import QtQuick 2.4
import Material 0.2

TabbedPage{
    id: homepage;
    title: "QVideo";

    actions: [
        Action{
            iconName: "action/settings";
            hoverAnimation: true;
        }
    ]

    YoukuTab{
        id: youkutab;
    }
}

