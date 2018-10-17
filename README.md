# image-streamer-linux

Simple didactic multi-distro Linux artifact bundle for use with HPE Image Streamer V4.1+.

This project is a merged fork of the [image-streamer-rhel](https://github.com/HewlettPackard/image-streamer-rhel) and the [image-streamer-sles](https://github.com/HewlettPackard/image-streamer-sles) repositories.

The ultimate goal is to explain how to create Plan Scripts able to capture and deploy various flavors of Linux including XenServer. Currently it provides capture scripts for XenServer 7.1+, RHEL 7, CentOS 7 and  SLE 15. Deploy scripts have not been adapted to XenServer yet.

The provided multi-distro Plan Scripts contain a lot of comments explaining the context of their commands (`guestfish`, OS shell...) as well as the location of their output (OS-Volume Activity, Golden-Image Activity or Image Streamer Activity). They can be used to better understand the `guestfish` mechanic and potentially troubleshoot in case of problem during the development of other scripts.

The targeted audience is system engineers having a basic understanding of the HPE Image Streamer capture and deployment processes and its terminology (i.e. Deployment Plan, Build Plan, Plan Scripts, Artifact Bundle...) and willing to better understand HPE officials plan scripts in order to develop their own Plan Scripts.

In addition to many inline comments and explanations, each of the proposed Plan Scripts have an architecture allowing the support of multiple Linux distro types. The support of RHEL, CentOS, XenServer (capture only) and SUSE Enterprise Linux are implemented. Tests have been performed on selected versions only (see the README file in the Artifact Bundles directory). Given the amount of comments  and explanations it should be easy to implement the support of Ubuntu.

When compared to the related official HPE Plan Script, Custom Attributes have been changed or removed. For example, the `TotalMgmtNICs` attribute in the *-configure-multiple-NICs-* Plan Scripts has been removed and its value is automatically computed. This attributes sometimes generated some confusion.

The `ManagementNIC*` Custom Attributes, in the same Plan Script have been renamed to `NIC`, as the Server Profile using this script can hold connections to both management networks and a production networks.

**NOTE**: The provided Artifact Bundle does **NOT** and will **NEVER** replace the HPE Artifacts Bundles developed for officially supported distros. Again, it has been developed for tutorial reasons.
