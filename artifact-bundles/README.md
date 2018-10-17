# Didactic-Linux-MultiDistro-Artifact-Bundle-V0.3-FDZ

## Description

Simple didactic multi-distro Linux artifact bundle for use with HPE Image Streamer V4.1+.

## NOTE

* The Artifact bundle in this repo has been developed with ImageStreamer v4.1 release.
* The following versions have been tested:
  * RHEL 7.5
  * CentOS 7.5
  * SLE 15
  * XenServer 7.1 (Capture only)

## Version history

Didactic-Linux-MultiDistro-Artifact-Bundle-V0.2-FDZ

* Automatic copy of the grubx64.efi bootloader in the /EFI/BOOT UEFI directory (Mount-and-Validate-General-FDZ Plan Script) when OS is CentOS.

Didactic-Linux-MultiDistro-Artifact-Bundle-V0.1-FDZ

* Initial release

## Artifact Bundle Content

Name | Description
-|-
Linux-configure-hostname-Deploy-FDZ | Configure hostname and populate the network directory with ifcfg-* files and /etc/hosts. NOTE: This script MUST be executed after the Linux-configure-multiple-Deploy-NICs plan script. NOTE: The hostname is associated to the IP address of the first discovered NIC, which is shell variable iface=${array[0]})
Linux-configure-multiple-NICs-Deploy-FDZ | Configure all the NICs corresponding to the Connections defined in the OneView Profile. The number of NICs to configure corresponds to the number of connected NICs defined in the Server Profile. Restrictions: With this version, it is not possible to configure less NICs than connections present in the Profile. Moreover, the NICs to configure must be in sequence. For example It is not possible to configure NIC1 and NIC3 and not NIC2. NOTE: For a maximum of flexibility, when this Plan Script is included in a Build Plan, make sure, for each NIC, you edit its Build Plan's Custom Attributes and select all the offered possibilities: "Allow static", "Allow DHCP", "Allow no network connection".
Linux-configure-users-Deploy-FDZ | Set root password and create user accounts during the deployment process. Tested successfully with RHEL 7.5, CentOS 7.5 and SLE 15.
Linux-generalize-host-Capture-FDZ | Remove host configuration before capture. Tested with with RHEL7.5, CentOS 7.5, SLE 15 and XenServer 7.1.
Linux-generalize-network-Capture-FDZ | Remove network settings depending on the OS-Type before golden image capture. Tested with RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.1
Linux-generalize-users-Capture-FDZ | Remove user accounts created during a previous deployment and before a new Capture. Tested on RHEL 7.5, CentOS 7.5 and SLE 15.
Linux-manage-security-services-Deploy-FDZ | Enables or Disables security services. Successfully tested on RHEL 7.5, CentOS 7.5. ToDo: Support of SLE 15.
Linux-Mount-and-Validate-General-FDZ | Mount the root partition of the OS-Volume, validate this OS-Volume against invalid captures and prepare the RC file to be modified by the deployment Plan Scripts. When needed, copy the bootloader in the UEFI partition.
Linux-Mount-for-Capture-FDZ | Mount root partition for generalization before capture. Tested with RHEL 7.5, CentOS 7.5, SlE 15 and XenServer 7.1
Linux-unmount-Capture-FDZ | Various cleanup and unmount all guestfish mounted partitions. Tested with RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.1
Linux-unmount-General-FDZ | Cleans up temporary directory or files created in the Plan Scripts and unmounts all the guestfish mounted partition(s).


