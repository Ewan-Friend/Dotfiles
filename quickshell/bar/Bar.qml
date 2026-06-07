import QtQuick
import Quickshell
import "../theme"
import "."
import "widgets"

Item {
    id: root

    Rectangle {    }

    Rectangle {    }

    Rectangle {
        id: rightContainer
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height - 15
        color: Catppuccin.crust 
        radius: 8
        width: rightBar.implicitWidth + 12

        RightBar {
            id: rightBar
            anchors.centerIn: parent
        }
    }
}
