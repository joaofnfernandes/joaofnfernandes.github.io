---
title: Extend Glacier security
description:
---



Glacier is designed to provide strong protection for almost everyone -- even those storing many millions of dollars.

However, it is not designed to provide adequate protection for truly exceptional circumstances, such as a targeted attack/surveillance effort (electronic or physical) by a well-resourced criminal organization. This appendix briefly outlines additional measures one might consider if further security were needed above and beyond those in the formal Glacier protocol.

We do not recommend considering these measures unless you feel you have a strong need. This list is neither complete nor are the practices cost-effective for almost any circumstances. In addition, implementing these measures incorrectly may decrease security rather than increase it.

## Digital software security

* Verify GnuPG installation: When downloading a new copy of GnuPG on the setup computer, one would ideally also verify the integrity of the download using the signed checksum. This requires having a pre-existing trusted installation of GnuPG available for verifying the checksum signature.
* Cross-network checksum sourcing: Using two different computers on two different networks, obtain all the software checksums from the Internet and verify they are identical, to reduce the risk that the checksums are being compromised by a man-in-the-middle attack.
* Quarantined checksum verification: Verify all USB checksums on the quarantined computers to eliminate any risk that software was altered between checksum verification on the Setup Computers and when the USB is used in the quarantined environment.
* Greater differentiation of quarantined environments: Instead of simply using different hardware in each quarantined environment, use different software94 (including a non-Linux-derived OS and a different Bitcoin wallet), different smartphones (and different smartphone software, i.e. QR code readers).
 * Dedicated pair of environments for each private key: Use extra environments such that each environment only touches one key both when generating keys and signing transactions. Expand the definition of “environment” to include the physical location in which Glacier is executed. This way, compromising one environment will only compromise one key.
* Deposit transaction verification: If depositing bitcoins out of self-managed storage, don’t immediately send a transaction directly from one’s own wallet software. Instead, first export a raw signed transaction, and use a service like Blockr to verify the transaction is actually sending the funds to the correct address.
* Avoid software random number generators: Use a hardware random number generator instead.

## Side channel security
* Faraday cage: Use a Faraday cage to protect against electromagnetic side channels ( example ). Faraday cages can be self-built or professionally built .
* No QR
codes: Reading and relaying QR codes to a printer requires a networked
device, such as a smartphone, which could potentially receive data from
side channels. Instead of using QR codes, copy all redemption scripts and
transactions by hand, and keep all nearby smartphones powered off and in
Faraday bags through protocol execution.

## Hardware security
* Purchase
factory-new Setup Computers: Don’t use existing computers for your Setup
Computers. Purchase them factory-new, and never use them on the same
network (to reduce the risk of infection by identical malware).
* Use firmware-protected USBs: Some USBs have extra features to protect against
malware targeting their firmware (e.g. BadUSB or Psychson ). Examples
include Kanguru drives and IronKey drives .
* Purchase a factory-new printer: Printers can have malware, which could conceivably interfere with printing the hardcopy of the Glacier document. Use a new printer for printing the Glacier document. Choose one without wireless
capabilities.
* Purchase non-recommended equipment: Don’t purchase any
of the suggested equipment linked in this document -- if Glacier achieves
widespread adoption, that particular equipment may be targeted for sabotage to
undermine the protocol (e.g. loaded dice, malware pre-installed on
computers, etc.) Select your own comparable equipment from different
manufacturers.
* Purchase from stores:  Buy all equipment from stores,
to reduce the risk it will be tampered with before it is delivered to you
. Don’t choose the stores nearest your home or office. Don’t leave the
equipment unattended until you are done using it.
* Improved
tamper-evident seals on laptops: After you are done using the laptop,
paint over the hinge joints and cover screws with glitter nail polish
and take a picture. The randomness of the glitter is difficult to
recreate, so if the laptop is tampered with, you can see it, and know not
to use it for future protocol operations.
* Secure or destroy quarantined
hardware after use: If sensitive data was somehow stored on quarantined
hardware’s permanent media due to a protocol error96 or malware, then
physical theft of the hardware becomes a concern. Store the hardware
somewhere secure such as a vault, or physically destroy it first.

## Paper key security
* Paper key encryption: Encrypt the contents of your paper
keys using BIP38 to further protect
against physical theft.
* Durable storage medium: TerraSlate paper is extremely rugged, but you
might also consider laminating the paper for additional protection. You’ll
need a thermal laminator [ Amazon ] and laminating pouches [ Amazon ]. An
even more durable approach would be to engrave the private keys in
metal.
* High-security vaults: Store keys in high-security vaults that
are more resistant to theft and disaster. ( example )
* Geographically
distributed storage: Store keys in distant cities for resilience against
a major disaster that wipes out all keys at once.
* Multiple fund stores: Mitigate risk by splitting funds across more than one Bitcoin address, each secured using Glacier, and don’t keep printed keys from different store in the same place.


## Personal security
* Unique protocol execution site: Rather than executing Glacier at your
home, office, or anywhere else you frequent, choose a new location (e.g.
a hotel) that is unlikely to have compromised or surveillance devices
present.
* Avoid location tracking: To avoid surveillance (including
from adjacent rooms, via side channels like radio waves), take steps to
avoid location tracking when executing Glacier. Don’t carry a GPS-enabled
smartphone with you, don’t use credit cards for purchases, etc.
* Deliver
keys by hand: Don’t use couriers or phones to send keys to trusted
associates. Hand-deliver them personally or using a trusted party.
* Conventional personal security: Home surveillance systems, bodyguards,
etc.