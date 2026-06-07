import Quickshell
import Quickshell.Io
import QtQuick
import "../../theme/"

Pill{ 
    id: root
    pillColor: MainColours.cpu

    property int cpuUsage: 0
    property int lastCpuTotal: 0
    property int lastCpuIdle: 0

    // Check CPU statistics
    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser{
            onRead: data => {
                if (!data) return
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (lastCpuTotal > 0){
                    cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
                }
                lastCpuTotal = total
                lastCpuIdle = idle
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true
        }
    }

    label: "  " + cpuUsage + "%"
}
