---
title: "QNAP firmware extractor module - from 0 to full firmware analysis"
description: "EMBA got a new module for decrypting and extracting QNAP firmware files."
authors:
  - Michael Messner
date: 2022-01-23T15:21:53+01:00
draft: true
tags:
  - extractor
  - encrypted
  - qnap
  - EMBA
---

On one of our last penetration tests we had a QNAP device in front of us. While we started investigating the device via the network, we also wanted to use our firmware scanner [EMBA](https://github.com/e-m-b-a/emba) for the firmware analysis tasks. The firmware was available from the QNAP download site and starting EMBA with the default profile looks like a quick win. After a while we realised that EMBA was running into the deep-extraction mode and finally failed extracting the needed firmware. 
The initial check on a not extracted firmware is typically the entropy value:

![QNAP_entropy_binwalk](/img/qnap-entropy_binwalk.png)

An entropy value of straight 1 typically means it is compressed or encrypted. After some digging and research we identified that the firmware update files from the [download site](https://www.qnap.com/de-de/download?model=ts-453bu-rp&category=firmware) are somehow encrypted. Additionally, Binwalk was able to give another hint on it:

![QNAP_decrypt_binwalk](/img/qnap-decrypt-binwalk.png)

This was the good. The bad was, that binwalk was not able to extract the firmware. Thehis means we had to start with some recon work.
First, we found the interesting project [qnap-utils](https://github.com/max-boehm/qnap-utils) which should be able to decrypt QNAP firmware images. In [issue 1](https://github.com/max-boehm/qnap-utils/issues/1) the source code of a working version of the needed _PC1_ tool was linked. After compiling it on a current Kali Linux machine we were able to extract a _tgz_ archive from the update image.

![QNAP_decrypt](/img/qnap-decrypt.png)

We wrote a quick [EMBA module](https://github.com/m-1-k-3/emba/blob/1ab85357c2960b7ae449df3ee114995c09995a10/modules/P18_qnap_decryptor.sh) for the decryption and everything should be good to go.
We designed it in a way to identify the QNAP encrypted firmware via binwalk and place the PC1 binary for decryption to the _./external_ folder. On a user installation this is done by the EMBA installer and so the module just needs to execute this binary with the correct set of parameters.

After updating our docker container we were ready for the first run. The firmware got decrypted and during the deep-extraction a lot of filesystem areas where extracted. As EMBA is doing a lot of tests on a firmware our first scan took quite a while. After finishing the testing EMBA has identified around 50 identified software components with version details and a lot of other interesting stuff like the used binary protections and weak binary functions.

![QNAP_binary_functions](/img/qnap-binary-fct.png)

During our deep investigation of the results, we realized that most of these results were based on our [static analysis module - s09](https://github.com/e-m-b-a/emba/blob/master/modules/S09_firmware_base_version_check.sh). This also means that the very powerful version detection via dynamic analysis was mostly failing.
With this in mind our investigation on how to improve the results started.
First issue we identified during checking the project [qnap-utils](https://github.com/max-boehm/qnap-utils) was that the extracted filesystem we generated with our deep-extraction mode was there but it was very messy. This was not a problem for all the static analysis mechanisms, but for dynamic analysis with qemu it was a blocker (at this time). To get a better filesystem we ported the code from the [extract_qnap_fw.sh script]( https://github.com/max-boehm/qnap-utils/blob/master/extract_qnap_fw.sh) and implemented it into the QNAP decryption module as [additional extractor]( https://github.com/m-1-k-3/emba/blob/186fc6d6b7c1915ca2f89b3190ec20a6f3525461/modules/P18_qnap_decryptor.sh) for QNAP firmware. As the original code was a bash script it was quite easy to port it to EMBA and do some cleanup to make it shellcheck compatible. 

Another issue we identified was the problem that the emulator was not able to recover needed stuff from the extracted data. We will take a deeper look at this in a following blog post.
After all these modifications EMBA was finally able to identify 94 software components with version details:

![QNAP_software_components](/img/qnap-components.png)
