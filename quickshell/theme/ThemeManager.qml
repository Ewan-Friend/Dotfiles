pragma Singleton
import Quickshell
import QtQuick
import Qt.labs.settings

Singleton {
    id: root

    readonly property string gtkTheme: "catppuccin-mocha-mauve-standard+default"
    readonly property string colorScheme: "prefer-dark"
    readonly property string iconTheme: "Papirus-Dark"

    function applyDefaults(){
        Quickshell.execDetached(["gsettings", "set", "org.gnome.desktop.interface", "gtk-theme", root.gtkTheme])
        Quickshell.execDetached(["gsettings", "set", "org.gnome.desktop.interface", "color-scheme", root.colorScheme])
        Quickshell.execDetached(["gsettings", "set", "org.gnome.desktop.interface", "icon-theme", root.iconTheme])    
    }

    Component.onCompleted: {
        applyDefaults()
    }
}
