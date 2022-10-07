---
title: "EMBA version 1.1.2 is out now"
description: "Version 1.1.2 - Knight Rider Edt. of EMBA is out"
date: 2022-10-06T13:37:00+02:00
authors:
  - Michael Messner
draft: false
tags:
  - EMBA
  - Release
---

*Bonnie:* I have a new feature integrated into K.I.T.T. \
*Michael:* Give me more details \
*K.I.T.T.:* With my new friend EMBA I am able to find the weak spot in every firmware.

40 years later ... K.I.T.T. is definitive able to analyze firmware with EMBA

![Version-1.1.2](/img/v1.1.2-KnightRider-Edt.png#center)

Beside bug fixes this release introduces many new features. Since version 1.1.1 we introduced several new features and multiple improved areas:

* Thx to @nuschpl the Installer supports non-english systems (see https://github.com/e-m-b-a/emba/pull/296)
* NIOS2 architecture support (see https://github.com/e-m-b-a/emba/pull/306)
* Semgrep introduction into bash checking module [S20](https://github.com/e-m-b-a/emba/blob/312bd12bbcf2149e74d5aea9c57872d4c40495ff/modules/S20_shell_check.sh#L81) (see https://github.com/e-m-b-a/emba/pull/321)
* Module, CVE blacklisting (see https://github.com/e-m-b-a/emba/issues/305 and https://github.com/e-m-b-a/emba/pull/317)
* Deep extractor improvements and module split (P59 and P60) (see https://github.com/e-m-b-a/emba/pull/326)
* Zyxel extractor as [P22](https://github.com/e-m-b-a/emba/blob/master/modules/P22_Zyxel_zip_decrypt.sh) (see https://github.com/e-m-b-a/emba/pull/316 and [DC30 Slides](https://media.defcon.org/DEF%20CON%2030/DEF%20CON%2030%20presentations/Jay%20Lagorio%20-%20Tear%20Down%20this%20Zywall%20Breaking%20Open%20Zyxel%20Encrypted%20Firmware.pdf))
* Respect docker user group (see https://github.com/e-m-b-a/emba/pull/324)
* Initial unblob integration as evaluation module [P61](https://github.com/e-m-b-a/emba/blob/master/modules/P61_unblob_eval.sh) (see https://github.com/e-m-b-a/emba/pull/306)

As usual you can find the latest version at [github](https://github.com/e-m-b-a/emba)
