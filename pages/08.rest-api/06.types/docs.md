---
title: Types
---

[TOC]

Definitions for field types/values used

---

## Flight Types

These are derived from the IATA SSIM formats

| Value | Description                         |
| :---: | ----------------------------------- |
|   J   | Passenger - Scheduled               |
|   F   | Cargo - Scheduled                   |
|   C   | Charter - Passenger Only            |
|   A   | Additional Cargo/Mail               |
|   E   | Special VIP Flight (FAA/Government) |
|   G   | Passenger - Additional              |
|   H   | Charter - Cargo/Mail                |
|   I   | Ambulance Flight                    |
|   K   | Training Flight                     |
|   M   | Mail Service                        |
|   O   | Charter w/ Special Handling         |
|   P   | Positioning (Ferry/Delivery/Demo)   |
|   T   | Technical Test                      |
|   W   | Military                            |
|   X   | Technical Stop                      |

---

## PIREP Status

These are all of the possible values for the PIREP status. They are all from the Aviation Information Data eXchange (AIDX) format.

| Value to Use | Description          |
| :----------: | -------------------- |
|     INI      | Initiated            |
|     SCH      | Scheduled            |
|     BST      | Boarding             |
|     RDT      | Ready for start      |
|     OFB      | Departed             |
|     DIR      | Ready for de-icing   |
|     DIC      | De-icing in progress |
|     GRT      | Ground return        |
|     TKO      | Enroute              |
|      DV      | Diverted             |
|     TEN      | Approach             |
|     FIN      | Final approach       |
|     LAN      | Landed               |
|     ONB      | Arrived              |
