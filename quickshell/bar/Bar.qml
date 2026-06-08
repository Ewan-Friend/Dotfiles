import QtQuick
import QtQuick.Effects
import Quickshell
import "../theme"
import "."
import "widgets"

Item {
    id: root

    property int lineWidth: 9

    // ----- Left Bar ----- 
    Rectangle {   
        id: leftContainer 
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height - 12
        color: MainColours.pillBorder
        radius: 8
        width: leftBar.implicitWidth + 12

        LeftBar {
            id: leftBar
            anchors.centerIn: parent
        }
    }

    // ----- Center Bar -----
    Rectangle {
        id: centerContainer
        anchors.centerIn: parent
        height: parent.height - 12 
        color: MainColours.pillBorder
        radius: 8
        width: centerBar.implicitWidth + 12

        CenterBar {
            id: centerBar 
            anchors.centerIn: parent
        }
    }

    // ----- Right Bar -----
    Rectangle {
        id: rightContainer
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        height: parent.height - 12
        color: MainColours.pillBorder
        radius: 8
        width: rightBar.implicitWidth + 12

        RightBar {
            id: rightBar
            anchors.centerIn: parent
        }
    }

    // ----- Right Electric Line ----- 
    PulseLine {
        id: rightLine
        height: lineWidth

        anchors.left: centerContainer.right
        anchors.right: rightContainer.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: 0
        anchors.rightMargin: 0
    }

    // ----- Left Electric Line -----
    PulseLine {
        id: leftLine
        height: lineWidth 
        dontInvert: false

        anchors.left: leftContainer.right
        anchors.right: centerContainer.left
        anchors.verticalCenter: parent.verticalCenter

        anchors.leftMargin: 0
        anchors.rightMargin: 0
    }
}
