---
title: Create App USBs
description:
---

We will prepare two (2) “Quarantined App USB”
drives with the software needed to execute the remainder of the protocol.
These are the USB drives you labeled “Q1 APP” and “Q2 APP” in Section
III.

1. Boot the SETUP 1 computer off the SETUP 1 BOOT USB if it is not
already. (See the instructions in Section III for details.)
2. Insert the Q1 APP USB into the the SETUP 1 computer.
  a. The instruction to plug a Quarantined App USB into your Setup computer should raise a red flag for you, because you should never plug a quarantined USB into anything other than the quarantined computer it is designated for! This setup process is the ONE exception.
3. Press Ctrl-Alt-T to open a terminal window.
4. Install the Glacier document and GlacierScript on the Q1 APP USB.
  a. Download the latest full release of Glacier ( not just the protocol document) at https://glacierprotocol.org/releases .
  b. Unpack the Glacier ZIP file into a staging area.
    i. When the download starts, Firefox will ask you if you want to open the ZIP file with Archive Manager. Click OK. When the ZIP file download completes, it will be opened with Archive Manager.
    ii. There will be a single entry in a list named “GlacierProtocol- version-here” , where version-here is replaced with the current version number (like “v1.0”). Click on that and then click the “Extract” button.
    iii. The Archive Manager will ask you where you want to extract the ZIP file to. Select “Home” on the left panel and then press the extract button.
    iv. When the Archive Manager is finished extracting the ZIP archive it will ask you what to do next. Click “Show the Files”.
    v. Rename the unzipped folder from “GlacierProtocol- version-here” to “glacier”.
  c. Obtain the Glacier “public key,” used to cryptographically verify the Glacier document and GlacierScript.

  If you are ever using Glacier in the future and notice that this step has changed (or that this warning has been removed), there is a security risk. Stop and seek assistance.

    i. Access Glacier’s Keybase profile at https://keybase.io/glacierprotocol .
    ii. Click the string of letters and numbers next to the key icon.
    iii. In the pop-up that appears, locate the link reading “this key”.
    iv. Right-click the link and select “Save Link As...”
    v. Name the file “glacier.asc”.
  d. Verify the integrity of the Glacier download.
    i. Import the Glacier public key into your local GPG installation: $ gpg --import ~/Downloads/glacier.asc
    ii. Switch to the glacier folder: $ cd ~/glacier
    iii. Use the public key to verify that the Glacier “fingerprint file” is legitimate:
    ```
    $ gpg --verify
    SHA256SUMS.sig SHA256SUMS
    Expected output (timestamp will vary, but
    e-mail and fingerprint should match):
        gpg: Signature made Thu
    Jan 19 13:45:48 2017 PST using RSA key ID
        4B43EAB0

    gpg: Good signature from "Glacier Team <contact@glacierprotocol.org>"

    [unknown]
    gpg: WARNING: This key is not certified with
    a trusted signature!
    gpg:     There is no indication that the signature belongs to the owner.
    Primary key fingerprint: E1AA EBB7 AC90 C1FE 80F0 1034 9D1B 7F53 4B43
    ```

    The warning message is expected, and is not cause for alarm.56
    iv. Verify the fingerprints in the fingerprint file match the fingerprints of the downloaded Glacier files: $ sha256sum -c SHA256SUMS 2>&1
    Expected output:
    ```
    Glacier.pdf: OK
    glacierscript.py: OK
    base58.py: OK
    README.md: OK
    ```
    e. Copy the glacier folder to the Q1 APP USB.
      i. Click on the File Manager icon in the launching dock along the left side of the screen.
      ii. Find the “glacier” folder under “Home”.
      iii. Click and drag the glacier folder to the icon representing the USB drive on the left. The USB drive will look like this, but may have a different name:
      iv. If you see an “Error while copying” pop-up, you may be suffering from this Ubuntu bug . To fix it, do the following and then retry copying the files:
        1. $ mv ~/.config/nautilus ~/.config/nautilus-bak
        2. Log out of Ubuntu: Click the power icon in the top right of the screen and select “logout” from the drop-down menu.
        3. Login again with user “ubuntu” and leave the password blank.
  5. Open the Glacier protocol document so that it is available for copy-pasting terminal commands.
  6. Install the remaining application software on the Q1 APP USB.
    a. Configure our system to enable access to the software we need in Ubuntu’s “package repository”:57 58
      i. $ sudo mv /var/cache/app-info/xapian/default /var/cache/app-info/xapian/default_old
      ii. $ sudo mv /var/cache/app-info/xapian/default_old /var/cache/app-info/xapian/default
      iii. $ sudo apt-add-repository universe
      iv. $ sudo apt-add-repository ppa:bitcoin/bitcoin
        1. Press Enter when prompted.
      v. $ sudo apt-get update
    b. Download and perform integrity verification59 of software available from Ubuntu’s package repository:
      * bitcoind:  Bitcoin Core , which we’ll use for cryptography & financial operations
      * qrencode: Used for creating QR codes to move data off quarantined computers
      * zbar-tools: Used for reading QR codes to import data into quarantined computers
      ```
      $ sudo apt-get
      install qrencode=3.4.4-1 zbar-tools=0.10+doc-10ubuntu1 bitcoind
      ```
    c. Copy that software to the Q1 APP USB.
      i. Create a folder for the application files that will be moved to the USB: $ mkdir ~/apps
      ii. Copy the software into the apps folder: `$ cp /var/cache/apt/archives/*.deb ~/apps`
      iii. Copy the contents of the apps folder to the Q1 APP USB:
        1. Click on the File Manager icon in the launching dock:
        2. Navigate to the “Home” folder.
        3. Click and drag “apps” folder  to the icon representing
        the USB drive on the left panel. The USB drive will look like this, but may have a different name:
  7. Click on the USB drive icon to verify that it has the correct files. The contents should look like this
  ```
   apps
  glacier
  ```
  Click the apps folder. It will have the following content:
  ```
  bitcoind_0.13.2-xenial1_amd64.deb
  libboost-chrono1.58.0_1.58.0+dfsg-5ubuntu3.1_amd64.deb
  libboost-program-options1.58.0_1.58.0+dfsg-5ubuntu3.1_amd64.deb
  libboost-thread1.58.0_1.58.0+dfsg-5ubuntu3.1_amd64.deb
  libdb4.8++_4.8.30-xenial2_amd64.deb
  libevent-core-2.0-5_2.0.21-stable-2_amd64.deb
  libevent-pthreads-2.0-5_2.0.21-stable-2_amd64.deb
  libqrencode3_3.4.4-1_amd64.deb
  libsodium18_1.0.8-5_amd64.deb
  libzbar0_0.10+doc-10ubuntu1_amd64.deb libzmq5_4.1.4-7_amd64.deb
  qrencode_3.4.4-1_amd64.deb zbar-tools_0.10+doc-10ubuntu1_amd64.deb
  ```
  Click the glacier folder. It will have the following content:
  ```
  base58.py
  Glacier.pdf
  glacierscript.py
  LICENSE README.md
  SHA256SUMS
  SHA256SUMS.sig
  ```
  8. Eject and physically remove the Q1 APP USB from the SETUP 1 computer. The Q1 APP USB is now eternally quarantined. It should never again be plugged into anything besides the Q1 computer.
  9. Repeat all above steps using the SETUP 2 computer, SETUP 2 BOOT USB, and Q2 APP USB.
  10. Find a container in which to store all of your labeled hardware, along with the Glacier document hardcopy, when you are finished.