# Noto Color Emoji SVGinOT Font

Much credit to Brad Erickson (@13rac1) and various other upstream contributors. This is a fork derived from his [`twemoji-color-font`][1] repo.

_(Please note that giving credit in this way should not be taken as implying his or anyone else's endorsement of this repo.)_

## Intro

This is a color / B&W emoji SVGinOT font, built from the [Noto Color Emoji][2] artwork in multiple editions (Lollipop, Nougat, etc). See sub-folders for details on specific editions.

The font works in all operating systems, but will *currently* only show color
emoji in Firefox, Thunderbird, Photoshop CC 2017, and Windows Edge V38.14393+.
This is not a limitation of the font, but of the operating systems and
applications. Regular B&W outline emoji are included for backwards/fallback
compatibility.

[Do you prefer EmojiOne graphics?][7] (repo by Brad Erickson and various contributors.) (No-longer supported. For an up-to-date emoji font, see [Twemoji Color Font][1])

[1]: https://github.com/eosrei/twemoji-color-font
[2]: https://github.com/googlei18n/noto-emoji
[3]: http://unicode.org/emoji/charts/emoji-zwj-sequences.html
[4]: http://www.unicode.org/reports/tr51/#Diversity
[5]: http://www.unicode.org/reports/tr51/#Flags
[6]: http://emojipedia.org/google/android-7.1/
[7]: https://github.com/eosrei/emojione-color-font

## Table of Contents

* [Examples](#examples)
* [What is SVGinOT?](#what-is-svginot)
* [Install on Linux](#install-on-linux)
* [Install on macOS](#install-on-macos)
* [Install on Windows](#install-on-windows)
* [Building](#building)
* [License](#license)

## Examples

Demo of the Nougat release, in Firefox on Linux.
![Firefox color emoji in Linux](Nougat/images/notocoloremoji-font-demo.png?raw=true)

## What is SVGinOT?
*SVG in OpenType* is a standard by Adobe and Mozilla for color OpenType fonts.
It allows font creators to embed complete SVG files within a font,
enabling full color, and even animations. There are more details
in the [SVGinOT proposal][8] and the [OpenType SVG table specification][9].

SVGinOT Font demos (Firefox only):

* https://hacks.mozilla.org/2014/10/svg-colors-in-opentype-fonts/
* http://xerographer.github.io/reinebow/
* http://xerographer.github.io/multicoloure/

[8]: https://www.w3.org/2013/10/SVG_in_OpenType/
[9]: https://www.microsoft.com/typography/otspec/svg.htm

## Linux Details
The font can be installed for individual users, or system-wide. Get the latest version
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

## Install on Linux

### Standard install

Open the font in a font viewer program and press install. Websites and applications that specifically call for Noto Color Emoji will use the font. Certain issues with Fontconfig may prevent the emoji from showing up by default. For a more thorough installation, use the install script described below.

### Manual install on any Linux

Install for the current user without root:
```sh
# 1. Download the desired version, e.g.:
wget https://github.com/DeeDeeG/noto-color-emoji-font/releases/download/v1.3-oreo/NotoColorEmoji-SVGinOT-Linux-1.3.tar.gz
# 2. Uncompress the file
tar zxf NotoColorEmoji-SVGinOT-Linux-1.3.tar.gz
# 3. Run the installer
cd NotoColorEmoji-SVGinOT-Linux-1.3
./install.sh
```

## Install on macOS
Both SVGinOT versions are available from releases:
https://github.com/DeeDeeG/noto-color-emoji-font/releases

1. `NotoColorEmoji-SVGinOT-1.x.zip` - The regular version of the font
   installs like any other font and can be specifically selected, but macOS will
   default to the `Apple Color Emoji` font for emoji.
2. `NotoColorEmoji-SVGinOT-OSX-1.x.zip` - A hack to replace the `Apple
   Color Emoji` font by [using the same internal name][14]. Install and accept
   the warning in Font Book.

[14]:http://www.macissues.com/2014/11/21/how-to-change-the-default-system-font-in-mac-os-x/

*Reiterating: Only FireFox supports SVGinOT color emoji for now. Safari and
Chrome will use the fallback black and white emoji.*

## Install on Windows

There are two install options for Windows. Both SVGinOT versions are available
from releases: https://github.com/DeeDeeG/noto-color-emoji-font/releases

### Standard install

The regular version of the font installs like any other font and can be
specifically selected, but Windows will default to the `Segoe UI Emoji`
font for emoji characters.

Download the standard (zip) package of the desired edition, e.g.:
https://github.com/DeeDeeG/noto-color-emoji-font/releases/download/v1.3-oreo/NotoColorEmoji-SVGinOT-1.3.zip

### Replace the default Windows emoji fonts

Windows 7, 8, 10 use emoji from both Segoe UI Symbol and Segoe UI Emoji. We
need to replace both fonts, but keep the existing symbol characters from
Segoe UI Symbol.

This package contains an install script that will generate both fonts (or
in Windows 7, just Segoe UI Symbol) and install them for you. Running the
install script requires both [Python][16] and pip in the PATH.

1. Download the most recent Python 3 for Windows: https://www.python.org/downloads/windows/
2. Start the installer, select "Add Python 3.x to PATH" and finish the install process.
3. Download the Noto Color Emoji Windows package from releases, _e.g._:
https://github.com/DeeDeeG/noto-color-emoji-font/releases/download/v1.3-oreo/NotoColorEmoji-SVGinOT-Win-1.3.zip
4. Uncompress the zip file.
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
* [SCFBuild][15] *(Created by Brad Erickson for [EmojiOne Color][7]!)*

[15]: https://github.com/13rac1/scfbuild

Setup on Ubuntu 14.04 LTS:
```sh
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt-get update
sudo apt-get install inkscape potrace npm nodejs nodejs-legacy fontforge \
python-fontforge python-pip python-yaml imagemagick git make
sudo npm install -g svgo
pip install fonttools
```

Setup on Ubuntu 18.04 LTS:
```sh
sudo apt-get install inkscape potrace npm nodejs fontforge \
python-fontforge python-pip python-yaml imagemagick git make
sudo npm install -g svgo
pip install fonttools
```

Build (any Ubuntu release):
```sh
git clone https://github.com/DeeDeeG/noto-color-emoji-font.git
cd noto-color-emoji-font
git clone https://github.com/13rac1/scfbuild.git SCFBuild
# Type a number after the "-j" in the following command
# to control the number of threads.
# Rule of thumb: if you have a dual or quad core processor, use "-j 4".
# If you have more than 4 cores, use "-j [your-number-of-cpu-cores-here]"
make -j 4
#
#
# If you want to build all the packages (totally optional), run:
make package -j 4
```

(It's good to run "make package" if you want the packages,
before / rather than running a basic "make" command,
or else you will find your computer re-building the ttf font files
in order to satisfy the dependencies of the "package" build target.)

## License

The TTF fonts are licensed CC-BY-4.0.
The SVG artwork is licensed Apache 2.0.
Please see [LICENSE.md](LICENSE.md) for details.
