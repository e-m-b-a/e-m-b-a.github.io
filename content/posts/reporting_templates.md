---
title: "Reporting improvements for EMBA"
date: 2022-01-26T10:42:00+01:00
draft: true
author:
  - Michael Messner
tags:
  - EMBA
  - EMBArk
  - reporting
---

We have included a template mechanism for creating better and more customised reports in EMBA. Now it is possible to place plain text template files or shell scripts to the EMBA directory _./report_templates_.
The naming of the files is quite strict. This means for the module _P11_dlink_SHRS_enc_extract.sh_ a reporting template with the name _P11_dlink_SHRS_enc_extract-post.sh_ or _P11_dlink_SHRS_enc_extract-post.txt_ is used. The ending _-pre_ is used for details printed at the beginning of the module, _-post_ includes details shown at the end of the module.
If a text file is used, this is just echoed to the cli and to the report file via the command _cat_. If instead a shell script is found, this gets included via _source_ command. With this mechanism you are able to use the full power of shell scripting in your reporting templates. Means also you can access all variables and print your own customised header/footer of the modules.

![EMBA reporting template used](/img/emba_post-reporting.png)

The structure of the template directory looks like the following:
```
report_templates
├── F10_license_summary-post.sh
├── F10_license_summary-pre.sh
├── F20_vul_aggregator-pre.sh
├── L10_system_emulator-pre.sh
├── P11_dlink_SHRS_enc_extract-post.sh
├── P11_dlink_SHRS_enc_extract-pre.sh
├── P12_avm_freetz_ng_extract-pre.sh
├── P13_uboot_mkimage-pre.sh
├── P14_ext2_mounter-pre.sh
├── P15_ubi_extractor-pre.sh
├── P16_EnGenius_decryptor-post.sh
├── P16_EnGenius_decryptor-pre.sh
├── P17_gpg_decompress-pre.sh
├── P18_qnap_decryptor-post.sh
├── P18_qnap_decryptor-pre.sh
├── S06_distribution_identification-pre.sh
└── S09_firmware_base_version_check-post.txt
```

The pre reporting templates are handled via the EMBA helper function _pre_module_reporter_ and the post reporting templates are handled via the already available helper function _module_end_log_.

The templates currently included in the installation are primarly for showing the possibilities of this new feature. We believe this is a great feature for every pentester to include the own descriptions into the EMBA reports.

Additionally, we will improve the included templates over time. If you are interested in helping improving these templates [pull requests](https://github.com/e-m-b-a/emba/pulls) are welcome.
