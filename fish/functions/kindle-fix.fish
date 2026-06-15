function kindle-fix --wraps='mount -o remount,rw /dev/sda' --wraps='sudo mount -o remount,rw /dev/sda' --wraps='sudo mount -o remount,rw /dev/sdb' --description 'alias kindle-fix=sudo mount -o remount,rw /dev/sdb'
    sudo mount -o remount,rw /dev/sdb $argv
end
