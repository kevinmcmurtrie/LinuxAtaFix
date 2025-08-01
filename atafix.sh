#!/bin/bash

# This goes in /usr/sbin/atafix.sh
# Disables med_power_with_dipm on ATA devices to fix random errors with frozen commands and DMA corruption
for f in /sys/class/scsi_host/host*/link_power_management_policy
 do grep -q -F 'med_power_with_dipm' "$f" && echo "Setting max_performance in $f" && (echo 'max_performance' > "$f")
done
