# Notes concerning Ubuntu (18.04 and later)

## Profile creation for first time installation

* Create a profile using the **HPE - Foundation 1.0 - create empty OS Volume** OS Deployment Plan.

* As best practice, the minimum is to have two iSCSI connections (primary and secondary) on the Image Streamer network and at least one management network.

## First time installation 

* Mount the [Ubuntu traditional installer](http://cdimage.ubuntu.com/releases/19.04/release/ubuntu-19.04-server-amd64.iso) in the **iLO Virtual Media**. Prefer the traditional server installer to the new Live installer.

* Boot from the **iLO Virtual Media** and step through the install for the first items Keyboard, location, locales, keyboard layout, language...

* In the Network Setup select a non-iSCSI NIC for your management interface. If you defined two iSCSI connections, you should select the third `ens3f?` connection in the list.

* You can postpone the configuration for a later time.

* Set up hostname, users and passwords

* By default the Ubuntu installer is not configured to detect iSCSI disks. Hence it will only propose visible non-iSCSI disks if any. Select **`<Go Back>`** button to configure iSCSI target detection.

* From the Installer menu, select **`Execute a shell`** at the **bottom** of the step list. Read and acknowledge the pop-up message.

* From the BusyBox shell configure the `ens3f0` NIC with the **Initiator IP address** found in the **first** network Connection of the Server Profile. Ping the iSCSI target to validate your network connection. The iSCSI target IP address is also present in the first connection of the server profile:

    ```bash
    ~ # ip addr add 192.168.8.108/24 dev ens3f0
    ~ # ip link set ens3f0 up
    ~ # ping 192.168.8.198
    ~ # exit
    ```

* Detect disks again and select `Configure iSCSI volumes`  or `Login to iSCSI targets` depending you have local disks or not.

* Supply the initiator iqn (i.e. `iqn.2015-02.com.hpe:oneview-vcg3m2x028`), iSCSI Target IP address.

* No username needed: select **`<Continue>`**

* You should now see the iSCSI target with a `lefthand` string in its iqn. Hit `space` to select it.

* Select a `Guided` or `Manual` partitioning menu depending on your needs. The only important thing is that, for some reasons the Image Streamer v4.10 and 4.20 does not recognize the `ext4` file system (not tested with 5.0 yet). In this example we go through the `Guided - use entire disk and setup LVM` menus to explain how to switch from `ext4` to `ext3`. We assume as well that the OS volume has not been partionned previously.

* Select the `LEFTHAND iSCSIDisk`

* Write the changes to disk and configure LVM ? `<Yes>`

* Adjust (or not) the amount of volume group and `<Continue>`

* Write the changes to disk ? **`<No>`**

* Select the line under the `LVM` line and change `ext4` to `ext3 journaling file system`

* Hit the `Done setting up the file system` line

* `Finish partioning and write changes to disk`: `<Yes>`

* Choose your favorite update method

* Select needed software

* Reboot. Make sure that the **iLO Virtual Media** has been disconnected.

* As soon as the green HPE logo appears, hit the `e` key to edit the grub configuration file. Since  the boot process goes very fast, you may want to stop first at the `One Time boot Options (F11)` to avoid missing this step.

* Append the `iscsi_auto` kernel option to the `linux` line so it looks like:

   ```bash
   linux /boot/vmlinuz-5.0.0-13-generic root=/dev/mapper/ubuntufdz--vg-root ro iscsi_auto
    ```

* Hit `Ctrl-x` to exit the editor and boot

* Login and add the `iscsi_auto` option to the `GRUB_CMDLINE_LINUX`  variable of the `grub` configuration file:

    ```bash
    sudo vi /etc/default/grub
    ...
    GRUB_CMDLINE_LINUX="iscsi_auto"
    ...
    :wq!

    sudo update-grub

    sudo reboot # to validate the grub modification
   ```

* The system is now ready for further customization if needed

## Golden Image capture

When the customization process is finished, `shutdown` the server and select the `Golden Images` tab in the Image Streamer.

* Click on the `Create` button and fill up the `Name` and `Description` fields.

* Select the the OS volume mentioned in the details of the first network/iSCSI connection in the server profile, at the end of the `Target name`. In the below example, the OS volume name is `OSVolume-92`

```text
iqn.2003
-10.com.lefthandnetworks:vsagroupefsj2ft1:1036:osvolume-92
```

* Select a Capture Build Plan developped in this project and suitable for Ubuntu.

* Hit the `Create` button

In case of problem, select `Activity` from the pull-down menu of this page and download the logs. Look for errors at the end of this log file.







 
