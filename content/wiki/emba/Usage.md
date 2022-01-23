---
title: Usage.md
draft: false
---


[Back to wiki menu]({{< ref "/wiki/emba" >}} "wiki menu")

## Classic

Before running *EMBA* make sure that you have [installed](https://github.com/e-m-b-a/emba/wiki/Installation#docker-installation) all dependencies.

### Static firmware testing
- Execute *EMBA* with set parameters, e.g.   
  ```console
  sudo ./emba.sh -l ./log -f ./firmware
  ```  
- Path for logs and firmware path are necessary for testing a firmware image.
- You can specify multiple [arguments](https://github.com/e-m-b-a/emba/wiki/Usage#arguments).

### Test kernel config
- Test only a kernel configuration with the kernel checker of [*checksec*](https://github.com/slimm609/checksec.sh):   
  ```console
  sudo ./emba.sh -l ./logs/kernel_conf -k ./kernel.config
  ```
- If you add `-f ./firmware`, it will ignore `-k` and search for a kernel config inside the firmware
- You can specify some [arguments](https://github.com/e-m-b-a/emba/wiki/Usage#arguments).

**Good to know:**
- `sudo` is necessary for some modules to run properly, e.g. `S115_usermode_emulator.sh`
- Currently only tested on [*Kali Linux*](https://kali.org/downloads) (2021.02)
- *EMBA* needs quite a lot of free disk space for logging
- *EMBA* currently supports the following architectures: MIPS, ARM, PPC, x86 and x64

## Docker

There is a simple *docker-compose* setup added, which allows you to run *EMBA* in a docker container.

Run interactive docker container:   
```console
FIRMWARE=/absolute/path/to/firmware LOG=/home/n/firmware_log/ docker-compose run emba
```
This will drop you a shell in the folder where *EMBA* has been added. The firmware is located at `/firmware` and the log directory at `/log`.   
```console
./emba.sh -l /log -f /firmware -i
```

*EMBA* will do the work for you fully automatically:  
```console
sudo ./emba.sh -l ./log -f /firmware
```
- You can specify some [arguments](https://github.com/e-m-b-a/emba/wiki/Usage#arguments).

Limitations: \
~~- *CWE-Checker* and *FACT-extractor* are currently used as separate docker containers (see https://github.com/e-m-b-a/emba/issues/70)~~
- *CVE-Search* needs the database exposed by the host

## Arguments

Print the possible command line options with 
```console
./emba.sh -h
```

```
Test firmware
-a [MIPS]         Architecture of the linux firmware [MIPS, ARM, x86, x64, PPC]
-A [MIPS]         Force Architecture of the linux firmware [MIPS, ARM, x86, x64, PPC] (disable architecture check)
-l [./path]       Log path
-f [./path]       Firmware path
-e [./path]       Exclude paths from testing (multiple usage possible)
-m [MODULE_NO.]   Test only with set modules [e.g. -m p05 -m s10 ... or -m p to run all p modules]
                  (multiple usage possible, case insensitive, final modules aren't selectable, if firmware isn't a binary, the p modules won't run)
-c                Enable cwe-checker
-g                Create grep-able log file in [log_path]/fw_grep.log
                  Schematic: MESSAGE_TYPE;MODULE_NUMBER;SUB_MODULE_NUMBER;MESSAGE
-E                Enables automated qemu emulation tests (WARNING this module could harm your host!)
-D                Developer mode - EMBA runs on the host without container protection
-i                Ignores log path check
-p [PROFILE]      Emba starts with a pre-defined profile (stored in ./scan-profiles)

Web reporter
-W                Activates web report creation in log path (overwrites -z)

Dependency check
-d                Only checks dependencies
-F                Checks dependencies but ignore errors

Special tests
-k [./config]     Kernel config path
-x                Enable deep extraction - try to extract every file two times with binwalk (WARNING: Uses a lot of disk space)
-t                Activate multi threading (destroys regular console output)
-o                Activate online checks (e.g. upload and test with VirusTotal)
-r                Remove temporary firmware directory after testing

Modify output
-s                Prints only relative paths
-z                Adds ANSI color codes to log
-M                MATRIX mode (Warning: CPU intense)

Firmware details
-X [version]      Firmware version (double quote your input)
-Y [vendor]       Firmware vendor (double quote your input)
-Z [device]       Device (double quote your input)
-N [notes]        Testing notes (double quote your input)

Help
-h                Prints this help message
```

## Live systems *(Not officially supported)*

For testing a live system with *EMBA*, run it as if you were testing static firmware, but with `/` as firmware path:
```console
./emba.sh -l ./log -f /
```

- Path for logs and firmware path are necessary for *EMBA*.
- It improves output and performance, if you exclude docker with the `-e` switch:   
  ```console
  ./emba.sh -l ./log -f / -e /var/lib/docker
  ```

[Back to wiki menu]({{< ref "/wiki/emba" >}} "wiki menu")

