Device configuration for Unihertz Atom XL (Atom_XL)
=================================================
:warning: THIS DEVICE TREE IS NOT PRODUCTION READY :warning: 

This device tree is intended for a special useage in a TWRP or similar environment.
If you are looking for a device tree for the usage in a LineageOS or similar environment head over to https://github.com/ADeadTrousers/android_device_Unihertz_Atom_XL.

The Unihertz Atom XL (codenamed simply _"Atom_XL"_) is a rugged small smartphone from Unihertz, released in July 2020. It is similar to the Atom L but with integrated amateur radio support.

| Basic                   | Spec Sheet                                                                                                                     |
| -----------------------:|:------------------------------------------------------------------------------------------------------------------------------ |
| CPU                     | Octa-core                                                                                                                      |
| Chipset                 | Mediatek Helio P60                                                                                                             |
| GPU                     | Mali-G72 MP3                                                                                                                   |
| Memory                  | 6 GB RAM                                                                                                                       |
| Shipped Android Version | 10                                                                                                                             |
| Storage                 | 128 GB                                                                                                                         |
| Battery                 | Non-removable Li-Po 4300 mAh battery                                                                                           |
| Display                 | 1136 x 640 pixels, ~16:9 ratio (~300 ppi density)                                                                              |
| Camera (Rear - Main)    | 48MP                                                                                                                           |
| Camera (Front)          | 8MP                                                                                                                            |

## Special Thanks To

- [PeterCxy from the XDA forum](https://forum.xda-developers.com/member.php?u=5351691) for helping me and providing the device tree for Atom L.
- [The device tree for the Atom L](https://cgit.typeblog.net/android/device/unihertz/Atom_L/) which was a great step-by-step guide to complete the Atom XL.
- [SachinBorkar from the Hovatek forum](https://forum.hovatek.com/thread-27132.html) for finding a solution to get the touchpad driver working in recovery mode.

## Setting up the build environment

Because good building instructions for TWRP are very hard to come by I will try to sum up all the steps that are needed.

### Install the build packages

To successfully build TWRP, you’ll need

```bash
sudo apt-get install bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
```

For Ubuntu versions older than 16.04 (xenial), you’ll need

```bash
sudo apt-get install libwxgtk2.8-dev	
```

For Ubuntu versions older than 20.04 (focal), you’ll also need

```bash
sudo apt-get install libwxgtk3.0-dev
```

### Install the platform-tools

Only if you haven’t previously installed adb and fastboot

```bash
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
unzip platform-tools-latest-linux.zip -d ~
```

Update your PATH variable for your environment

```bash
gedit ~/.profile
```
	
Add the following
	
```bash
# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
  PATH="$HOME/platform-tools:$PATH"
fi	
```

Then update your environment

```bash
source ~/.profile
```
	
### Install the repo command

Download the binary and make it executable

```bash
mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
```
	
Update your PATH variable for your environment

```bash
gedit ~/.profile
```
	
Add the following
	
```bash
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi	
```

Then update your environment

```bash
source ~/.profile
```

### Configure git

repo requires you to identify yourself to sync Android

```bash
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```
	
### (optional) Turn on caching to speed up build

Update your build environment

```bash
gedit ~/.bashrc	
```

Add the following
	
```bash
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
export CCACHE_COMPRESS=1
```

### Initialize the TWRP source repository

Create the project folder and download the source code

```bash
mkdir -p ~/android/twrp
cd ~/android/twrp
repo init -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-10.0
```
	
Now let's add this very device repo to the local_manifest

```bash
gedit cd ~/android/twrp/.repo/local_manifests/roomservice.xml
```
	
Add the following

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="ADeadTrousers/twrp_device_Unihertz_Atom_XL" path="device/Unihertz/Atom_XL" remote="github" revision="master" />
</manifest>
```

To finish everything up sync the repo

```bash
cd ~/android/twrp
repo sync --force-sync
```

## Building the rom

Prepare the build	

```bash
cd ~/android/twrp
source build/envsetup.sh
lunch omni_Atom_XL-eng
```
	
Do the actual build
	
```bash
cd ~/android/twrp
ccache -M 50G
mka recoveryimage
```

## Updating the sorces (at a later time)

Make sure everything is up-to-date

```bash
cd ~/android/twrp
repo sync --force-sync
```

