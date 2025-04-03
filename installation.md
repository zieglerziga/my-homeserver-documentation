#How to setup openmediavault
## Installation
### USB drive installation
For creating installation media i prefer [ventoy](https://www.ventoy.net/en/index.htmlhttps://www.ventoy.net/en/index.html)  
[official OMV installation guide](https://docs.openmediavault.org/en/stable/installation/)  
I use an old hp elitebook 8560p laptop. It has one 2.5 sata bay and an ODD. with an adapter the ODD is swapped for another 2.5 drive.
It has fortunately usb 3.0 ports. I am using a Voyager 3 GT 64gb pendrive as a system disk.
Make sure you select legacy boot during installation. If you install omv when UEFI was enabled you wont be able to boot from a usb drive later.

### Flash memory plugin
After the usual installation the openmediavault-flashmemory plugin is needed.
How to install the plugin: https://wiki.omv-extras.org/doku.php?id=omv6:omv6_plugins:flashmemory
### Disable the lid based sleep trigger

When the laptop lid is closed the default action is to put it to sleep mode. For a NAS use this is not acceptable.
How to disable it:
1. edit the /etc/systemd/logind.conf file with your favourite editor as a root
   Uncomment the line about HandleLidSwitch=suspend and change suspend to ignore.
3. restart systemd: systemctl restart systemd-logind or you can restart the whole system as well.
 
## Backup plugin
Backup plugin will create a backup from the system disk
https://wiki.omv-extras.org/doku.php?id=docs_in_draft:backup-next
1. install backup plugin
2. create a shared folder as a target and select ddfull
3. copy the ddfull folder to another pc. and use usbimager
https://bztsrc.gitlab.io/usbimager/
4. If the next boot complains about fsck and journal problem do the following
5. Start with recovery mode
   type fdisk -l and search for your device name /dev/XXXX
   type sudo fsck -f /dev/XXXX and select y for all the questions

   
