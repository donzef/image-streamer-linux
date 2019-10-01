# Notes and instructions concerning CentOS 7

## Introduction

TBD

## Pre-requisite

* TBD

## Initial CentOS 7 installation

* Create a profile using the **HPE - Foundation 1.0 - create empty OS Volume** OS Deployment Plan.

* Mount the CentOS 7 server .iso kit on the iLO Virtual Media

* Boot on the iLO Virtual Media and hit the up arrow as soon as the grub menu appears

* Type `e` to edit the grub menu

* Apend the following text the the kernel line and modify iscsi_firmware?

    ```bash
    linux ....  rd.iscsi.ibft=1 console=ttyS0,115200 
    ```

* Hit `CTRL-X` to exit grub and start the installation process

* In the Target storage menus, if you intend to deploy using the legacy deployment process, make sure you don't select btrfs or xsf for the root file system

* Is it necessary to go through the Network configuration ? may be not!

* ...

* Shutdown the host from the XenServer console

## Golden Image creation

* From the profile used for the initial XenServer installation, in the `OS Deployment` section, identify the OS volume that was created to hold this XenServer. This is the OS volume to use to capture the golden image.

* If the Image Streamer GUI is not already active, click on the OS-Volume to start it.

* Select the `Golden images` page and then `Create golden image`

* Fill-up the `Name`, OS volume and optionally supply a description.

* Select the `CaptureBP` Build Plan contained in the XenServer artifact bundle 

* Click on the `Create` icon

* In case of problem, select `Activity` section from the pull down menu next to the Golden Image name and download the capture logs.
 
