import QtQuick
import Quickshell

Pill {
    SystemClock {id: clock; precision: SystemClock.Minutes}
    label: clock.time ? Qt.formatDateTime(clock.time, "ddd d MMM") : "..."
}
