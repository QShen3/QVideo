import QtQuick 2.4
import Material 0.2
import "BaseComponent"

ApplicationWindow{
    id: app;
    property bool loading;

    visible: true;
    theme {
        primaryColor: Palette.colors["blue"]["500"]
        primaryDarkColor: Palette.colors["blue"]["700"]
        accentColor: Palette.colors["pink"]["500"]
        tabHighlightColor: "white"
    }

    initialPage: HomePage{
        id: homepage;
    }

    SignalCenter{
        id:signalcenter;
    }

    LoadingIndicator{
        id:loadingind;
    }
    Snackbar{
        id:snackbar;
    }
}
