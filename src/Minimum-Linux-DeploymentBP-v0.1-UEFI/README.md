# Artifact description and content

## Description

Artifact Name:Minimum-Linux-DeploymentBP-v0.1-UEFI

Description:Contains the minimum steps to deploy a Linux OS with no customization different from the Golden Image. Suitable for RHEL 7, CentOS7, SLE15, XenServer 7, and Ubuntu 19.04

Read Only:false

Time Stamp:2019-10-01T14:48:01.922Z

Artifact Type:USER

## Build Plans description

Name | Type | Description | Steps
-|-|-|-
 Linux-Minimum-DeployBP-EFI |  deploy |  Deploy a Golden Image deployment with no customization. The only thing done in the Finalize step is the cleanup of the RC-FILE after the first reboot of the deployed server. |  1- Mount-UEFI-Partition-GeneralPS 2- Prepare-for-Deployment-EFI 3- Finalize-DeploymentPS-EFI 4- Unmount-GeneralPS

## Plan scripts description

Name | Type | Description
-|-|-
Finalize-DeploymentPS-EFI | deploy |  Clean up the RC-FILE to avoid errors upon each reboot of the deployed server.
Mount-UEFI-Partition-GeneralPS | general |  Mount the UEFI vfat partition of the OS-Volume. Suitable for both Capture and  Deploy OS Build Plans. Must be the first step of OS Build Plans.
Prepare-for-Deployment-EFI | deploy |  Perform various OS dependent actions Tested with CentOS 7, SLE 15, XenServer  7.6, Ubuntu 19.04
Unmount-GeneralPS | general |  Unmounts all the guestfish mounted partition(s). It can be used in both Capture  and Deploy OS Build Plans, legacy or UEFI based deployment BPs.
