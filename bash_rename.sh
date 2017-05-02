#!/bin/bash

# batch processing svg filenames
# from Noto Emoji source
# (https://github.com/googlei18n/noto-emoj)
# to match https://github.com/eosrei/twemoji-color-font



# Run this to convert SVG filenames from Google's repository
# to be compatible with eosrei's.

# (Don't run this twice on the same SVGs,
# Or it will actually mess up their names.) 😕

# This file may break if Google decides
# to rename their SVGs. Oh well.



# Note: Here is an example SVG filename from Google:
# "emoji_u00a9.svg"
# Here is an example ZWJ sequence SVG filename from Google:
# "emoji_u1f469_1f3fd_200d_1f692.svg"

# We want to turn those into something like this:
# "00a9.svg" and "1f469-1f3fe-200d-1f692.svg"
# because we are borrowing eosrei's build process...
# And eosrei's build process is designed with
# these filenames in mind.



# There are lots of comments in this file, 💬
# and you're encouraged to read them 
# if you'd like to modify it.





# (Grabbing the filename of every SVG in this directory
# that begins with "emoji")
for i in $(\ls -d emoji*.svg)
do

# We are removing the beginning of every filename,
# i.e. we are removing "emoji_u" ✂
# So we must trim the first 6 characters.
j=${i:7}
# Storing the value of manipulated string in $j, so we can
# use it in a mv and then reuse it in an echo, without having to
# re-calculate the new string twice. It is faster this way. ⚡
mv $i $j
echo "renaming from $i to $j"
done
# see: http://tldp.org/LDP/abs/html/string-manipulation.html 📖
# subheading "Substring Extraction"


# (Grabbing the name of every SVG in this directory
# that contains an underscore in the filename)
for i in $(\ls -d *_*.svg)
do
j=${i//_/-}
mv $i $j
echo "renaming from $i to $j"
# remove underscores, replace with dashes.
# See: http://www.thegeekstuff.com/2010/07/bash-string-manipulation/ 📖
# "Replace all the matches" heading
done


# (Grabbing the name of every SVG in this directory
# that contains -2640 in the filename)
for i in $(\ls -d *-2640*.svg)
do
j=${i//-2640/-2640-fe0f}
mv $i $j
echo "renaming from $i to $j"
# remove "-2640", replace with "-2640-fe0f".
# 2640 is "Female Sign" ♀️
# https://codepoints.net/U+2640
# fe0f is "Variation Selector 16".
# https://codepoints.net/U+FE0F 🌐🖱
done


# (Grabbing the name of every SVG in this directory
# that contains -2642 in the filename)
for i in $(\ls -d *-2642*.svg)
do
j=${i//-2642/-2642-fe0f}
mv $i $j
echo "renaming from $i to $j"
# remove "-2642", replace with "-2642-fe0f".

# 2642 is "Male Sign" ♂️
# https://codepoints.net/U+2642
done


# (Grabbing the name of every SVG in this directory
# that contains 1f3cc-200d in the filename)
for i in $(\ls -d *1f3cc-200d*.svg)
do
j=${i//1f3cc-200d/1f3cc-fe0f-200d}
mv $i $j
echo "renaming from $i to $j"
# remove "1f3cc-200d", replace with "1f3cc-fe0f-200d".

# 1f3cc is "Golfer" 🏌️
# https://codepoints.net/U+1f3cc

# 200d is "Zero Width Joiner"
# https://codepoints.net/U+200d 🌐🖱
done


# (Grabbing the name of every SVG in this directory
# that contains 1f3f3-200d in the filename)
##### for i in $(\ls -d *1f3f3-200d*.svg)
##### do
##### j=${i//1f3f3-200d/1f3f3-fe0f-200d}
##### mv $i $j
##### echo "renaming from $i to $j"
# remove "1f3f3-200d", replace with "1f3f3-fe0f-200d".

# 1f3f3 is "Waving White Flag" 🏳️
# https://codepoints.net/U+1f3f3

# Not yet implemented on the Noto SVG side, this is for the Rainbow Flag sequence. 🏳️‍🌈 🏳️‍🌈 🏳️‍🌈
# Leaving this here in the hopes Google will release this SVG.
##### done


# (Grabbing the name of every SVG in this directory
# that contains -2695 in the filename)
for i in $(\ls -d *-2695*.svg)
do
j=${i//-2695/-2695-fe0f}
mv $i $j
echo "renaming from $i to $j"
# remove "-2695", replace with "-2695-fe0f".

# 2695 is "Staff of Aesculapius" ⚕️
# https://codepoints.net/U+2695
done


# (Grabbing the name of every SVG in this directory
# that contains -2696 in the filename)
for i in $(\ls -d *-2696*.svg)
do
j=${i//-2696/-2696-fe0f}
mv $i $j
echo "renaming from $i to $j"
# remove "-2696", replace with "-2696-fe0f".

# 2696 is "Scales" ⚖️
# https://codepoints.net/U+2696
done


# (Grabbing the name of every SVG in this directory
# that contains -2708 in the filename)
for i in $(\ls -d *-2708*.svg)
do
j=${i//-2708/-2708-fe0f}
mv $i $j
echo "renaming from $i to $j"
# remove "-2708", replace with "-2708-fe0f".

# 2708 is "Airplane" ✈️
# https://codepoints.net/U+2708
done


##### The following one ("Heavy Black Heart")
##### Shouldn't be needed. It might actually
##### break things at the moment. Uncomment if needed.
# (Grabbing the name of every SVG in this directory
# that contains -2764 in the filename)
##### for i in $(\ls -d *-2764*.svg)
##### do
##### j= ${i//-2764/-2764-fe0f}
##### mv $i $j
##### echo "renaming from $i to $j"
# remove "-2764", replace with "-2764-fe0f".

# 2764 is "Heavy Black Heart" ❤️
# https://codepoints.net/U+2764
##### done


##### mv 1f3f4-200d-2620.svg 1f3f4-200d-2620-fe0f.svg
##### echo "renaming from 1f3f4-200d-2620.svg to 1f3f4-200d-2620-fe0f.svg (yarrr!)"
# rename "1f3f4-200d-2620.svg" to "1f3f4-200d-2620-fe0f.svg".

# 1f3f4 is "Waving Black Flag" 🏴
# https://codepoints.net/U+if3f4

# 2620 is "Skull and Crossbones" ☠️
# https://codepoints.net/U+2620

# Not yet implemented on the Noto SVG side, this is for the Pirate Flag sequence.
# Pirate Flag is a non-standard Twitter Emoji sequence. http://emojipedia.org/pirate-flag/ 😃📖
# It is unlikely to be implemented in Noto Emoji, but you never know.

# https://www.youtube.com/watch?v=i8ju_10NkGY 🏴‍☠️ 🏴‍☠️ 🏴‍☠️
