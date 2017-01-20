# Noto Color Emoji SVGinOT Font

Major credit to eosrei. This is a lightly modified version  of his [Twitter Emoji for Everyone][1] repo.

This older release of Noto Color Emoji is the most recent release Google has provided in SVG format. SVGs were required in order to use eosrei's  tools. (On the bright side, some people were sad to see gender-neutral emojis removed from Google's Noto Emoji font recently. This older release includes them! Glorious and blobby.)

## Intro

This is a somewhat retro-feeling color and B&W emoji SVGinOT font, built from an outdated version of the
[Noto Color Emoji][2] artwork with support for limited [ZWJ][3] sequences (many unicode 9.0 and other recent glyphs are missing at the moment),
[skin tone diversity][4] (maybe, someday?) and [country flags][5] (not all flags supported).

The font works in all operating systems, but will *currently* only show color
emoji in Firefox, Thunderbird and other Mozilla Gecko-based applications. This
is not a limitation of the font, but of the operating systems and applications.
Regular B&W outline emoji are included for backwards/fallback compatibility.

[Do you prefer EmojiOne graphics?][6]

[1]: https://github.com/eosrei/twemoji-color-font
[2]: https://github.com/googlei18n/noto-emoji
[3]: http://unicode.org/emoji/charts/emoji-zwj-sequences.html
[4]: http://www.unicode.org/reports/tr51/#Diversity
[5]: http://www.unicode.org/reports/tr51/#Flags
[6]: https://github.com/eosrei/emojione-color-font

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

Demo image coming soon?

## What is SVGinOT?
*SVG in Open Type* is a standard by Adobe and Mozilla for color OpenType
and Open Font Format fonts. It allows font creators to embed complete SVG files
within a font enabling full color and even animations. There are more details
in the [SVGinOT proposal][7] and the [OpenType SVG table specifications][8].

SVGinOT Font demos (Firefox only):

* https://hacks.mozilla.org/2014/10/svg-colors-in-opentype-fonts/
* http://xerographer.github.io/reinebow/
* http://xerographer.github.io/multicoloure/

[7]: https://www.w3.org/2013/10/SVG_in_OpenType/
[8]: https://www.microsoft.com/typography/otspec/svg.htm

## Install on Linux
The font can be installed for a user or system-wide. Get the latest version
from releases: https://github.com/DeeDeeG/noto-color-emoji-font/releases

*Note: This requires `Bitstream Vera` is installed and will change your
systems default serif, sans-serif and monospace fonts.*

### Why Bitstream Vera
The default serif, sans-serif and monospace font for most Linux distributions is
`DejaVu`. `DejaVu` includes a wide range of symbols which override the
`EmojiOne Color` characters. The previous solution was to make
`EmojiOne Color` the default system font, but that causes a number of issues.
A better solution is a different font that doesn't override any emoji characters
such as `Bitstream Vera`. `Bitstream Vera` is the source of the glyphs used in
`DejaVu`, so it's not very different. 99%+ of people will not notice the
difference.

### Additional default font options
The `Noto` and `Roboto` font families conflict far less than `DejaVu`. You may
want to try them. Primary issues are the 0x2639 and 0x263a characters.

### Known issues

* [Symbols/emoji in monospace formatted text cause incorrect character alignment][9].
  The whitespace character widths from the most recently selected
  fallback font are used in Pango/GTK applications.
* [[Issue #31][10]] [Some font families are not matched correctly in Linux Firefox][11].
  Workaround: Open `about:config` set
  `gfx.font_rendering.fontconfig.fontlist.enabled` to `false`.
  [Note: May cause crashes in Firefox <48.][12]

[9]:https://bugzilla.gnome.org/show_bug.cgi?id=757785
[10]:https://github.com/eosrei/emojione-color-font/issues/31
[11]:https://bugzilla.mozilla.org/show_bug.cgi?id=1245811
[12]:https://bugzilla.mozilla.org/show_bug.cgi?id=1266341

### Manual install on any Linux (wip)
Install for the current user without root:
```sh
# 1. Download the latest version
wget https://github.com/DeeDeeG/noto-color-emoji-font/releases/download/v1.0-noto/NotoColorEmoji-SVGinOT-Linux-1.0.tar.gz
# 2. Uncompress the file
tar zxf NotoColorEmoji-SVGinOT-Linux-1.0.tar.gz
# 3. Run the installer
cd NotoColorEmoji-SVGinOT-Linux-1.0
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

1. `NotoColorEmoji-SVGinOT-1.0.zip` - The regular version of the font
   installs like any other font and can be specifically selected, but OS X will
   default to the `Apple Color Emoji` font for emojis.
2. `NotoColorEmoji-SVGinOT-OSX-1.0.zip` - A hack to replace the `Apple
   Color Emoji` font by [using the same internal name][13]. Install and accept
   the warning in Font Book.

A [Homebrew](http://brew.sh) package is available.

```sh
# Tap the caskroom/fonts keg, if needed.
brew tap caskroom/fonts
# Install the font using brew
brew cask install font-twitter-emoji-color
```

[13]:http://www.macissues.com/2014/11/21/how-to-change-the-default-system-font-in-mac-os-x/

*Reiterating: Only FireFox supports the SVGinOT color emoji for now. Safari and
Chrome will use the fallback black and white emoji.*

## Install on Windows

The font installs like any other font and can be specifically selected, but
the system will default to the `Segoe UI Emoji` font.

It can be manually selected in CSS, but making it the default is still TBD.

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
* [SCFBuild][14] *(Created for this project!)*

[14]: https://github.com/eosrei/scfbuild

Setup and build on Ubuntu 14.04 LTS:
```sh
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt-get update
sudo apt-get install inkscape potrace npm nodejs nodejs-legacy fontforge \
python-fontforge python-pip imagemagick git make
sudo npm install -g svgo
sudo pip install fonttools
git clone https://github.com/DeeDeeG/noto-color-emoji-font.git
cd noto-color-emoji-font
git clone https://github.com/eosrei/scfbuild.git SCFBuild
# type the number of CPU cores you have after the "-j" in the following command (eg 2, 4, 8 cores; example is for 4-core machines)
make -j 4
```

## License

The artwork and TTF fonts are licensed CC-BY-4.0. Please see
[LICENSE.md](LICENSE.md) for details.
