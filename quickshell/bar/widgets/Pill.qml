import QtQuick
import "../../theme/"

Rectangle {
    id: root
    property color pillColor: MainColours.date
    property color labelColor: MainColours.black
    property string label: ""

    implicitHeight: 28
    implicitWidth: pillLabel.implicitWidth + 16
    radius: 3
    color: pillColor

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: root.opacity = 0.75
        onExited: root.opacity = 1
    }

    Text {
        id: pillLabel
        anchors.centerIn: parent 
        text: root.label 
        font.pixelSize: 16
        font.bold: true 
        font.family: "JetBrainsMono NF"
        color: labelColor
    }

    Behavior on opacity { NumberAnimation {duration: 150}}
}
