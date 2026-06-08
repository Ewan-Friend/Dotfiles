import QtQuick
import Quickshell
import "../../theme"

Pill {
    pillColor: MainColours.date

    SystemClock {
        id: clock 
        precision: SystemClock.Minutes 
    }

    label: "󰃭  " + Qt.formatDateTime(clock.date, "ddd d MMM")
}
