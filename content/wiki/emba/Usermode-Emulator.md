**Warning:** Currently this is an experimental module, and you need to activate it manually with the _-E_ switch.

**Warning:** *EMBA* needs root privileges for running in emulation mode.

The idea behind the emulator is to run the identified binaries with different command line options like `-V`, `-v`, `--version`, `--help` in a simple chroot environment. After the identification of the binary architecture, it is possible to choose the correct [*qemu*](https://www.qemu.org/) emulator. Afterwards the binary gets executed with the static compiled *qemu* emulator in tracing mode (`--strace`). If there are some files missing, they are searched through the firmware filesystem and copied to the missing location. If nothing is found, then an empty file is created.
Finally, the binary gets executed in a chroot environment with the right emulator and the generated output is stored in a log file for further processing. 
 
For example, the output of the binary *busybox* looks like the following:

[[images/s115_busybox.png]]
 
With the version detection strings from `config/bin_version_strings.cfg`, it is possible to identify different binary versions from the generated log files:

[[images/s115_usermode_emulator.png]]
 
**Hint:** If there are some version identification strings missing, it is easy to include them in the `config/bin_version_strings.cfg` configuration file. The next time you run *emba* they will be identified correctly. **Do not forget to make a pull request with the new version identifier.**

**Installation:** To use the emulation module, the installer of *emba* should be run.

**Typical problems:**
- **Versions are not identified:**   
  Check the version configuration file and include the needed version identifier.
- **Host reboots during emulation:**   
  Check the log file `s115_usermode_emulator.txt` for the last emulated process:   
  `[*] Initial strace run on the command XYZ to identify missing areas`
  If the last line is something like the one shown above, then this binary probably reboots or crashes your host. Include this binary in the blacklist (`config/emulation_blacklist.cfg`)
- **A wrong emulation root directory is identified:**   
  On every emulation process, the identified root directory is shown with the following output:
  ```
  [*] Root directory detection via interpreter ... /LOG_PATH/wrong-root-directory-identified
  [*] Using the following path as emulation root path: /LOG_PATH/wrong-root-directory-identified
  ```
  If *EMBA* fails in the detection of the correct root directory, open an issue [here](https://github.com/e-m-b-a/emba/issues).

**Run *EMBA* with emulation mode activated:**

`sudo ./emba.sh -z -l ./logs_mips_router -f ../testimages/MIPS_router -E`



