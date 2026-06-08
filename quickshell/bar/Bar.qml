import QtQuick
import Quickshell
import "../theme"
import "."
import "widgets"

Item {
    id: root

    Rectangle {    }

    Rectangle {
        id: centerContainer
        anchors.centerIn: parent
        height: parent.height - 15 
        color: MainColours.pillBorder
        radius: 10
        width: centerBar.implicitWidth + 12

        CenterBar {
            id: centerBar 
            anchors.centerIn: parent
        }
    }

    Rectangle {
        id: rightContainer
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height - 15
        color: MainColours.pillBorder
        radius: 8
        width: rightBar.implicitWidth + 12

        RightBar {
            id: rightBar
            anchors.centerIn: parent
        }
    }
}
