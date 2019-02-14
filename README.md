## Reference:
Analog Devices Open Source Projects For Blackfin Processors
https://blackfin.uclinux.org/

adsp-bf609-ezkit-manual
https://www.analog.com/media/en/dsp-documentation/evaluation-kit-manuals/adsp-bf609_ezkit_manual.pdf

Please use 4.3 toolchain
https://ez.analog.com/dsp/software-and-development-tools/linux-blackfin/f/q-a/69007/bf609-uclinux-booting-fails/86228#86228

Customize u-boot config
include/configs/bf609-ezkit.h

Buildroot will needs some modification to fix build errors

1. Use buildroot.config as .config
This config is base on bf609-ezkit_config and then remove some deprecated
packages

2. Unescaped left brace in regex is illegal here in regex; marked by <-- HERE in m/\${ <-- HERE ([^ \t=:+{}]+)}/ at /home/jeremysu/adi-buildroot-code/output/host/usr/bin/automake line 4159.
Fix: use "\{" instead of "{"

3. ncurses build fail, log shows:
---
In file included from ../ncurses/curses.priv.h:283:0,
                 from ../ncurses/lib_gen.c:19:
_32530.c:835:15: error: expected ')' before 'int'
---
Reference:
https://github.com/pbouda/buildroot-qt-dev/issues/6

4. lzo build fail, log shows:
---
checking whether to build assembly versions... no
checking whether your compiler passes the ACC conformance test... FAILED
---
Reference:
https://community.nxp.com/thread/457348

5. host-mtd 1.5.0 build fail
5.1 mark '__USE_XOPEN2K' and corresponding #endif within /usr/include/netdb.h
5.2 remove 'extern' from "host-mtd-1.5.0/mkfs.ubifs/hashtable/hashtable_itr.h"
