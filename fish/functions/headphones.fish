function headphones --wraps='bluetoothctl connect 80:4A:F2:05:6C:60' --description 'Connect to Sonos Ace headphones'
    bluetoothctl power on
    bluetoothctl connect 80:4A:F2:05:6C:60
end
