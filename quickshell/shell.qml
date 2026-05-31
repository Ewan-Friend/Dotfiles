import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Pill {
    id: root
    property color colBg: "#070f2b"
    property color colFg: "#ffffff"
    property color colAccent: "#1b1a55"
    property color colMuted: "#535c91"
    property color colCyan: "#19b4cf"
    property color colViolet: "#8467c3"
    property color colYellow: "#e0af68"
    property string fontFamily: "JetBrainsMono NF"
    property int fontSize: 15


    anchors.top: true
    anchors.left: true
    anchors.right: true
    implicitHeight: 32
    color: colBg

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
			color: isActive ? colCyan: (ws ? colViolet : colMuted)
			font { pixelSize : fontSize; bold: true }
		        
			MouseArea {
				anchors.fill: parent
				onClicked: Hyprland.dispatch("hl.dsp.focus({workspace =" + (index + 1) + "})")
			}
		}
	}

	Item { Layout.fillWidth: true }
    }
}
