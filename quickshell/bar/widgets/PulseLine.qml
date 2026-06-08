import QtQuick
import Qt5Compat.GraphicalEffects
import "../../theme"

Item {
    id: root
    implicitWidth: 300
    implicitHeight: 4
    clip: true

    property color baseColour: MainColours.pulseBase 
    property color accentColour: MainColours.pulseAccent

    Rectangle {
        id: baseLine
        anchors.fill: parent
        radius: 2
        

        LinearGradient {
            anchors.fill: parent
            start: Qt.point(0, 0)
            end: Qt.point(root.width, 0)

            gradient: Gradient {
                GradientStop { position: 0.0; color: root.baseColour }
                GradientStop { id: pulseSpot; position: 0.5; color: root.accentColour } 
                GradientStop { position: 1.0; color: root.baseColour }
            }

            SequentialAnimation {
                id: currentPulse
                running: true 
                loops: Animation.Infinite

                NumberAnimation {
                    target: pulseSpot
                    property: "position"
                    from: 0.02; to: 0.98
                    duration: 13500 
                    easing.type: Easing.InOutSine
                }
                NumberAnimation {
                    target: pulseSpot
                    property: "position"
                    from: 0.98; to: 0.02
                    duration: 9000
                    easing.type: Easing.InOutSine
                }
            }
        }
    }
}
