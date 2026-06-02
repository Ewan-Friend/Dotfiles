import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "bar"
import "./theme"

ShellRoot{
    // TEMP (to load theme singleton)
    property var themeManager: ThemeManager

    id: root 
    Bar {id: bar}
}

