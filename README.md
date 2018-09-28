# image-streamer-linux
Sample Linux multi-distro artifact bundle for use with HPE Image Streamer V4.1+

This project is a merged fork of the [image-streamer-rhel](https://github.com/HewlettPackard/image-streamer-rhel) and the [image-streamer-sles](https://github.com/HewlettPackard/image-streamer-sles) repositories.

The ultimate goal is to provide Plan Scripts able to capture and deploy various flavors of Linux. Currently it supports RHEL 7, CentOS 7 and  SLE 15.

Another goal is didactic. The provided Plan Scripts contain a comments explaining the context of the commands (guestfish, OS shell...) as well as the location of their output (OS-Volume, Golden-Image, Image Streamer). They can be used to better understand the guestfish mechanic and to troubleshoot in case of problem.



