---
title: "EMBA version 1.1.0 is out now"
description: "Version 1.1.0 - Las Vegas Edt. of EMBA is out"
date: 2022-08-01T13:37:00+02:00
authors:
  - Michael Messner
draft: false
tags:
  - EMBA
  - Blackhat
  - Release
---

![Version-1.1.0](/img/v1.1.0-LasVegas-Edt.png#center)

In August 2020 we released EMBA to the world. 21 months or 1600 commits later version 1.0.0 was available. 1856 commits later **version 1.1.0** with a huge amount of improvements and new features was released.

## Just to give you a feeling of how massive this update is
* Initial release had around **3400** lines of code
* [Version 1.0.0](https://github.com/e-m-b-a/emba/releases/tag/1.0.0-Singapore-Edt) had around **12000** lines of code
* And now, [Version 1.1.0](TODO) has more than **20000** lines of code

## New system-mode emulation environment

We have replaced the old system-mode emulation modules completely with a new and improved environment. As the system-emulation checks are not activated by default you need to use the **-Q** switch for enabling this feature. This mechanism is heavily based on the research projects [firmadyne](https://github.com/firmadyne/firmadyne) and [FirmAE](https://github.com/pr0v3rbs/FirmAE). During the re-implementation as EMBA modules it was also possible to improve the emulation results massively. 

The following benchmark shows the final results:

![System-mode-emulation](/img/System-mode-emulation-results.png#center)

For further details, the [EMBA wiki](https://github.com/e-m-b-a/emba/wiki/System-emulation) can be consulted.

## New UI and messaging system

EMBA has new console UI elements integrated. EMBA is now able to show you all needed details during the EMBA testing process:

![Console UI](/img/console_ui.png#center)

Additionally, EMBA has a new messaging system based on **inotify**. EMBA can show you relevant updates as desktop notifications:

![Desktop notifications](/img/notifications.png#center)

## Multiple new modules

As usual a huge amount of the modules (probably all) got some kind of updates and bug fixes. Additionally, the following new modules were introduced:

* P05 - [Initial extractor of different archive types via patools](https://github.com/e-m-b-a/emba/blob/master/modules/P05_patools_init.sh)
* P20 - [Foscam encrypted firmware extractor](https://github.com/e-m-b-a/emba/blob/master/modules/P20_foscam_decryptor.sh)
* P21 - [Buffalo encrypted firmware extractor](https://github.com/e-m-b-a/emba/blob/master/modules/P21_buffalo_decryptor.sh)
* S08 - [Search package management details](https://github.com/e-m-b-a/emba/blob/master/modules/S08_package_mgmt_extractor.sh)
* S99 - [Intelligent grepit module](https://github.com/e-m-b-a/emba/blob/master/modules/S99_grepit.sh)
* S109 - [Cracking identified password hashes](https://github.com/e-m-b-a/emba/blob/master/modules/S109_jtr_local_pw_cracking.sh)
