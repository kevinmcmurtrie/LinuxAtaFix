#!/bin/bash
for f in /sys/class/scsi_host/host*/link_power_management_policy
 do grep -q -F 'med_power_with_dipm' "$f" && echo "Setting max_performance in $f" && (echo 'max_performance' > "$f")
done
