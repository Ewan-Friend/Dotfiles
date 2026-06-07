pragma Singleton
import Quickshell
import QtQuick 
import "."

Singleton {
    readonly property color background: Colour.bluegrey900 
    readonly property color pillBorder: Colour.grey910

    readonly property color cpu:        Colour.lightblue900
    readonly property color date:       Colour.lightblue700
    readonly property color battery:    Colour.lightblue500  
}
