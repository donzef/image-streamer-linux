# Artifact description and content

## Description

Artifact Name:FDZ-XenServer7-ArtifactBundle-IS420-v0.1

Description:Contains general, capture and deploy Build and Plan Scripts suitable for XenServer 7. Suitable with Image Streamer versions 4.10 and 4.20.

Read Only:false

Time Stamp:2019-09-05T15:43:17.091Z

Artifact Type:USER

## Build Plans description

Name | Type | Description | Steps
-|-|-|-
 CaptureBP-FDZ |  capture |  Capture Golden Images. Tested with CentOS 7.6 and XenServer 7.6 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Generalize-host-before-CapturePS-FDZ 3- Generalize-network-before-CapturePS-FDZ 4- Generalize-users-before-CapturePS-FDZ 5- Clean-up-after-CapturePS-FDZ 6- Unmount-GeneralPS-FDZ
 XenServer-DeployBP-FDZ |  deploy |  Deploys XenServer. Tested with 7.6 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Prepare-for-DeploymentPS-FDZ 3- Xen-ConfigureManagementNetworkNoBond-DeployPS-FDZ 4- Xen-configure-hostname-DeployPS-FDZ 5- Xen-RestoreDisksAndStorageRepos-DeployPS-FDZ 6- Finalize-DeploymentPS-FDZ 7- Unmount-GeneralPS-FDZ

## Plan scripts description

Name | Description
-|-
Clean-up-after-CapturePS-FDZ |  Plan Script Type: capture Cleans up temporary directories or files created in the during the Capture  process.
Finalize-DeploymentPS-FDZ |  Plan Script Type: deploy Mainly finalize the preparation of the RC-FILE to be executed during the next  reboot of the OS-Volume.
Generalize-host-before-CapturePS-FDZ |  Plan Script Type: capture Remove host configuration before capture. Tested with with RHEL7.5, CentOS 7.5,  SLE 15 and XenServer 7.1.
Generalize-network-before-CapturePS-FDZ |  Plan Script Type: capture Remove network settings depending on the OS-Type before golden image capture.  Tested with RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.1
Generalize-users-before-CapturePS-FDZ |  Plan Script Type: capture Remove user accounts created during a previous deployment and before a new  Capture. Tested on RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.6.
Mount-and-Validate-GeneralPS-FDZ |  Plan Script Type: general Mount the root partition of the OS-Volume depending on the OS type found in the  OS-Volume. Suitable for both Capture and Deploy OS Build Plans. Must be the  first step of OS Build Plans. Tested with TBD
Prepare-for-DeploymentPS-FDZ |  Plan Script Type: deploy Validate the Golden Image/OS-Volume against invalid captures and prepare the RC  file to be modified by the deployment Plan Scripts. When needed, copy the  bootloader in the EFI/BOOT directory of the UEFI partition. Tested with  CentOS-1810, XenServer 7.6. Should work fine with SLE 15
Unmount-GeneralPS-FDZ |  Plan Script Type: general Unmounts all the guestfish mounted partition(s). It can be used in both Capture  and Deploy OS Build Plans
Xen-configure-hostname-DeployPS-FDZ |  Plan Script Type: deploy Hostname configuration of XenServer as well as new UUID and certificate  generation. NOTE: Not suitable for Linux distros. It contains xe commands.
Xen-ConfigureManagementNetworkNoBond-DeployPS-FDZ |  Plan Script Type: deploy XenServer simple management network configuration. No bond.
Xen-RestoreDisksAndStorageRepos-DeployPS-FDZ |  Plan Script Type: deploy Restore the DvD Drives, Removable storage and Local storage repositories that  may have been removed during the Golden Image creation process. Suitable for  XenServer only.
## Build Plans description

Name | Type | Description | Steps
-|-|-|-
 CaptureBP-FDZ |  capture |  Capture Golden Images. Tested with CentOS 7.6 and XenServer 7.6 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Generalize-host-before-CapturePS-FDZ 3- Generalize-network-before-CapturePS-FDZ 4- Generalize-users-before-CapturePS-FDZ 5- Clean-up-after-CapturePS-FDZ 6- Unmount-GeneralPS-FDZ
 XenServer-DeployBP-FDZ |  deploy |  Deploys XenServer. Tested with 7.6 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Prepare-for-DeploymentPS-FDZ 3- Xen-ConfigureManagementNetworkNoBond-DeployPS-FDZ 4- Xen-configure-hostname-DeployPS-FDZ 5- Xen-RestoreDisksAndStorageRepos-DeployPS-FDZ 6- Finalize-DeploymentPS-FDZ 7- Unmount-GeneralPS-FDZ

## Plan scripts description

Name | Type | Description
-|-|-
Clean-up-after-CapturePS-FDZ | capture |  Cleans up temporary directories or files created in the during the Capture  process.
Finalize-DeploymentPS-FDZ | deploy |  Mainly finalize the preparation of the RC-FILE to be executed during the next  reboot of the OS-Volume.
Generalize-host-before-CapturePS-FDZ | capture |  Remove host configuration before capture. Tested with with RHEL7.5, CentOS 7.5,  SLE 15 and XenServer 7.1.
Generalize-network-before-CapturePS-FDZ | capture. |  Remove network settings depending on the OS-Type before golden image capture.  Tested with RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.1
Generalize-users-before-CapturePS-FDZ | capture |  Remove user accounts created during a previous deployment and before a new  Capture. Tested on RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.6.
Mount-and-Validate-GeneralPS-FDZ | general |  Mount the root partition of the OS-Volume depending on the OS type found in the  OS-Volume. Suitable for both Capture and Deploy OS Build Plans. Must be the  first step of OS Build Plans. Tested with TBD
Prepare-for-DeploymentPS-FDZ | deploy |  Validate the Golden Image/OS-Volume against invalid captures and prepare the RC  file to be modified by the deployment Plan Scripts. When needed, copy the  bootloader in the EFI/BOOT directory of the UEFI partition. Tested with  CentOS-1810, XenServer 7.6. Should work fine with SLE 15
Unmount-GeneralPS-FDZ | general |  Unmounts all the guestfish mounted partition(s). It can be used in both Capture  and Deploy OS Build Plans
Xen-configure-hostname-DeployPS-FDZ | deploy |  Hostname configuration of XenServer as well as new UUID and certificate  generation. NOTE: Not suitable for Linux distros. It contains xe commands.
Xen-ConfigureManagementNetworkNoBond-DeployPS-FDZ | deploy |  XenServer simple management network configuration. No bond.
Xen-RestoreDisksAndStorageRepos-DeployPS-FDZ | deploy |  Restore the DvD Drives, Removable storage and Local storage repositories that  may have been removed during the Golden Image creation process. Suitable for  XenServer only.
