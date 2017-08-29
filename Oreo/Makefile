# Makefile to create all versions of the Noto Color Emoji SVGinOT font
# Run with: make -j [NUMBER_OF_CPUS]

# Use Linux Shared Memory to avoid wasted disk writes. Use /tmp to disable.
TMP := /dev/shm
#TMP := /tmp

# Where to find scfbuild?
SCFBUILD := SCFBuild/bin/scfbuild

VERSION := 1.3
FONT_PREFIX := NotoColorEmoji-SVGinOT
REGULAR_FONT := build/$(FONT_PREFIX).ttf
REGULAR_PACKAGE := build/$(FONT_PREFIX)-$(VERSION)
MACOS_FONT := build/$(FONT_PREFIX)-macOS.ttf
MACOS_PACKAGE := build/$(FONT_PREFIX)-macOS-$(VERSION)
FIREFOX_FONT := build/$(FONT_PREFIX)-pretends-to-be-EmojiOne-Mozilla-for-Firefox.ttf
FIREFOX_PACKAGE := build/$(FONT_PREFIX)-Firefox-$(VERSION)
LINUX_PACKAGE := $(FONT_PREFIX)-Linux-$(VERSION)
WINDOWS_TOOLS := windows
WINDOWS_PACKAGE := build/$(FONT_PREFIX)-Win-$(VERSION)

# There are two SVG source directories to keep the assets separate
# from the additions
SVG_NOTOCOLOREMOJI := assets/noto-color-emoji-svg
# Currently empty
SVG_EXTRA := assets/svg
# B&W only glyphs which will not be processed.
SVG_EXTRA_BW := assets/svg-bw

