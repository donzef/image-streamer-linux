# Artifact description and content

## Description

Artifact Name:MultiDistro-ArtifactBundle-v0.5-FDZ

Description:Simple didactic multi-distro Linux (RHEL, CentOS, XenServer, Ubuntu) artifact bundle for use with HPE Image Streamer < 5.0.

Read Only:false

Time Stamp:2019-09-12T13:37:33.117Z

Artifact Type:USER

## Build Plans description

Name | Type | Description | Steps
-|-|-|-
 CaptureBP-FDZ |  capture |  Capture Golden Images. Tested with CentOS 7.6 and XenServer 7.6 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Generalize-host-before-CapturePS-FDZ 3- Generalize-network-before-CapturePS-FDZ 4- Generalize-users-before-CapturePS-FDZ 5- Clean-up-after-CapturePS-FDZ 6- Unmount-GeneralPS-FDZ
 Linux-DeployBP-FDZ |  deploy |  Deploys Linux. Not suitable for XenServer Tested with CentOS-1810 and SLE 15 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Prepare-for-DeploymentPS-FDZ 3- Linux-configure-multiple-NICs-DeployPS-FDZ 4- Linux-configure-hostname-DeployPS-FDZ 5- Linux-configure-users-DeployPS-FDZ 6- Linux-manage-security-services-DeployPS-FDZ 7- Finalize-DeploymentPS-FDZ 8- Unmount-GeneralPS-FDZ
 XenServer-DeployBP-FDZ |  deploy |  Deploys XenServer. Tested with 7.6 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Prepare-for-DeploymentPS-FDZ 3- Xen-ConfigureManagementNetworkNoBond-DeployPS-FDZ 4- Xen-configure-hostname-DeployPS-FDZ 5- Xen-RestoreDisksAndStorageRepos-DeployPS-FDZ 6- Finalize-DeploymentPS-FDZ 7- Unmount-GeneralPS-FDZ

## Plan scripts description

