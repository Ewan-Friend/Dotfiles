import QtQuick
import Quickshell
import "../theme"

PanelWindow {
    id: root
    required property var screen

    anchors { top: true; bottom: true; left: true; right: true }
    color: "transparent"
    exclusiveZone: -1
    visible: SessionState.visible

    MouseArea {
        anchors.fill: parent
        onClicked: SessionState.hide()
    }

    Rectangle {
    anchors.fill: parent
    color: "#aa000000"

    MouseArea {
        anchors.fill: parent
        onClicked: SessionState.hide()
    }

    Column {
        anchors.centerIn: parent
        spacing: 32

        MouseArea {
            width: childrenRect.width
            height: childrenRect.height
            onClicked: {}

            Column {
                spacing: 32

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Why isnt this a dropdown, " + Quickshell.env("USER") + "?" 
                    font.pixelSize: 32
                    font.bold: true
                    font.family: "JetBrainsMono Nerd Font"
                    color: "#ffffff" 
                }
            }
        }
    }
}
}
