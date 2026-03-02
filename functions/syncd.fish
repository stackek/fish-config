#! /run/current-system/sw/bin/fish

function syncd;

    if mount | grep -q 'dev/mapper/bp'
        if mount | grep -q "/run/media/$USER/bp"
        else
            echo 'Volume is mounted but not in the supposed dir'
            return 1
        end
    else
        if mount | grep -q "/run/media/$USER/bp"
            echo 'Supposed mount dir is busy'
            return 1
        end
        sudo cryptsetup open /dev/sda1 bp
        sudo mount /dev/mapper/bp /run/media/$USER/bp -m
    end

    sudo rsync -aAXL --delete --delete-excluded \
    --numeric-ids \
    --info=progress2 \
    --progress \
    --filter "merge $HOME/.config/rsync/rsync.filter" \
    / /run/media/$USER/bp/current/

    sudo btrfs subvolume snapshot -r \
    /run/media/$USER/bp/current \
    /run/media/$USER/bp/snapshots/$(date +%F-'T'%H:%M:%S)

    read -P "Close or unmount? (unmount/close/no) " answer

    switch (string lower $answer)
    case c C close Close
        sudo umount /dev/mapper/bp
        sudo cryptsetup close /dev/mapper/bp
    case n N no No
    case u U unmount Unmount
        sudo umount /dev/mapper/bp
    end
end
