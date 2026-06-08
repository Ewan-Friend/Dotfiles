import QtQuick
import Quickshell
import "../../theme"

Pill {
    pillColor: MainColours.date

    label: "󰃭  " + Qt.formatDateTime(new Date(), "ddd d MMM")
}