Name | Type | Description
-|-|-
Clean-up-after-CapturePS-FDZ | capture |  Cleans up temporary directories or files created in the during the Capture  process.
Finalize-DeploymentPS-FDZ | deploy |  Mainly finalize the preparation of the RC-FILE to be executed during the next  reboot of the OS-Volume.
Generalize-host-before-CapturePS-FDZ | capture |  Create/populate an ImageStreamerCapture file certifying that the Golden Image  has been created properly. Performs various cleanups: network file, hostname,  fstab, /etc/hosts Tested with with RHEL7.5, CentOS 7.5, SLE 15 and XenServer  7.1, 7.6 and Ubuntu 19.04.
Generalize-network-before-CapturePS-FDZ | capture. |  Remove network settings depending on the OS-Type before golden image capture.  Tested with RHEL 7.5, CentOS 7.5, SLE 15, XenServer 7.1, 7.6. Although Ubuntu  19.04 does not generate fatal errors, it is not well integrated.
Generalize-users-before-CapturePS-FDZ | capture |  Remove user accounts created during a previous deployment and before a new  Capture. Tested on RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.6.
Linux-configure-hostname-DeployPS-FDZ | deploy |  Configure hostname and populate the network directory with ifcfg-* files and  /etc/hosts. NOTE: This script MUST be executed after the  Linux-configure-multiple-NICs-Deploy Plan Script. NOTE: The hostname is  associated to the IP address of the first discovered NIC, which is shell  variable iface=${array[0]}) NOTE: Not suitable for XenServer
Linux-configure-multiple-NICs-DeployPS-FDZ | deploy |  Configure all the NICs corresponding to the Connections defined in the OneView  Profile. The number of NICs to configure corresponds to the number of connected  NICs defined in the Server Profile. Restrictions: With this version, it is not  possible to configure less NICs than connections present in the Profile.  Moreover, the NICs to configure must be in sequence. For example It is not  possible to configure NIC1 and NIC3 and not NIC2. NOTE: For a maximum of  flexibility, when this Plan Script is included in a Build Plan, make sure, for  each NIC, you edit its Build Plan's Custom Attributes and select all the  offered possibilities: "Allow static", "Allow DHCP", "Allow no network  connection". NOTE: Not suitable for XenServer.
Linux-configure-users-DeployPS-FDZ | deploy |  Set root password and create user accounts during the deployment process.  Tested successfully with RHEL 7, CentOS 7 and SLE 15 and Ubuntu 19.04. ToDo:  add support of XenServer
Linux-manage-security-services-DeployPS-FDZ | deploy |  Enables or Disables security services. Successfully tested on RHEL 7.5, CentOS  7.5. ToDo: Support of SLE 15. Investigate adaption to XenServer and Ubuntu
Mount-and-Validate-GeneralPS-FDZ | general |  Mount the root partition of the OS-Volume depending on the OS type. Suitable  for both Capture and Deploy OS Build Plans. Must be the first step of OS Build  Plans. Tested with RHEL 7, CentOS 7, XenServer 7 and Ubuntu 19.04
Prepare-for-DeploymentPS-FDZ | deploy |  Validate the Golden Image/OS-Volume against invalid captures and prepare the RC  file to be modified by the deployment Plan Scripts. When needed, copy the  bootloader in the EFI/BOOT directory of the UEFI partition. Tested with  CentOS-1810, XenServer 7.6 and Ubuntu 19.04. Should work fine with SLE 15
Unmount-GeneralPS-FDZ | general |  Unmounts all the guestfish mounted partition(s). It can be used in both Capture  and Deploy OS Build Plans
Xen-configure-hostname-DeployPS-FDZ | deploy |  Hostname configuration of XenServer as well as new UUID and certificate  generation. NOTE: Not suitable for Linux distros. It contains xe commands.
Xen-ConfigureManagementNetworkNoBond-DeployPS-FDZ | deploy |  XenServer simple management network configuration. No bond.
Xen-RestoreDisksAndStorageRepos-DeployPS-FDZ | deploy |  Restore the DvD Drives, Removable storage and Local storage repositories that  may have been removed during the Golden Image creation process. Suitable for  XenServer only.
## Build Plans description

Name | Type | Description | Steps
-|-|-|-
 CaptureBP-FDZ |  capture |  Capture Golden Images. Tested with CentOS 7.6 and XenServer 7.6 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Generalize-host-before-CapturePS-FDZ 3- Generalize-network-before-CapturePS-FDZ 4- Generalize-users-before-CapturePS-FDZ 5- Clean-up-after-CapturePS-FDZ 6- Unmount-GeneralPS-FDZ
 Linux-DeployBP-FDZ |  deploy |  Deploys Linux. Not suitable for XenServer Tested with CentOS-1810 and SLE 15 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Prepare-for-DeploymentPS-FDZ 3- Linux-configure-multiple-NICs-DeployPS-FDZ 4- Linux-configure-hostname-DeployPS-FDZ 5- Linux-configure-users-DeployPS-FDZ 6- Linux-manage-security-services-DeployPS-FDZ 7- Finalize-DeploymentPS-FDZ 8- Unmount-GeneralPS-FDZ
 XenServer-DeployBP-FDZ |  deploy |  Deploys XenServer. Tested with 7.6 |  1- Mount-and-Validate-GeneralPS-FDZ 2- Prepare-for-DeploymentPS-FDZ 3- Xen-ConfigureManagementNetworkNoBond-DeployPS-FDZ 4- Xen-configure-hostname-DeployPS-FDZ 5- Xen-RestoreDisksAndStorageRepos-DeployPS-FDZ 6- Finalize-DeploymentPS-FDZ 7- Unmount-GeneralPS-FDZ

## Plan scripts description

