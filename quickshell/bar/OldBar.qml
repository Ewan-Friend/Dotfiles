import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "."
import "../theme"
import "qs.bar.widgets" 

PanelWindow {
    id: root

    property string fontFamily: "JetBrainsMono NF"
    property int fontSize: 15

    // System data
    property int cpuUsage: 0
    property int memUsage: 0
    property var lastCpuTotal: 0
    property var lastCpuIdle: 0

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
    
    // Check memory usage
    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                memUsage = Math.round(100 * used / total)
            }   
        } 
        Component.onCompleted: running = true
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true
            memProc.running = true
        }
    }

    // Primary background panelWindow
    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 32
    color: Catppuccin.base

    // Row Layout of widgets
    RowLayout {
	anchors.fill: parent
	anchors.margins: 8

	// Workspace Switcher
	Repeater {
		model: 9

		Text {
			property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
			property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
			text: index + 1
			color: isActive ? Catppuccin.sapphire: (ws ? Catppuccin.overlay2 : Catppuccin.surface2)
			font { pixelSize : fontSize; bold: true }
		        
			MouseArea {
				anchors.fill: parent
				onClicked: Hyprland.dispatch("hl.dsp.focus({workspace =" + (index + 1) + "})")
			}
		}
	}

    Item { Layout.fillWidth: true }

    // CPU
    Text {
        text: "CPU: " + cpuUsage + "%"
        color: Catppuccin.sky
        font {family: root.fontFamily; pixelSize: root.fontSize; bold: true}
    }
    
    Rectangle {width: 3; height: 18; color: Catppuccin.sapphire}

    // Memory
    Text {
        text: "Mem: " + memUsage + "%"
        color: Catppuccin.sky
        font {family: root.fontFamily; pixelSize: root.fontSize; bold: true}
    }

    Rectangle {width: 3; height: 18; color: Catppuccin.sapphire}

    // Clock 
    Text {
        id: clock 
        color: Catppuccin.sky
        font {family: root.fontFamily; pixelSize: root.fontSize; bold: true}
        text: Qt.formatDateTime(new Date(), "ddd dd - HH:mm:ss")
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd dd - HH:mm:ss")
        }
    }
    }
}

