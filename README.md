Fixes ATA errors under heavy load that can cause permanent data corruption, memory corruption, and panics.
The first symptom is errors that look like:

```
ata7.00: exception Emask 0x10 SAct 0x40 SErr 0x4050000 action 0xe frozen
ata7.00: irq_stat 0x00000040, connection status changed
ata7: SError: { PHYRdyChg CommWake DevExch }
ata7.00: failed command: READ FPDMA QUEUED
ata7.00: cmd 60/38:30:28:7a:3b/00:00:44:00:00/40 tag 6 ncq dma 28672 in
         res 40/00:01:00:00:00/00:00:00:00:00/00 Emask 0x10 (ATA bus error)
ata7.00: status: { DRDY }
hard resetting link
ata7: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
ata7.00: configured for UDMA/133
ata7: EH complete
```

Assuming you've checked the hardware, a remaining cause could be race condtions while switching the performance mode of the SATA bus.  This script switches it to full performance mode.

Tested on Ubuntu 25.04.
