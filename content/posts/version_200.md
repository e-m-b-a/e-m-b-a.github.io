---
title: "EMBA version 2.0.0 is out now"
description: "Version 2.0.0 - A brave new world of firmware analysis"
date: 2025-12-16T09:58:37+01:00
authors:
  - Michael Messner
draft: false
tags:
  - EMBA
  - Release
---

The last few weeks looked a bit more silent to the outside ... but cool things were going on in the background. Now, it is time to share all the great things we were working on ;)

![image](https://github.com/user-attachments/assets/4741a0e4-9be8-4d77-8401-abc430721f4d)

In the early days of the _EMBA_ firmware analysis environment one of our visions was a bit like the following:

*EMBA should be an environment for fully automated detection and verification of known and unknown vulnerabilities in the product and firmware sector*

The complete environment needs to be available as _Open-Source_ which allows you to be part of it. Everyone should be able to perform high quality firmware security analysis, perform better IoT penetration tests, create the best SBOMs, scale and optimize firmware security research at all. Additionally, everyone should be able to modify, integrate and adopt _EMBA_ easily (btw. this is the reason why we decided to use Bash), improve _EMBA_ and being part of _EMBA_ as user, tester, developer, feedback giver, idea generator, bug hunter ... you get the idea of Open-Source ;)

Vulnerability analysis in the field of firmware is a complex task, but with _EMBA_ we have built some quite solid tooling and strategies over the years. This would not be possible without all the other awesome Open-Source projects out there!

*EMBA is standing on the shoulders of giants. EMBA is standing on your shoulders! Thank you!*

We were always fascinated by the idea of automatically starting up the device during an _EMBA_ analysis in a controlled emulated environment. This means that we will be able to verify the already discovered results directly on the running firmware. We are not at the end of this journey yet, but it looks like this goal is not completely unrealistic anymore! In our opinion this release is a milestone to our ultimate goal of vulnerability detection and verification.

The road to _version 2.0.0_ was very rough and bumpy. Over the last few months we tested, tested, tested, looked at emulation output and improved every little piece a little bit! The goal we had in mind was ...

*Let's bring our system emulation engine to the next level*

After months of testing, building kernels (shoutout to @HoxhaEndri), analyzing, fixing, refactoring, testing again and screaming multiple times we are now quite happy with the results! Enjoy the following benchmark results of some of our firmware test sets:

_Read on on [Github.com](https://github.com/e-m-b-a/emba/releases)_
