---
title: "Qnap decryptor module"
description: "EMBA got a new module for decrypting QNAP firmware files."
date: 2022-01-15T16:21:53+01:00
draft: false
tags: extractor, encrypted, qnap
---

On my last pentest I had a QNAP storage firmware in front of me. After starting EMBA with the default profile I realised that EMBA was not able to extract the needed firmware files. After some digging and research I found that the firmware update files from the [download site](https://www.qnap.com/de-de/download?model=ts-453bu-rp&category=firmware) are somehow encrypted. Additionally Binwalk was able to give a hint on it:

![QNAP_decrypt_binwalk](/img/qnap-decrypt-binwalk.png)

This was the good. The bad is, that binwalk was not able to extract the firmware. This means we started with some recon.
First I found the interesting project [qnap-utils](https://github.com/max-boehm/qnap-utils) which should be able to unpack firmware images. In [issue 1](https://github.com/max-boehm/qnap-utils/issues/1) the source code of a working version of the needed PC1 tool was linked. After compiling it on my current Kali linux machine I was able to extract a tgz file from the update image.

![QNAP_decrypt](/img/qnap-decrypt.png)

