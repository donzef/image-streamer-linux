# Notes concerning XenServer

## 

## Profile creation

* Create a profile using the **HPE - Foundation 1.0 - create empty OS Volume** OS Deployment Plan.

* For 7.1, 7.3 7.6? releases, the minimum disk requirement for XenServer is 46 GB or 47104 MB. Most of this disk will bot be used because Image Streamer uses **thin storage**. Only about .5GB will be provisioned.

* Mount the XenServer ISO installation media using **iLO Virtual Media** and boot from it.

* Start a **shell**:

    ```bash
    echo"InitiatorName=<iqn.yyyy-mm.com.hpe:oneview-string" > /etc/iscsi/initiatorname.iscsi

    /opt/xensource/installer/init --use_ibft
    ```
    where `iqn.yyyy-mm.com.hpe:oneview-string` is the iSCSI initiator name found in the **Server Profile**.

* Enter `Yes` to the Attach iSCSI disks dialog box

* ...TBD



 