Name | Type | Description
-|-|-
Clean-up-after-CapturePS-FDZ | capture |  Cleans up temporary directories or files created in the during the Capture  process.
Finalize-DeploymentPS-FDZ | deploy |  Mainly finalize the preparation of the RC-FILE to be executed during the next  reboot of the OS-Volume.
Generalize-host-before-CapturePS-FDZ | capture |  Create/populate an ImageStreamerCapture file certifying that the Golden Image  has been created properly. Performs various cleanups: network file, hostname,  fstab, /etc/hosts Tested with with RHEL7.5, CentOS 7.5, SLE 15 and XenServer  7.1, 7.6 and Ubuntu 19.04.
Generalize-network-before-CapturePS-FDZ | capture. |  Remove network settings depending on the OS-Type before golden image capture.  Tested with RHEL 7.5, CentOS 7.5, SLE 15, XenServer 7.1, 7.6. Although Ubuntu  19.04 does not generate fatal errors, it is not well integrated.
Generalize-users-before-CapturePS-FDZ | capture |  Remove user accounts created during a previous deployment and before a new  Capture. Tested on RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.6.
Linux-configure-hostname-DeployPS-FDZ | deploy |  Configure hostname and populate the network directory with ifcfg-* files and  /etc/hosts. NOTE: This script MUST be executed after the  Linux-configure-multiple-NICs-Deploy Plan Script. NOTE: The hostname is  associated to the IP address of the first discovered NIC, which is shell  variable iface=${array[0]}) NOTE: Not suitable for XenServer
Linux-configure-multiple-NICs-DeployPS-FDZ | deploy |  Configure all the NICs corresponding to the Connections defined in the OneView  Profile. The number of NICs to configure corresponds to the number of connected  NICs defined in the Server Profile. Restrictions: With this version, it is not  possible to configure less NICs than connections present in the Profile.  Moreover, the NICs to configure must be in sequence. For example It is not  possible to configure NIC1 and NIC3 and not NIC2. NOTE: For a maximum of  flexibility, when this Plan Script is included in a Build Plan, make sure, for  each NIC, you edit its Build Plan's Custom Attributes and select all the  offered possibilities: "Allow static", "Allow DHCP", "Allow no network  connection". NOTE: Not suitable for XenServer.
Linux-configure-users-DeployPS-FDZ | deploy |  Set root password and create user accounts during the deployment process.  Tested successfully with RHEL 7, CentOS 7 and SLE 15 and Ubuntu 19.04. ToDo:  add support of XenServer
Linux-manage-security-services-DeployPS-FDZ | deploy |  Enables or Disables security services. Successfully tested on RHEL 7.5, CentOS  7.5. ToDo: Support of SLE 15. Investigate adaption to XenServer and Ubuntu
Mount-and-Validate-GeneralPS-FDZ | general |  Mount the root partition of the OS-Volume depending on the OS type. Suitable  for both Capture and Deploy OS Build Plans. Must be the first step of OS Build  Plans. Tested with RHEL 7, CentOS 7, XenServer 7 and Ubuntu 19.04
Prepare-for-DeploymentPS-FDZ | deploy |  Validate the Golden Image/OS-Volume against invalid captures and prepare the RC  file to be modified by the deployment Plan Scripts. When needed, copy the  bootloader in the EFI/BOOT directory of the UEFI partition. Tested with  CentOS-1810, XenServer 7.6 and Ubuntu 19.04. Should work fine with SLE 15
Unmount-GeneralPS-FDZ | general |  Unmounts all the guestfish mounted partition(s). It can be used in both Capture  and Deploy OS Build Plans
Xen-configure-hostname-DeployPS-FDZ | deploy |  Hostname configuration of XenServer as well as new UUID and certificate  generation. NOTE: Not suitable for Linux distros. It contains xe commands.
Xen-ConfigureManagementNetworkNoBond-DeployPS-FDZ | deploy |  XenServer simple management network configuration. No bond.
Xen-RestoreDisksAndStorageRepos-DeployPS-FDZ | deploy |  Restore the DvD Drives, Removable storage and Local storage repositories that  may have been removed during the Golden Image creation process. Suitable for  XenServer only.
