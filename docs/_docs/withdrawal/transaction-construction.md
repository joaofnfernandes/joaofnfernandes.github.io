---
title: Transaction construction
description:
---

In this section, we construct a “signed transaction” in our quarantined environments, verify it, and then use QR codes to extract it from the quarantined environments (for execution in the following section).

1. Execute Section VI of the Setup Protocol to prepare your quarantined workspace.
2. Construct the withdrawal transaction

On the Q1 computer:

  a. Import QR code data
    i. Start the QR code reader: $ zbarcam
    A window will appear with your laptop’s video feed.
    ii. For each QR code you printed out in Section I:
      1. Hold the QR code up to the webcam.
      2. When a green square appears around the QR code on the video feed, it has been successfully read.
      3. Verify the decoded QR code is shown in the terminal window. Example:
      ```
      $QR-Code:
      51410421167f7dac2a159bc3957e3498bb6a7c2f1687
      4bf1fbbe5b523b3632d2c0c43f1b491f6f2f449ae45c9b0716329
      c0c2dbe09f3e5d4e9fb6843af083e222a70a441043704eafafd73
      f1c32fafe10837a69731b93c0179fa268fc325bdc08f3bb3056b0
      02eac4fa58c520cc3f0041a097232afbe002037edd5ebdab2e493
      f18ef19e9052ae
      ```
      4. Copy-paste the decoded data (everything after, but not including, “ QR-code: ”) into the Quarantined Scratchpad.
      5. Make a note of what the data is, based on your handwritten label from the
      printed QR code (i.e. “raw unspent transaction” or “redemption script”).
  b. Close the window with the live video feed.
  c. Verify the destination address in the Quarantined Scratchpad matches your handwritten copy of the destination address.
  d. Transcribe the other information you will be using into the Quarantined Scratchpad.
    i. Private keys
    ii. Fee rate

    Transcribe the private keys with reasonable care, but painstaking verification is not critical. (If you make an error, the withdrawal will simply fail, prompting you to fix your transcription error.)

  e. If any raw unspent transactions are too long, move each too-long transaction to its own file.

  GlacierScript normally takes input by copy-pasting values, but it can only accept copy-pasted values up to about 4000 characters in size.88

    i. If any raw unspent transaction is longer than 4000 characters, you'll need to save it to its own file on disk.

      1. If you're not sure if it's 4000 characters, you can try the copy-paste method. If it's too long (or if there is some other problem with it), you'll receive a "TX decode" error (code 22).
    ii. You can do this by opening a new TextEdit window, pasting the raw unspent transaction into it, and saving the file.
    iii. Make sure to save it to the folder containing glacierscript.py .
  f. Begin construction of the withdrawal transaction:
  ```
  $ cd ~/glacier
  $ ./glacierscript.py create-withdrawal-data
  ```

  g. When prompted for the number of private keys to use:
    i. If you are doing an initial test withdrawal for a new cold storage address, choose N (i.e. the total number of keys in your multisignature withdrawal policy -- 4 if you use the default recommendation).

    ii. Otherwise, select 2 (assuming you’re using the recommended 2-of-n withdrawal policy).
  h. Enter all data as prompted by copy-pasting from the Quarantined Scratchpad.
    i. Technical note for experienced Bitcoin users: If the withdrawal amount & fee are cumulatively less than the total amount of the unspent transactions, the remainder will be sent back to the same cold storage address as change.
  i. The script will output a “raw signed transaction” and a fingerprint of the signed transaction for verification purposes.

  Example output:
  ```
  Sufficient private keys to execute transaction?
  True
  Raw signed transaction (hex):

  01000000013cd6b24735801ad3d04c40e6da3404278b0d38dbc896df6ae50bf11c3043a49
  600000000fda001004730440220199d247cd11c14fa4960a52467e69ca6b77596e94c14f2
  7ba956315f2d1c852302201b6f41ecfc62a1a7c7a423425ab150301cfffc47c1a78a5bf13
  b8232f767e41301483045022100e7ae7e5a77da47d5e622f974683a43d312e72a1eed329d
  4fdbd8fba2c22f84b4022050358fb63cf182e81905417d6e38a2981563495dd00c3177ee6
  50ff7cd2d511a014d0b01524104fe0fcd054a31130749467f07e272426f7dd7a3029ab5b0
  76d7285a931bd131d34ed9f28b2cc2fe266aa62c4cada3e82b70a4416966902201c4d7375
  9f7f0425e41044f2ec9f80ef2c4f385f3d27b6167f77236de63548723ba1c90a324f4ec46
  dfd14a2fba5a9c048a5ec310aedfe875d8a254f336e8f7d5d17338d9451dc6f2188c4104a
  efb86098442adc6c3dffd9b0e27fe8e918462469a5ec5363e26920f09facea70b63e4f4d2
  736089286d4dd2352ca65016e7d593f105009f9a35c03a2464aa20410451e7f31ea2f5cb1
  4ba76ca20952c1d453fe3a85959ebbefee8912ad6f74c443a03e52ef8a842f890f1ab2d69
  c6bb418e6de0f15bef944be2883887be3bb75cc054aeffffffff019496070000000000197
  6a914c018da1cb43c5d7b9e7757805ee78709f8a61ede88ac00000000

  Transaction fingerprint (md5):
  c49c366908296ae12478539d29fb4146

  QR code for transaction in transaction.png
  ```