# Create the lists of traced and color SVGs
SVG_FILES := $(wildcard $(SVG_NOTOCOLOREMOJI)/*.svg) $(wildcard $(SVG_EXTRA)/*.svg)
SVG_STAGE_FILES := $(patsubst $(SVG_NOTOCOLOREMOJI)/%.svg, build/stage/%.svg, $(SVG_FILES))
SVG_STAGE_FILES := $(patsubst $(SVG_EXTRA)/%.svg, build/stage/%.svg, $(SVG_STAGE_FILES))
SVG_BW_FILES := $(patsubst build/stage/%.svg, build/svg-bw/%.svg, $(SVG_STAGE_FILES))
SVG_COLOR_FILES := $(patsubst build/stage/%.svg, build/svg-color/%.svg, $(SVG_STAGE_FILES))

.PHONY: all package regular-package linux-package macos-package firefox-package windows-package copy-extra clean

all: $(REGULAR_FONT) $(MACOS_FONT)

# Create the operating system specific packages
package: regular-package linux-package macos-package firefox-package windows-package

regular-package: $(REGULAR_FONT)
	rm -f $(REGULAR_PACKAGE).zip
	rm -rf $(REGULAR_PACKAGE)
	mkdir $(REGULAR_PACKAGE)
	cp $(REGULAR_FONT) $(REGULAR_PACKAGE)
	cp LICENSE* $(REGULAR_PACKAGE)
	cp README.md $(REGULAR_PACKAGE)
	7z a -tzip -mx=9 $(REGULAR_PACKAGE).zip ./$(REGULAR_PACKAGE)

linux-package: $(REGULAR_FONT)
	rm -f build/$(LINUX_PACKAGE).tar.gz
	rm -rf build/$(LINUX_PACKAGE)
	mkdir build/$(LINUX_PACKAGE)
	cp $(REGULAR_FONT) build/$(LINUX_PACKAGE)
	cp LICENSE* build/$(LINUX_PACKAGE)
	cp README.md build/$(LINUX_PACKAGE)
	cp -R linux/* build/$(LINUX_PACKAGE)
	tar zcvf build/$(LINUX_PACKAGE).tar.gz -C build $(LINUX_PACKAGE)

macos-package: $(MACOS_FONT)
	rm -f $(MACOS_PACKAGE).zip
	rm -rf $(MACOS_PACKAGE)
	mkdir $(MACOS_PACKAGE)
	cp $(MACOS_FONT) $(MACOS_PACKAGE)
	cp LICENSE* $(MACOS_PACKAGE)
	cp README.md $(MACOS_PACKAGE)
	7z a -tzip -mx=9 $(MACOS_PACKAGE).zip ./$(MACOS_PACKAGE)

firefox-package: $(FIREFOX_FONT)
	rm -f $(FIREFOX_PACKAGE).zip
	rm -rf $(FIREFOX_PACKAGE)
	mkdir $(FIREFOX_PACKAGE)
	cp $(FIREFOX_FONT) $(FIREFOX_PACKAGE)
	cp LICENSE* $(FIREFOX_PACKAGE)
	cp README.md $(FIREFOX_PACKAGE)
	7z a -tzip -mx=9 $(FIREFOX_PACKAGE).zip ./$(FIREFOX_PACKAGE)

windows-package: $(REGULAR_FONT)
	rm -f $(WINDOWS_PACKAGE).zip
	rm -rf $(WINDOWS_PACKAGE)
	mkdir $(WINDOWS_PACKAGE)
	cp $(REGULAR_FONT) $(WINDOWS_PACKAGE)
	cp LICENSE* $(WINDOWS_PACKAGE)
	cp README.md $(WINDOWS_PACKAGE)
	cp $(WINDOWS_TOOLS)/* $(WINDOWS_PACKAGE)
	7z a -tzip -mx=9 $(WINDOWS_PACKAGE).zip ./$(WINDOWS_PACKAGE)

# Build all three versions of the fonts
$(REGULAR_FONT): $(SVG_BW_FILES) $(SVG_COLOR_FILES) copy-extra
	$(SCFBUILD) -c scfbuild.yml -o $(REGULAR_FONT) --font-version="$(VERSION)"

$(MACOS_FONT): $(SVG_BW_FILES) $(SVG_COLOR_FILES) copy-extra
	$(SCFBUILD) -c scfbuild-macos.yml -o $(MACOS_FONT) --font-version="$(VERSION)"

$(FIREFOX_FONT): $(SVG_BW_FILES) $(SVG_COLOR_FILES) copy-extra
	$(SCFBUILD) -c scfbuild-firefox.yml -o $(FIREFOX_FONT) --font-version="$(VERSION)"

copy-extra: build/svg-bw
	cp $(SVG_EXTRA_BW)/* build/svg-bw/

# Create black SVG traces of the color SVGs to use as glyphs.
# 1. Make the Noto Color Emoji SVG into a PNG with Inkscape
# 2. Make the PNG into a BMP with ImageMagick and add margin by increasing the
#    canvas size to allow the outer "stroke" to fit.
# 3. Make the BMP into a Edge Detected PGM with mkbitmap
# 4. Make the PGM into a black SVG trace with potrace
build/svg-bw/%.svg: build/staging/%.svg | build/svg-bw
	inkscape -w 1000 -h 1000 -z -e $(TMP)/$(*F).png $<
	convert $(TMP)/$(*F).png -gravity center -extent 1066x1066 $(TMP)/$(*F).bmp
	rm $(TMP)/$(*F).png
	mkbitmap -g -s 1 -f 10 -o $(TMP)/$(*F).pgm $(TMP)/$(*F).bmp
	rm $(TMP)/$(*F).bmp
	potrace --flat -s --height 2048pt --width 2048pt -o $@ $(TMP)/$(*F).pgm
	rm $(TMP)/$(*F).pgm

# Optimize/clean the color SVG files
build/svg-color/%.svg: build/staging/%.svg | build/svg-color
	svgo -i $< -o $@

# Copy the files from multiple directories into one source directory
build/staging/%.svg: $(SVG_NOTOCOLOREMOJI)/%.svg | build/staging
	cp $< $@

build/staging/%.svg: $(SVG_MORE)/%.svg | build/staging
	cp $< $@

# Create the build directories
build:
	mkdir build

build/staging: | build
	mkdir build/staging

build/svg-bw: | build
	mkdir build/svg-bw

build/svg-color: | build
	mkdir build/svg-color

clean:
	rm -rf build
