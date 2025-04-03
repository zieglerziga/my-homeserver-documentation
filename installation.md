#How to setup openmediavault
##
## Backup plugin
https://wiki.omv-extras.org/doku.php?id=docs_in_draft:backup-next
1. install backup plugin
2. create a shared folder as a target and select ddfull
3. copy the ddfull folder to another pc. and use usbimager
https://bztsrc.gitlab.io/usbimager/
4. If the next boot complains about fsck and journal problem do the following
5. Start with recovery mode
   type fdisk -l and search for your device name /dev/XXXX
   type sudo fsck -f /dev/XXXX and select y for all the questions

   
