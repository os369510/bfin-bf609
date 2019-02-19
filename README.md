## Usage
```
docker pull os369510/bfin-bf609
git clone https://github.com/os369510/bfin-bf609.git
bash docker-run.sh docker os369510/bfin-bf609
git clone https://git.code.sf.net/p/adi-buildroot/code adi-buildroot-code -b 2014R1
git clone https://git.code.sf.net/p/adi-linux/code adi-buildroot/linux/linux-kernel -b 2014R1
make bf609-ezkit_config
make
```
## Fix building buildroot failure
**1. Unescaped left brace in regex is illegal here in regex; marked by <-- HERE in m/\${ <-- HERE ([^ \t=:+{}]+)}/ at /home/jeremysu/adi-buildroot-code/output/host/usr/bin/automake line 4159.**  
  
Ans:  
replace '{' by "\{" within "adi-buildroot-code/output/host/usr/bin/automake"
---
**2. Building ncurses failed, log shows:**  
  
```
In file included from ../ncurses/curses.priv.h:283:0,
                 from ../ncurses/lib_gen.c:19:
_32530.c:835:15: error: expected ')' before 'int'
```
[Modification for fixing](https://github.com/pbouda/buildroot-qt-dev/issues/6)  
---
**3. Building lzo failed, log shows:**  
  
```
checking whether to build assembly versions... no
checking whether your compiler passes the ACC conformance test... FAILED
```
[Modification for fixing](https://community.nxp.com/thread/457348)  
---
**4. Building host-mtd 1.5.0 failed**  
```
Ans:
1. mark '__USE_XOPEN2K' and corresponding #endif within /usr/include/netdb.h
2. remove 'extern' from "host-mtd-1.5.0/mkfs.ubifs/hashtable/hashtable_itr.h"
```
---

## Customize configuration and Enablement
- [Configure and build buildroot](https://blackfin.uclinux.org/doku.php?id=buildroot:build-system:build_a_target)  
- [Enable WVGA/LCD](https://blackfin.uclinux.org/doku.php?id=video_loop_back&s[]=wvga&s[]=lcd)  
- [Not found 'Encoders, decoders, sensors and other helper chips'](https://forum.armbian.com/topic/151-how-to-activate-device-drivers-multimedia-support-encoders-decoders-sensors-and-other-helper-chipsvideo_saa711x/)  
- Modify 'include/configs/bf609-ezkit.h' for customizing u-boot  

## Reference
### Documents
- [Analog Devices Open Source Projects For Blackfin Processors](https://blackfin.uclinux.org)  
- [adsp-bf609-ezkit-manual](https://www.analog.com/media/en/dsp-documentation/evaluation-kit-manuals/adsp-bf609_ezkit_manual.pdf)  
- [WVGA/LCD EI3 Extender Board Manual](https://www.analog.com/media/en/dsp-documentation/evaluation-kit-manuals/wvgalcd_ei3_extender_man_rev.1.0.pdf)  
- [Video Decoder EI3 Extender Board Manual](https://www.analog.com/media/en/dsp-documentation/evaluation-kit-manuals/video_decoder_ei3_extender_man_rev.1.1.pdf)  
### Problems has been solved
- [uImage is useless because of below, solution is use 4.3 toolchain instead of](https://ez.analog.com/dsp/software-and-development-tools/linux-blackfin/f/q-a/69007/bf609-uclinux-booting-fails/86228#86228)  
```
Ack! Something bad happened to the Blackfin!
...
kgdb: handle_exception; trap [0x4]
```
### Online helper
- [Blackfin Linux destribution for Q&A](https://ez.analog.com/dsp/software-and-development-tools/linux-blackfin/)  
### Booting with Blackfin
- [Booting method](https://blackfin.uclinux.org/doku.php?id=bootloaders:u-boot:booting_methods)  
- [Boot mode](https://blackfin.uclinux.org/doku.php?id=bootloaders:bootrom#boot_modes)  
- [Blackfin boot process](https://blackfin.uclinux.org/doku.php?id=bootloaders)  
### U-boot
- [Testing](https://blackfin.uclinux.org/doku.php?id=bootloaders:u-boot:testing)  
- [Customize uboot](http://pominglee.blogspot.com/2016/12/u-boot-2016.html)  
- [Boot from SD card](https://www.96boards.org/blog/boot-linux-from-sd-card-uboot/)  
### Buildroot
- [Build system overview](https://blackfin.uclinux.org/doku.php?id=buildroot:build-system)  
### Blackfin on Linux
- [Blackfin linux feature (incomplete)](https://blackfin.uclinux.org/doku.php?id=uclinux-dist:features)  
