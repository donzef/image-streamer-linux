# Didactic-Linux-MultiDistro-Artifact-Bundle-V0.1-FDZ

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

* Automatic copy of the grubx64.efi bootloader in the /EFI/BOOT UEFI directory (Mount-and-Validate-General-FDZ Plan Script).

Didactic-Linux-MultiDistro-Artifact-Bundle-V0.1-FDZ

* Initial release

## Artifact Bundle Content

TBD

Name | Description
-|-
Linux-configure-hostname-Deploy-FDZ | Configure hostname and populate the network directory with ifcfg-* files and /etc/hosts. NOTE: This script MUST be executed after the LInux-configure-multiple-Deploy-NICs plan script. NOTE: The hostname is associated to the IP address of the first discovered NIC, which is shell variable iface=${array[0]})
Linux-configure-multiple-NICs-Deploy-FDZ | Configure all the NICs corresponding to the Connections defined in the OneView Profile. The number of NICs to configure corresponds to the number of connected NICs defined in the Server Profile. Restrictions: With this version, it is not possible to configure less NICs than connections present in the Profile. Moreover, the NICs to configure must be in sequence. For example It is not possible to configure NIC1 and NIC3 and not NIC2. NOTE: For a maximum of flexibility, when this Plan Script is included in a Build Plan, make sure, for each NIC, you edit its Build Plan's Custom Attributes and select all the offered possibilities: "Allow static", "Allow DHCP", "Allow no network connection".


