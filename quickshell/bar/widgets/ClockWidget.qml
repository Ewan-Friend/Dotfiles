import QtQuick 
import Quickshell
import "../../theme/"

Pill {
    pillColor: MainColours.clock

    SystemClock {
        id: clock 
        precision: SystemClock.Minutes 
    }

    property int hour: clock.hours 

    labelColor: "#ffffff" 
    label: {
        var sym = ""
        if (hour == 0 || hour == 12) sym = "󱑖"
        if (hour == 1 || hour == 13) sym = "󱑋"
        if (hour == 2 || hour == 14) sym = "󱑌"
        if (hour == 3 || hour == 15) sym = "󱑍"
        if (hour == 4 || hour == 16) sym = "󱑎"
        if (hour == 5 || hour == 17) sym = "󱑏"
        if (hour == 6 || hour == 18) sym = "󱑐"
        if (hour == 7 || hour == 19) sym = "󱑑"
        if (hour == 8 || hour == 20) sym = "󱑒"
        if (hour == 9 || hour == 21) sym = "󱑓"
        if (hour == 10 || hour == 22) sym = "󱑔"
        if (hour == 11 || hour == 23) sym = "󱑕"


        sym + " " + Qt.formatTime(clock.date, "HH:mm")
    }
}
