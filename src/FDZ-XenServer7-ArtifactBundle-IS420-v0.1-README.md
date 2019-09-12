# Artifact content

## Plan scripts content

Name | Description
-|-
Clean-up-after-CapturePS-FDZ |  Cleans up temporary directories or files created in the during the Capture  process.
Finalize-DeploymentPS-FDZ |  Mainly finalize the preparation of the RC-FILE to be executed during the next  reboot of the OS-Volume.
Generalize-host-before-CapturePS-FDZ |  Remove host configuration before capture. Tested with with RHEL7.5, CentOS 7.5,  SLE 15 and XenServer 7.1.
Generalize-network-before-CapturePS-FDZ |  Remove network settings depending on the OS-Type before golden image capture.  Tested with RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.1
Generalize-users-before-CapturePS-FDZ |  Remove user accounts created during a previous deployment and before a new  Capture. Tested on RHEL 7.5, CentOS 7.5, SLE 15 and XenServer 7.6.
Mount-and-Validate-GeneralPS-FDZ |  Mount the root partition of the OS-Volume depending on the OS type found in the  OS-Volume. Suitable for both Capture and Deploy OS Build Plans. Must be the  first step of OS Build Plans. Tested with TBD
Prepare-for-DeploymentPS-FDZ |  Validate the Golden Image/OS-Volume against invalid captures and prepare the RC  file to be modified by the deployment Plan Scripts. When needed, copy the  bootloader in the EFI/BOOT directory of the UEFI partition. Tested with  CentOS-1810, XenServer 7.6. Should work fine with SLE 15
Unmount-GeneralPS-FDZ |  Unmounts all the guestfish mounted partition(s). It can be used in both Capture  and Deploy OS Build Plans
Xen-configure-hostname-DeployPS-FDZ |  Hostname configuration of XenServer as well as new UUID and certificate  generation. NOTE: Not suitable for Linux distros. It contains xe commands.
Xen-ConfigureManagementNetworkNoBond-DeployPS-FDZ |  XenServer simple management network configuration. No bond.
Xen-RestoreDisksAndStorageRepos-DeployPS-FDZ |  Restore the DvD Drives, Removable storage and Local storage repositories that  may have been removed during the Golden Image creation process. Suitable for  XenServer only.
