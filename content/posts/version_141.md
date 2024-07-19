---
title: "EMBA version 1.4.1 is out now"
description: "Version 1.4.1 - Follow the white rabbit"
date: 2024-07-17T11:40:48+01:00
authors:
  - Michael Messner
draft: false
tags:
  - EMBA
  - Release
---

Probably you all know that it is the 25th anniversary of the legendary Matrix movie! With the latest release EMBA got massive improvements in building the Matrix via emulation.

![image](https://github.com/e-m-b-a/emba/assets/497520/619e64c2-9adc-438e-a5cf-4cbb484dec72)

This release reflects the recent updates in our system emulation engine.

Short summary of the latest highlights:
* We started rebuilding and upgrading the toolchain of the system emulation engine - With the current work in place we can further update the outdated [FirmAE](https://github.com/pr0v3rbs/FirmAE) and [firmadyne](https://github.com/firmadyne/firmadyne) environment which our emulation engine is originally based on
* Linux kernel upgraded from version [4.1.17](https://github.com/EMBA-support-repos/EMBA_emulation_kernel-v4.1.17) (the original firmadyne and FirmAE version) to version [4.1.52](https://github.com/EMBA-support-repos/EMBA_emulation_kernel-v4.1.52) - The original firmadyne kernel is from 01/2016 and a bit rusty. With the update to 4.1.52 (which is from 05/2018) we moved forward in time for more than 2 years. In the future we plan further updates to include more modern kernels.
* Busybox updated from 1.29.3 to the current version 1.36.1
* Multiple libnvram patches were merged from the [rehosting repo of libnvram](https://github.com/rehosting/libnvram) which is maintained primarly by @AndrewFasano
* Including an optional netcat listener to the system emulation engine
* Further debugging possibilities via strace, gdb and gdbserver added to the system emulation engine
* Handling of time64/time32 support in firmware via updated [musl libc](https://musl.libc.org/releases.html) for libnvram - This hopefully results in an improved handling on more modern firmware
* Improved environment for ARM64 and MIPS64 architecture
* FIRST EPSS (Exploit Prediction Scoring System) integration - see https://github.com/e-m-b-a/emba/pull/1109
* Updated docker base image to [Kali 2024-2](https://www.kali.org/blog/kali-linux-2024-2-release/)
* @gluesmith2021 fixed multiple bugs in our version detection and CVE engine - see [here](https://github.com/e-m-b-a/emba/pulls?q=is%3Apr+author%3Agluesmith2021)

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
* @gluesmith2021 made their first contribution in https://github.com/e-m-b-a/emba/pull/1150

## What's Changed
* #1073 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1076
* restart EMBA functionality by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1078
* make the quick mode quick by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1081
* Make the updater work again by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1082
* fix hardening log for s16 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1084
* Quick version identifier update by @github-actions in https://github.com/e-m-b-a/emba/pull/1089
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1087
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1088
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1090
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1091
* fix day cnt by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1085
* fix for Spurious linux_kernel CVEs, cpe string handling by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1086
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1094
* full names and working tagging for packetstorm script by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/1061
* add md5sum to binaries by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1096
* installer srecord by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1097
* Firmware/binary handling again by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1099
* little fixes by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1102
* Quick version identifier update by @github-actions in https://github.com/e-m-b-a/emba/pull/1105
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1104
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1103
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1107
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1106
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1113
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1111
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1110
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1112
* xz backdoor detection - CVE-2024-3094 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1114
* FIRST EPSS (Exploit Prediction Scoring System) integration by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1109
* Workflow docker builder updates by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1115
* Remove Arachni / refactoring by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1117
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1122
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1120
* csv issues #1116 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1118
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1119
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1121
* csv issues #1116 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1123
* f10 csv fix by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1124
* Vars check by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1126
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1128
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1129
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1131
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1130
* further vars cleanup, kev in f20 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1127
* var cleanup, status_bar fix by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1132
* S36 updates, l10 fixes by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1133
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1135
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1137
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1134
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1136
* Emulation updates by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1140
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1144
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1142
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1141
* s115 qemu command output by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1145
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1143
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1149
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1147
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1146
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1148
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1151
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1153
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1152
* Version string fixes for isc:dhcp and gnu:glibc by @gluesmith2021 in https://github.com/e-m-b-a/emba/pull/1150
* Update default-scan-no-notify.emba by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/1156
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1161
* Quick version identifier update by @github-actions in https://github.com/e-m-b-a/emba/pull/1160
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1158
* fix zlib (unzip) version string by @gluesmith2021 in https://github.com/e-m-b-a/emba/pull/1164
* JTR hash sorting by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/1154
* Dhcp version strings and blacklist fix by @gluesmith2021 in https://github.com/e-m-b-a/emba/pull/1163
* f20 cpe handling #1155 by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1166
* MODULE_BLACKLIST array handling by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1168
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1170
* Quick version identifier update by @github-actions in https://github.com/e-m-b-a/emba/pull/1171
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1169
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1172
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1173
* improve not on YARA settings by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1176
* F20 CVE version range checking: fix and dead code removal by @gluesmith2021 in https://github.com/e-m-b-a/emba/pull/1165
* Less regex / f20 and s21 wording by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1177
* Update unblob and binwalk installer by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1178
* System emulation updates by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1157
* Revert "System emulation updates" by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1179
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1181
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1182
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1185
* Quick version identifier update by @github-actions in https://github.com/e-m-b-a/emba/pull/1184
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1191
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1190
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1189
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1188
* System emulator updates by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1180
* Snyk script improved by @HoxhaEndri in https://github.com/e-m-b-a/emba/pull/1186
* System emulation updates by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1193
* Metasploit database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1194
* CISA known exploited database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1195
* Quick version identifier update by @github-actions in https://github.com/e-m-b-a/emba/pull/1196
* Packetstorm database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1198
* System emulation updates by @m-1-k-3 in https://github.com/e-m-b-a/emba/pull/1199
* Snyk database update by @github-actions in https://github.com/e-m-b-a/emba/pull/1197
* Update README.md by @BenediktMKuehne in https://github.com/e-m-b-a/emba/pull/1200

## New Contributors
* @gluesmith2021 made their first contribution in https://github.com/e-m-b-a/emba/pull/1150

**Full Changelog**: https://github.com/e-m-b-a/emba/compare/1.4.0-ICS-testing-edt...1.4.1-white-rabbit
