import QtQuick 
import "../../theme/"

Pill {
    pillColor: MainColours.clock

    //TODO: different clock symbol depending on the hour 
    
    labelColor: "#ffffff" 
    label: {"󱑎 "+ Qt.formatTime(new Date(), "HH:mm")}
}
