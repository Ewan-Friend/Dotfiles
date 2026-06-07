import QtQuick
import qs.bar.widgets

Row {
    spacing: 8


    BatteryWidget {anchors.verticalCenter: parent.verticalCenter}
    DateWidget {anchors.verticalCenter: parent.verticalCenter}
}

