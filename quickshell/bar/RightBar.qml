import QtQuick
import "widgets"

Row {
    spacing: 8
    
    BluetoothWidget {anchors.verticalCenter: parent.verticalCenter}
    BatteryWidget {anchors.verticalCenter: parent.verticalCenter}
    DateWidget {anchors.verticalCenter: parent.verticalCenter}
    CpuWidget {anchors.verticalCenter: parent.verticalCenter}
}

