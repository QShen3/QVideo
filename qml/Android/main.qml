import QtQuick 2.5
import QtQuick.Window 2.2
import Material 0.2
import "BaseComponent"

ApplicationWindow{
    id: app;
    property bool loading;

    width: Screen.desktopAvailableWidth;
    height: Screen.desktopAvailableHeight;
    //width: 480;
    //height: 854;
    statusBarHeight: utility.getStatusBarHeight();
    visible: true;
    theme {
        primaryColor: Palette.colors["blue"]["500"]
        primaryDarkColor: Palette.colors["blue"]["700"]
        accentColor: Palette.colors["pink"]["500"]
        tabHighlightColor: "white"
    }

    HomePage{
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

    Component.onCompleted: {
        pageStack.push(homepage);
        console.log(Screen.width + " " + Screen.height);
        console.log(Screen.desktopAvailableWidth + " " + Screen.desktopAvailableHeight)
        console.log(Screen.pixelDensity);
        //console.log(Device.type);
    }
}
