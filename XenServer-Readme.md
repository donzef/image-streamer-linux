# Notes and instructions concerning XenServer

## Introduction

The installation disk size for XenServer 7 and 8 must be between 46 GB (or 47104 MB) and 50 GB (51200 MB). [Citrix](https://docs.citrix.com/en-us/xenserver/7-1/install/partition-layout.html) requires 46 GB to hold all the partitions and 50 GB corresponds to the maximum volume that Image Streamer can handle. Most of this disk will bot be used because Image Streamer uses **thin storage**. Only about .5 GB will be provisioned. Moreover the partition layout strictly consumes 42.5 GB, leaving at least  4.5 GB free space for a small local Storage Repository (SR) that can be created during the initial installation process and that can be used during upgrades. Note that Plan Scripts in this GitHub repository is no able to cope with Storage Repositories spanning several disks.

By default the XenServer installer does not load iSCI drivers required to access the OS-Volume presented by the Image Streamer. Hence manual operations must occur before launching the installer and then at first reboot.

## Pre-requisite

* Add and then extract the XenServer artifact bundle contained in this GitHub repository.

## Initial XenServer installation

* Create a profile using the **HPE - Foundation 1.0 - create empty OS Volume** OS Deployment Plan.

* Mount the XenServer ISO installation media using **iLO Virtual Media** and boot from it.

* Start a **shell** to configure iSCSI and launch the installer with suitable option:

    ```bash
    echo "InitiatorName=<iqn.yyyy-mm.com.hpe:oneview-string" > /etc/iscsi/initiatorname.iscsi

    /opt/xensource/installer/init --use_ibft
    ```

    where `iqn.yyyy-mm.com.hpe:oneview-string` is the iSCSI initiator name found in the in the **first** Network connection of the **Server Profile**. Expand this first connection by clicking on the left small triangle icon to see the details of the connection.

* Answer `Yes` to the `Attach to disks specified in iBFT?` question

* Select the `[LeftHand iSCSIDisk]` on which XenServer will be installed.

* In the `Virtual Machine Storage` screen, you can select the `[LeftHand iSCSIDisk]` on which XenServer will be installed for the creation of a local Storage Repository. However **de-select** all the other disks if any. As said previously Plan Scripts in this GitHub repository cannot handle a Storage Repository spanning the installation disk and others.

* Select the last `eth` NIC to be configured. Typically `eth2` if you have 3 network connections in the profile (2 iSCSI deployment NICs and one Management NIC). Double check with the MAC address in the profile.

* Go through the network configuration process with DHCP, NTP and DNS configurations. During deployment, specific Plan Scripts will fine tune this network configuration

* When the initial installation finishes, reboot the compute node and bring up XenServer so initialization completes.

* Shutdown the host from the XenServer console

## Golden Image creation

* From the profile used for the initial XenServer installation, in the `OS Deployment` section, identify the OS volume that was created to hold this XenServer. This is the OS volume to use to capture the golden image.

* If the Image Streamer GUI is not already active, click on the OS-Volume to start it.

* Select the `Golden images` page and then `Create golden image`

* Fill-up the `Name`, OS volume and optionally supply a description.

* Select the `CaptureBP` Build Plan contained in the XenServer artifact bundle 

* Click on the `Create` icon

* In case of problem, select `Activity` section from the pull down menu next to the Golden Image name and download the capture logs.
 
