# Notes concerning XenServer

## 

## Profile creation

* Create a profile using the **HPE - Foundation 1.0 - create empty OS Volume** OS Deployment Plan.

* For 7.1, 7.3 7.6? releases, the minimum disk requirement for XenServer is 46 GB or 47104 MB. Most of this disk will bot be used because Image Streamer uses **thin storage**. Only about .5GB will be provisioned.

* Mount the XenServer ISO installation media using **iLO Virtual Media** and boot from it.

* Start a **shell**:

    ```bash
    echo"InitiatorName=<iqn.yyyy-mm.com.hpe:oneview-string" > /etc/iscsi/initiatorname.iscsi

    /opt/xensource/installer/init --use_ibft
    ```
    where `iqn.yyyy-mm.com.hpe:oneview-string` is the iSCSI initiator name found in the **Server Profile**.

* Answer `Yes` to the "Attach to disks specified in iBFT?" question

* Accept EULA

* Keep ticked the 46 GB [LeftHand iSCSIDisk]. The installation process will create a small local repository that may be needed during XenServer upgrades.

* Select the last eth NIC to be configured. Typically eth2 if you have 3 network connections in the profile. Double check with the MAC address in the profile.

* DHCP for address, NTP and DNS configuration

* After the install finishes reboot the compute node and bring up XenServer so initialization will complete

* Shutdown the host from the XenServer console

* From the profile, in the **OS Deployment** section, identify the volume that was created. This is the OS volume to use to capture the golden image.

* If the Image Streamer GUI is not already active, click on the OS-Volume to start it. 

* Select the Golden image page and click on **Create golden image**

* TBD


 
