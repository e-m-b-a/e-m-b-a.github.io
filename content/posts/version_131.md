---
title: "EMBA version 1.3.1 is out now"
date: 2023-11-07T09:53:24+01:00
authors:
  - Michael Messner
draft: false
tags:
  - EMBA
  - Release
---


What happened since the last _EMBA_ release?

There was the absolute great #Hackersummercamp with our talks at BSidesLV, ICS Village (DEF CON) and Black Hat (Arsenal). The recording of the BSides talk is already available [here]( https://youtu.be/8sXyRv21jPY?si=J9H3HK_5KX75Fk4C). Beside this, Nate did a really great talk at BruCON – see [here](https://youtu.be/qCgfr7pOkWc?si=bLjxBi3TLc9tEDDi).

Beside a lot of code cleanup, bug fixing and some little improvements the new [firmware diffing](https://github.com/e-m-b-a/emba/wiki/Firmware-diffing) mode is one of the highlights in version 1.3.1. 
In 1 day bug hunting, exploit development and the identification of silent patching it is quite common to identify the differences between two firmware releases.
To use this new feature (as usual in a very early alpha state) it is now possible to define a second firmware with the `-o` parameter. _EMBA_ starts with some basic analysis of both firmware images, extracts both images and finds the differences between these firmware images:

![image](https://user-images.githubusercontent.com/497520/271657185-3e6cd757-8231-4bbf-a9b9-1095cae3a670.png)

If the file is some ASCII file a nice diff is shown:

![image](https://user-images.githubusercontent.com/497520/271658062-81fbbdc6-9b5b-4b67-b2e2-f642a6ab81be.png)

If the file is a binary file we use [radare2](https://book.rada.re/tools/radiff2/binary_diffing.html) for further analysis:

![image](https://user-images.githubusercontent.com/497520/271658473-098f6fbc-0909-4f78-8aad-2accfccdf811.png)

For further details check our [Wiki](https://github.com/e-m-b-a/emba/wiki/Firmware-diffing)

Happy bug hunting :)

***
Beside your ongoing support with feedback, testing, working on [issues](https://github.com/e-m-b-a/emba/issues) and [spreading _EMBA_](https://github.com/e-m-b-a/emba/wiki/Referring-sites-and-talks) you can now also support _EMBA_ as a sponsor.
![image](https://user-images.githubusercontent.com/497520/213381032-3373ae80-ca0d-4b55-a28d-1fed48e62a18.png)
Check it out [here](https://github.com/sponsors/e-m-b-a) and start being an essential part of the future of _EMBA_
***

## What's Changed
* Internet check not blocking by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/722
* Fix docker build workflow by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/723
* disable disk space monitor by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/724
* print fix, http crawler by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/732
* Code cleanup by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/733
* Fix updater by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/749
* Unblob v23.8.11 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/750
* PEM file with multiple certificates by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/736
* Update README.md by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/757
* add file-command to default deps by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/763
* Update semgrep workflow by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/764
* Debian repos - https only for Kali by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/766
* Curl online check by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/774
* Improve PW cracking module s107 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/773
* Check container nr disable for dev mode by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/776
* Set variable by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/777
* Installer updates by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/779
* fix gpt path by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/789
* Improve web page crawler by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/795
* little fix by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/796
* disable the trickest exploit db by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/797
* Debian installer support by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/798
* grep -v -> tail by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/812
* Proxy support by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/811
* Firmware diffing preparation by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/804
* nikto setup, compose cleanup by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/814
* System emulation fs mount improvements by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/815
* L10 Fix SC2250 shellcheck by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/822
* Installer debian package file format by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/826
* Cleanup of PS crawler by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/833
* Check for arachni user and shellcheck braces by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/834
* Try cve db update multiple times during installation by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/837
* Firmware diffing modules by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/838
* fix #839 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/844
* Semgrep checks and shellcheck braces checks by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/835
* check for space at the end of a line by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/845
* Update installer, dep-check by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/846
* strict mode grep error by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/848
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/852
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/851
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/850
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/849
* BMC firmware extractor by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/853
* braces check for all scripts inside "helpers" folder and "installer" folder by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/854
* kernel-hardening-checker fix by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/855
* Version 1.3.1 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/856


**Full Changelog**: https://github.com/e-m-b-a/emba/compare/1.3.0-AI-for-EMBA...1.3.1-diff-all-the-firmwares
