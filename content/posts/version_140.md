---
title: "EMBA version 1.4.0 is out now"
description: "Version 1.4.0 - ICS testing Edt. of EMBA is out"
date: 2024-03-05T11:40:48+01:00
authors:
  - Michael Messner
draft: false
tags:
  - EMBA
  - Release
---

As we do a lot of ICS/OT testing in our daily business, we thought this release should reflect our usual _EMBA_ usage scenario. Welcome to another huge _EMBA_ release with a lot new features: **EMBA v1.4.0 - ICS testing Editition**

![Version-1.4.0](/img/v1.4.0.png#center)

**This time we have collected the following highlights for you:**
* less bugs -> more code -> more bugs? -> report all our bugs [here](https://github.com/e-m-b-a/emba/issues)
* Extended binary analysis via semgrep (see module [s16](https://github.com/e-m-b-a/emba/blob/master/modules/S16_ghidra_decompile_checks.sh))
* New static perl analysis via zarn (see module [s27](https://github.com/e-m-b-a/emba/blob/master/modules/S27_perl_check.sh))
* Toolchain identification (see [wiki](https://github.com/e-m-b-a/emba/wiki/Toolchain-identification))
* Improved update checking (see [wiki](https://github.com/e-m-b-a/emba/wiki/EMBA-update))
* New scan interface (with integrated status bar) automatically enabled in most scan-profiles
* Improved multiple backend workflows
* Massive speedup of multiple EMBA modules (see https://github.com/e-m-b-a/emba/pull/1006 / https://github.com/e-m-b-a/emba/pull/996)
* Updated docker base image (see [wiki](https://github.com/e-m-b-a/emba/wiki/EMBA-update))
* You can get in contact with us on the following social networks: [X](https://twitter.com/securefirmware) / [Mastodon](https://infosec.exchange/@securefirmware) / **NEW:** [Bluesky](https://bsky.app/profile/securefirmware.bsky.social)
* We can meet in real life at BlackHat Asia this year (see [Arsenal schedule](https://www.blackhat.com/asia-24/arsenal/schedule/index.html#emba--from-firmware-to-exploit-36768))
* Special thanks to our awesome community for releasing multiple new articles around _EMBA_ - see our dedicated section in the [wiki](https://github.com/e-m-b-a/emba/wiki/Referring-sites-and-talks)
***
Now, start your fresh [Kali Linux](https://www.kali.org/get-kali/#kali-virtual-machines) ([put enough CPU power and RAM into it](https://github.com/e-m-b-a/emba/wiki/Installation#prerequisites)) and install _EMBA_:
```
└─$ git clone https://github.com/e-m-b-a/emba.git
└─$ cd emba 
└─$ sudo ./installer.sh -d
```

This will install all pre-requisites, including the docker base image and the cve database, which will need some bandwith, harddrive space and time.

Afterwards, you are ready to analyse your first firmware with _EMBA_:
```
└─$ sudo ./emba -l ~/log -f ~/firmware -p ./scan-profiles/quick-scan.emba
```
***
Beside your ongoing support with feedback, testing, working on [issues](https://github.com/e-m-b-a/emba/issues) and [spreading _EMBA_](https://github.com/e-m-b-a/emba/wiki/Referring-sites-and-talks) you can now also support _EMBA_ as a sponsor.
![image](https://user-images.githubusercontent.com/497520/213381032-3373ae80-ca0d-4b55-a28d-1fed48e62a18.png)
Check it out [here](https://github.com/sponsors/e-m-b-a) and start being an essential part of the future of _EMBA_
***

It is always a pleasure to welcome new contributors to _EMBA_. This time we can welcome:
* @413x8 made their first contribution in https://github.com/e-m-b-a/emba/pull/931
* @mj138 made their first contribution in https://github.com/e-m-b-a/emba/pull/939
* @jblu42 made their first contribution in https://github.com/e-m-b-a/emba/pull/987
* @floyd-fuh made their first contribution in https://github.com/e-m-b-a/emba/pull/1030

Welcome to the _EMBA_ firmware analysis environment and thank you for your valuable contribution.

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
* BMC firmware extractor by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/853
* braces check for all scripts inside "helpers" folder and "installer" folder by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/854
* kernel-hardening-checker fix by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/855
* Version 1.3.1 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/856
* Version identifiers, Arch check in installer, diff updates by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/860
* check braces for modules scripts by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/861
* braces checked for all script files by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/865
* shellcheck braces check in check_project and in workflow by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/866
* Improve diff mode by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/867
* Fix grep -R by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/869
* CPU check for SSSE3 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/870
* Diff threading + improved reporting by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/871
* #873 fix by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/874
* zlib string from dell bios firmware by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/872
* Create first_interaction.yml by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/877
* UEFI analysis improvements by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/876
* fwhunt check entire firmware first by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/881
* new version strings and comment for fwhunt by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/882
* integrate cveXplore settings by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/884
* Install CveXplore v0.3.16++ by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/892
* Full system emulation dependency s24 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/896
* Cvexplore integration by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/887
* switch pip install for cvexplore to git repo by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/899
* Docker-compose cleanup by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/891
* Issue 889 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/902
* L10, S05 fixes by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/903
* L23 VNC checker modules by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/904
* update first interaction by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/906
* Update check again - #908 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/909
* Make Routersploit work again by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/910
* Stick to version and check it from requests and urllib3 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/911
* Improve dep checker by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/912
* Replacement of current cve query mechanism by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/913
* Fix workflows, improve CVE identification by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/919
* rootfs check in uefi extractor by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/921
* fix install workflow by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/922
* check for versions (emba, git and docker) by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/918
* S26 module fix by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/928
* remove update scripts by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/923
* Pre templates by @413x8 in https://github.com/e-m-b-a/emba/pull/931
* Multiple fixes by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/930
* Contributors update by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/937
* update default profile for EMBArk by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/938
* Fix parsing of version number from binary version string by @mj138 in https://github.com/e-m-b-a/emba/pull/939
* Update Contributors, version by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/940
* Fix parsing of binary name from binary version string by @mj138 in https://github.com/e-m-b-a/emba/pull/942
* little cleanup by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/944
* Docker build updates for Kali 2023.4 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/945
* Include 0xdea semgrep rules and haruspex ghidra script, improve cwe-search integration by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/946
* s14 r2 startup command update by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/952
* r2 bin cache by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/953
* fix for #954 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/955
* Enable workflow dispatch by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/956
* Version bump - v1.3.2 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/957
* pip3 docker version warning by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/959
* true the docker by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/960
* remove disable shellcheck from installer folder scripts by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/941
* Support docker compose v2 API by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/961
* fix version by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/962
* copyright and exceptions linter functions by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/965
* force utf8 for htmls by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/964
* Another big update PR by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/979
* Multi grep in version detection by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/981
* Install dji firmware tools by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/988
* massive cleanup by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/989
* multi_grep_fix by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/995
* Add a few component identifications by @jblu42 in https://github.com/e-m-b-a/emba/pull/987
* GPT improvements by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/996
* BusyBox applet verification module by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1003
* Refactor variable usages by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/997
* Change component identification license to SPDXIDs by @jblu42 in https://github.com/e-m-b-a/emba/pull/998
* Speedup s09 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1006
* Drone extraction module / Silent mode by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/993
* Improve s24/s25 handling by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1011
* GCC toolchain identification by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1017
* Multiple little fixes / Enable silent mode in most profiles by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1019
* Quickfixes by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1020
* remove netgear telnet module by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1021
* Enhanced binary analysis/0day detection by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1022
* Workflow - generate VERSION.txt by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1027
* Update EMBA VERSION.txt by @github-actions in https://github.com/e-m-b-a/emba/pull/1028
* Improved EMBA update checks by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1029
* Better error message that allows knowing which issue caused the error by @floyd-fuh in https://github.com/e-m-b-a/emba/pull/1030
* Improved version checks by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1031
* little fixes by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1033
* Update EMBA VERSION.txt by @github-actions in https://github.com/e-m-b-a/emba/pull/1032
* l10 bug fixes by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1040
* Remove printing of every single log file which could take a very long… by @floyd-fuh in https://github.com/e-m-b-a/emba/pull/1042
* Multiple little fixes - make s15 work again by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1045
* Perl analysis with zarn by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1047
* fix install workflow by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1052
* identifying BMC AST2400 by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/1004
* Docker image update check by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1053
* fix version check by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1055
* Help output cleanup by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1056
* Improve module_title log by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1057
* S15 - improve variable handling by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1059
* Update kali issue template by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1060
* warning if unthreaded by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1068
* help update by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1069
* version fix by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1071
* bump version by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1072

## New Contributors
* @413x8 made their first contribution in https://github.com/e-m-b-a/emba/pull/931
* @mj138 made their first contribution in https://github.com/e-m-b-a/emba/pull/939
* @jblu42 made their first contribution in https://github.com/e-m-b-a/emba/pull/987
* @floyd-fuh made their first contribution in https://github.com/e-m-b-a/emba/pull/1030

**Full Changelog**: https://github.com/e-m-b-a/emba/compare/1.3.0-AI-for-EMBA...1.4.0-ICS-testing-edt

