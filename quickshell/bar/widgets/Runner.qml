import Quickshell
import QtQuick
import "../../theme"

Rectangle {
        id: launcher
        width: 48; height: 28; radius: 5
        color: PanelColors.launcher
        anchors.verticalCenter: parent.verticalCenter

        Text {
            anchors.centerIn: parent
            text: ""
            font.pixelSize: 16
            font.bold: true
            font.family: "JetBrainsMono Nerd Font"
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: launcher.opacity = 0.6
            onExited:  launcher.opacity = 1.0
            onClicked: Quickshell.execDetached(["rofi", "-show", "drun"])
        }
        Behavior on opacity { NumberAnimation { duration: 150 } }
    }
