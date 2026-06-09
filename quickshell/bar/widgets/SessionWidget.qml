import "../../theme"
import QtQuick

Pill{
    label: "⏻"

    MouseArea{
        anchors.fill: parent
        onClicked: SessionState.show()
        // TODO: show displays dropdown underneath power button
    }
}
