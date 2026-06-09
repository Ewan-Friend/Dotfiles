//@ pragma IconTheme Papirus
import Quickshell
import QtQuick 
import "bar"
import "osd"

ShellRoot{
    // TEMP (to load theme singleton)
    property var themeManager: ThemeManager

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            anchors { top: true; left: true; right: true }
            implicitHeight: 55
            color: "transparent"
            exclusiveZone: implicitHeight - 4
            Bar { anchors.fill: parent }
        }
    }

    Variants {
        model: Quickshell.screens 

        SessionOSD {
            required property var modelData
            screen: modelData
        }
    }

  }

