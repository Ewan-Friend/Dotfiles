import Quickshell.Services.SystemTray
import QtQuick

Row {
    spacing: 4

    Repeater {
        model: SystemTray.items
        delegate: Item {
            id: trayDelegate
            required property SystemTrayItem modelData

            width: 32; height: 32

            Image {
                anchors.centerIn: parent
                source: parent.modelData.icon
                width: 28; height: 28
                smooth: true
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton
                onClicked: (mouse) => {
                    if (modelData.contextMenu) {
                        const post = trayDelegate.mapToItem(null, 0, 0)
                        modelData.contextMenu.open(pos.x, pos.y)
                    }
                    else
                        modelData.activate()
                }
            }
        }
    }
}
