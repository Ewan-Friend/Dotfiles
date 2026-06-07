import QtQuick
import Quickshell

Pill {
    SystemClock {id: clock; precision: SystemClock.Minutes}
    label: Qt.formatDateTime(new Date(), "ddd d MMM")
}
