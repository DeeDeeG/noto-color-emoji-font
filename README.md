# Noto Color Emoji SVGinOT Font

Major credit to eosrei (and various other contributors). This is a lightly modified version of his [`twemoji-color-font`][1] repo.

(Legal note: he has not commented on this project, to my knowledge, and my crediting him does not imply his endorsement. /legalese)

This older release of Noto Color Emoji is the most recent release Google has provided in SVG format. SVGs were required in order to use eosrei's tools. (On the bright side, some people were sad to see gender-neutral emojis removed from Google's Noto Emoji font recently. This older release includes them! Glorious and blobby.)

## Intro

This is a somewhat retro-feeling color and B&W emoji SVGinOT font, built from an older version of the [Noto Color Emoji][2] artwork with support for limited [ZWJ][3] sequences (all unicode 7.0 and other recent glyphs are missing at the moment), [skin tone diversity][4] (maybe, someday?) and [country flags][5] (not all flags supported).

This is essentially a recreation of the font from [Lollipop][6], minus most of the regional flags.

The font works in all operating systems, but will *currently* only show color
emoji in Firefox, Thunderbird, Photoshop CC 2017, and Windows Edge V38.14393+.
This is not a limitation of the font, but of the operating systems and
applications. Regular B&W outline emoji are included for backwards/fallback
compatibility.

[Do you prefer EmojiOne graphics?][7] (repo by eosrei and various contributors)

[1]: https://github.com/eosrei/twemoji-color-font
[2]: https://github.com/googlei18n/noto-emoji
[3]: http://unicode.org/emoji/charts/emoji-zwj-sequences.html
[4]: http://www.unicode.org/reports/tr51/#Diversity
[5]: http://www.unicode.org/reports/tr51/#Flags
[6]: https://emojipedia.org/google/android-5.0/
[7]: https://github.com/eosrei/emojione-color-font

## Table of Contents

