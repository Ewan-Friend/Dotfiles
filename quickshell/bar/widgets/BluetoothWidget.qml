import QtQuick
import Quickshell.Bluetooth
import "../../theme"

Pill {
    id: root
    pillColor: MainColours.bluetooth

    property var adapter: Bluetooth.defaultAdapter
    property var connectedDevices: Bluetooth.devices

    label: {
        if (!adapter || !adapter.enabled) return "󰂲"
        var connected = connectedDevices.values.filter(d => d.state === BluetoothDeviceState.Connected)
        if (connected.length === 0) return "󰂯"
        
        // Initialise (turn into intitials) whatever is connected
        return "󰂱 " + connected[0].name.split(/\s+/).map(word => word.charAt(0)).join("").substring(0, 8);
    }
}
