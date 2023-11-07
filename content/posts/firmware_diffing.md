---
title: "Firmware diffing"
date: 2023-11-07T10:01:50+01:00
draft: false
authors:
  - Michael Messner
tags:
  - EMBA
  - Diffing
---
The identification of the relevant changes between firmware releases is an essential step in bug hunting. For example, in exploit development you are sometimes interested in the changes between two firmware versions - The vulnerable version compared to the fixed version. As it is usually quite hard to extract enough useful information from the published advisories or the CVE details, the only possibility is to check the real differences between the relevant firmware releases. This allows a tear down of the fixed vulnerability and probably write an exploit for it.

_EMBA_ can support you in your tear down process as it is able to identify the differences between different firmware versions using [fuzzy hashing](https://en.wikipedia.org/wiki/Fuzzy_hashing) with [ssdeep](https://ssdeep-project.github.io/ssdeep/index.html).

For this diff mechanisms we introduced the `-o` option. This allows the setup of a 2nd firmware. 

![image](https://github.com/e-m-b-a/emba/assets/497520/8e09ec21-e972-43a6-b656-89c9bb113516)


The 2nd firmware is usually the newer firmware version (the fixed one). Start _EMBA_ with the following options to perform the firmware diffing procedure:

```
sudo ./emba -f ~/DIR600B1_2_FW205b01.zip -o ~/DIR600B_FW206b01_FOR_Hardware_B.bin -l ~/emba_logs_dir600-diff
```
**Note:** _EMBA_ does not perform a usual firmware analysis in this mode!


## Overview of both firmware images

In diff mode _EMBA_ first gives some details of both firmware images. This is similar to the already known [P02 module](https://github.com/e-m-b-a/emba/blob/master/modules/P02_firmware_bin_file_check.sh) but for both firmware images.

### 1st firmware overview:

In the following screenshot some details of the firmware images are shown. Currently, the available details are the output of the file command, entropy analysis, checksum and a the output of the first few bytes as hexdump:

![image](https://github.com/e-m-b-a/emba/assets/497520/d682807f-29b9-49d9-b603-8221368e00a9)

### 2nd firmware overview:
![image](https://github.com/e-m-b-a/emba/assets/497520/d494f566-ebc5-4673-bf0a-0591838121fd)

## Extraction of both firmware images

For further analysis it is needed to extract both firmware images before comparing them. As usual we are using Unblob as our main extractor:

### 1st firmware extraction:
![image](https://github.com/e-m-b-a/emba/assets/497520/5f9ae6fe-591c-4583-bd20-cbaa0ddf6987)

### 2nd firmware extraction:
![image](https://github.com/e-m-b-a/emba/assets/497520/d4fbebc3-73a3-4153-bcea-543a1b7851f1)

## Fuzz diffing firmware

Finally _EMBA_ tries to find every file from the first directory/firmware als in the second extracted firmware directory. If the file is available we automatically check if it is a binary or something clear text. 

### Overview page:

The overview page is the main page of the firmware diffing results. It shows if a file is modified, if it is something kind of ascii or binary and finally it links to further results:

![image](https://github.com/e-m-b-a/emba/assets/497520/3e6cd757-8231-4bbf-a9b9-1095cae3a670)

### ASCII diffing details:
![image](https://github.com/e-m-b-a/emba/assets/497520/81fbbdc6-9b5b-4b67-b2e2-f642a6ab81be)

### Binary diffing details:
![image](https://github.com/e-m-b-a/emba/assets/497520/4e308b32-6fe4-4c2a-bfa1-8c3f07c9ae09)

![image](https://github.com/e-m-b-a/emba/assets/497520/098f6fbc-0909-4f78-8aad-2accfccdf811)