* [Examples](#examples)
* [What is SVGinOT?](#what-is-svginot)
* [Install on Linux](#install-on-linux)
* [Install on OS X](#install-on-os-x)
* [Install on Windows](#install-on-windows)
* [Building](#building)
* [License](#license)

## Examples

Demo in Firefox on Linux.
![Firefox color emoji in Linux](images/notocoloremoji-font-demo.png?raw=true)

## What is SVGinOT?
*SVG in Open Type* is a standard by Adobe and Mozilla for color OpenType
and Open Font Format fonts. It allows font creators to embed complete SVG files
within a font enabling full color and even animations. There are more details
in the [SVGinOT proposal][8] and the [OpenType SVG table specifications][9].

SVGinOT Font demos (Firefox only):

* https://hacks.mozilla.org/2014/10/svg-colors-in-opentype-fonts/
* http://xerographer.github.io/reinebow/
* http://xerographer.github.io/multicoloure/

[8]: https://www.w3.org/2013/10/SVG_in_OpenType/
[9]: https://www.microsoft.com/typography/otspec/svg.htm

## Install on Linux
The font can be installed for a user or system-wide. Get the latest version
from releases: https://github.com/DeeDeeG/noto-color-emoji-font/releases

*Note: This requires `Bitstream Vera` is installed and will change your
systems default serif, sans-serif and monospace fonts.*

### Why Bitstream Vera
The default serif, sans-serif and monospace font for most Linux distributions is
`DejaVu`. `DejaVu` includes a wide range of symbols which override the
color emoji characters. The previous solution was to make `EmojiOne Color` the default system font, but that causes a number of issues.
A better solution is a different font that doesn't override any emoji characters
such as `Bitstream Vera`. `Bitstream Vera` is the source of the glyphs used in
`DejaVu`, so it's not very different. 99%+ of people will not notice the
difference.

### Additional default font options
The `Noto Sans`/`Noto Serif` and `Roboto` font families conflict far less than `DejaVu`. You may want to try them. Primary issues are the 0x2639 and 0x263a characters.

### Known issues

* [Symbols/emoji in monospace formatted text cause incorrect character alignment][10].
  The whitespace character widths from the most recently selected
  fallback font are used in Pango/GTK applications.
* [[Issue #31][11]] [Some font families are not matched correctly in Linux Firefox][12].
  Workaround: Open `about:config` set
  `gfx.font_rendering.fontconfig.fontlist.enabled` to `false`.
  [Note: May cause crashes in Firefox <48.][13]

[10]:https://bugzilla.gnome.org/show_bug.cgi?id=757785
[11]:https://github.com/eosrei/emojione-color-font/issues/31
[12]:https://bugzilla.mozilla.org/show_bug.cgi?id=1245811
[13]:https://bugzilla.mozilla.org/show_bug.cgi?id=1266341

### Manual install on any Linux
Install for the current user without root:
```sh
# 1. Download the latest version
wget https://github.com/DeeDeeG/noto-color-emoji-font/releases/download/v1.1-noto/NotoColorEmoji-SVGinOT-Linux-1.1.tar.gz
# 2. Uncompress the file
tar zxf NotoColorEmoji-SVGinOT-Linux-1.1.tar.gz
# 3. Run the installer
cd NotoColorEmoji-SVGinOT-Linux-1.1
./install.sh
```

### Install on Ubuntu Linux (wip)
Launchpad PPA: https://launchpad.net/~eosrei/+archive/ubuntu/fonts

```sh
sudo apt-add-repository ppa:eosrei/fonts
sudo apt-get update
sudo apt-get install fonts-twemoji-svginot
```

### Install on Arch Linux (wip)
AUR package: https://aur.archlinux.org/packages/twemoji-color-font/

```sh
yaourt -S twemoji-color-font
```

### Install on Gentoo Linux (wip)
Gentoo repository: https://github.com/jorgicio/jorgicio-gentoo

```sh
# Install layman using Portage with USE="git" enabled, the default.
emerge layman
# Add the repo.
layman -s jorgicio
# Install the package.
emerge twemoji-color-font
```

## Install on OS X
Both SVGinOT versions are available from releases:
https://github.com/DeeDeeG/noto-color-emoji-font/releases

1. `NotoColorEmoji-SVGinOT-1.1.zip` - The regular version of the font
   installs like any other font and can be specifically selected, but OS X will
   default to the `Apple Color Emoji` font for emojis.
2. `NotoColorEmoji-SVGinOT-OSX-1.1.zip` - A hack to replace the `Apple
   Color Emoji` font by [using the same internal name][14]. Install and accept
   the warning in Font Book.

A [Homebrew](http://brew.sh) package is available. (wip)

```sh
# Tap the caskroom/fonts keg, if needed.
brew tap caskroom/fonts
# Install the font using brew
brew cask install font-twitter-emoji-color
```

[14]:http://www.macissues.com/2014/11/21/how-to-change-the-default-system-font-in-mac-os-x/

*Reiterating: Only FireFox supports SVGinOT color emoji for now. Safari and
Chrome will use the fallback black and white emoji.*

## Install on Windows

There are two install options for Windows. Both SVGinOT versions are available
from releases: https://github.com/DeeDeeG/noto-color-emoji-font/releases

### Standard install

The regular version of the font installs like any other font and can be
specifically selected, but Windows will default to the `Segoe UI Emoji`
font for emoji characters. Download:
https://github.com/DeeDeeG/noto-color-emoji-font/releases/download/v1.1-noto/NotoColorEmoji-SVGinOT-1.1.zip

### Replace the default Windows emoji fonts

Windows 7, 8, 10 use emoji from both Segoe UI Symbol and Segoe UI Emoji. We
need to replace both fonts, but keep the existing symbol characters from
Segoe UI Symbol.

This package contains an install script that will generate both fonts (or
in Windows 7, just Segoe UI Symbol) and install them for you. Running the
install script requires both [Python][16] and pip in the PATH.

1. Download the most recent Python 3 for Windows: https://www.python.org/downloads/windows/
2. Start the installer, select "Add Python 3.6 to PATH" and finish the install process.
3. Download Noto Color Emoji Windows package from releases:
https://github.com/DeeDeeG/noto-color-emoji-font/releases/download/v1.1-noto/NotoColorEmoji-SVGinOT-Win-1.1.zip
4. Uncompress the file.
5. Open the new NotoColorEmoji directory.
7. Run install.cmd. *Note: This will take some time.*
8. Install both new fonts when requested.
9. Done!

[16]:https://www.python.org/downloads/windows/

*Reiterating: Only FireFox and Edge support SVGinOT color emoji for now. Chrome will use the
fallback black and white emoji.*

## Building
Overview:

1. B&W SVGs are generated on-the-fly from the color SVGs
2. The B&W SVGs are imported based on their filename to create either regular
   glyphs or ligature glyphs.
3. The color SVGs are imported to override both types of glyphs.

Requires:
* Inkscape
* Imagemagick
* potrace/mkbitmap
* FontTools 3.0+
* FontForge 20160405+
* SVGO
* make
* [SCFBuild][15] *(Created by eosrei for [EmojiOne Color][6]!)*

[15]: https://github.com/eosrei/scfbuild

Setup and build on Ubuntu 14.04 LTS:
```sh
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt-get update
sudo apt-get install inkscape potrace npm nodejs nodejs-legacy fontforge \
python-fontforge python-pip python-yaml imagemagick git make
sudo npm install -g svgo
sudo pip install fonttools
git clone https://github.com/DeeDeeG/noto-color-emoji-font.git
cd noto-color-emoji-font
git clone https://github.com/eosrei/scfbuild.git SCFBuild
# Type a number after the "-j" in the following command to control number of threads.
# The build involves an extremely large number of short tasks (several per glyph).
# Due to starting and stoping on each thread, CPU usage can be well below 100%, for strong processors.
# If your machine is powerful, a higher number of threads per-core will be faster and use more of your CPU power.
# basic processors: 1 thread per core is best. Strong processors: at least 2 threads per core is best.
make -j 4
# If you want to build all the packages (totally optional), run:
sudo apt-get install devscripts
# Which allows you to build the DEB_PACKAGE target, and:
make package -j 4
#
# "make package" will run without devscripts installed, and it will
# make the Linux, MacOS and Windows packages, but it won't build the
# .deb package.
#
# It's good to run "make package" before running a simple "make," if
# you want the packages, or else you will find your computer
# re-building the ttf font files in order to satisfy the dependencies
# of the "package" build target.
```

## License

The TTF fonts are licensed CC-BY-4.0.
The SVG artwork is licensed Apache 2.0.
Please see [LICENSE.md](LICENSE.md) for details.
