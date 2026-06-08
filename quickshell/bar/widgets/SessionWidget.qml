import "../../theme"
import QtQuick

Pill{
    label: "⏻"

    MouseArea{
        anchors.fill: parent
        onClicked: SessionState.show()
    }
}