3. Verify transaction construction
  a. On the Q2 computer, repeat step 2 above.
    i. Note: it is important to enter the private keys in the same order on each of the quarantined computers.

  b. Verify that the “Transaction fingerprint” output by GlacierScript is identical on both computers.
  c. If there are any discrepancies, do not proceed. Restart the Withdrawal Protocol and seek assistance if discrepancies persist.
4. Visually hide all critically sensitive data.

We’ll be using a smartphone with a live Internet connection to read QR codes from the quarantined computer screens. Any malware (or a malicious QR reader app) could steal sensitive data if it is not visually hidden.

This step is important. Failing to execute it properly creates a substantial security risk.

  a. Put your Cold Storage Information Packets out of sight -- this prevents a smartphone camera from accidentally seeing them.
  b. Delete all text from the Quarantined Scratchpad on the Q1 and Q2 computers.
  c. On the Q1 computer:
    i. Copy-paste the raw signed transaction from the terminal window to the Quarantined Scratchpad.
    ii. Enable line wrapping so the entire raw signed transaction can be seen.
      1. With the Quarantined Scratchpad window active, go to the menu bar at the top of the screen.
      2. Select Edit.
      3. Select Preferences.
      4. Select the View tab.
      5. Uncheck “Do not split words over two lines”.
  d. Clear the terminal windows on the Q1 and Q2 computers. $ clear
5. Extract the signed transaction from the quarantined environment.
  a. QR reader setup
    i. Remove a smartphone from the Faraday bag and turn it on.
    ii. If the smartphone doesn’t already have a QR code reader on it, install one. Any reader is fine as long as it can read all types of QR codes, but here are recommendations we’ve tested with this protocol: iOS , Android
  b. Transfer the signed transaction data to a non-quarantined computer.
    i. On the Q1 computer, display the raw signed transaction as a QR code on the screen:
      1. In File Manager, navigate to the “Home” folder, then the “glacier” folder, and double-click “transaction.png”.
    ii. Use the smartphone’s QR code reader to read the QR code. When the QR code is successfully read, the smartphone should display the raw signed transaction .
    iii. Verify the raw signed transaction on the smartphone matches the signed transaction data in the Quarantined Scratchpad. You only need to verify the first 16 characters, last 16 characters, and a few somewhere in the middle.
    iv. If it does not match, do not proceed. Try using a different QR reader application or restarting the Withdrawal Protocol. Seek assistance if discrepancies persist.
    v. Use the smartphone to send the raw signed transaction to yourself using a messaging app which you’ll be able to access from a laptop.
6. Shut down both quarantined computers entirely.
```
$ sudo shutdown now
```
The recommended Acer laptop may require you to hold down the power button for several seconds to complete the shutdown.