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
# to rename their SVGs. Oh well. 🤷


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



echo -e "\n   removing 'emoji_u'\n"

# (Grabbing the filename of every SVG in this directory
# that begins with "emoji")
for i in $(\ls -d emoji*.svg)
do

# We are removing the beginning of every filename,
# i.e. we are removing "emoji_u" ✂
# So we must trim the first 7 characters.
j=${i:7}
# Storing the value of manipulated string in $j, so we can
# use it in a mv and then reuse it in an echo, without having to
# re-calculate the new string twice. It is faster this way. ⚡
mv $i $j
echo "renaming from $i to $j"
done
# see: http://tldp.org/LDP/abs/html/string-manipulation.html 📖
# subheading "Substring Extraction"

echo -e "\n   removing 00\n"

# (Grabbing the filename of every SVG in this directory
# that begins with "00")
for i in $(\ls -d 00*.svg)
do

# We are removing the beginning of these filenames,
# i.e. we are removing "00" ✂
# So we must trim the first 2 characters.
j=${i:2}
mv $i $j
echo "renaming from $i to $j"
done

echo -e "\n   replacing underscores with dashes\n"

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

echo -e "\n   adding VS-16 to female sign\n"

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

echo -e "\n   adding VS-16 to male sign\n"

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


echo -e "\n   adding VS-16 to waving white flag for the rainbow flag ZWJ sequence\n"

# (Grabbing the name of every SVG in this directory
# that contains 1f3f3-200d in the filename)
for i in $(\ls -d *1f3f3-200d*.svg)
do
j=${i//1f3f3-200d/1f3f3-fe0f-200d}
mv $i $j
echo "renaming from $i to $j"
# remove "1f3f3-200d", replace with "1f3f3-fe0f-200d".

# 1f3f3 is "Waving White Flag" 🏳️
# https://codepoints.net/U+1f3f3

# 200d is "Zero Width Joiner"
# https://codepoints.net/U+200d 🌐🖱

# This is for the Rainbow Flag sequence. 🏳️‍🌈 🏳️‍🌈 🏳️‍🌈
done

echo -e "\n   adding VS-16 to staff of aesculapius for healthcare worker ZWJ sequences\n"

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

echo -e "\n   adding VS-16 to scales for judge ZWJ sequences\n"

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

echo -e "\n   adding VS-16 to airplane for airplane pilot ZWJ sequences\n"

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

# echo -e "\n   adding VS-16 to heavy black heart\n"

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

# echo -e "\n   adding VS-16 to skull and crossbones for the pirate flag ZWJ sequence\n"

##### mv 1f3f4-200d-2620.svg 1f3f4-200d-2620-fe0f.svg
##### echo "renaming from 1f3f4-200d-2620.svg to 1f3f4-200d-2620-fe0f.svg (yarrr!)"
# rename "1f3f4-200d-2620.svg" to "1f3f4-200d-2620-fe0f.svg".

# 1f3f4 is "Waving Black Flag" 🏴
# https://codepoints.net/U+1f3f4

# 2620 is "Skull and Crossbones" ☠️
# https://codepoints.net/U+2620

# Not yet implemented on the Noto SVG side, this is for the Pirate Flag sequence.
# Pirate Flag is a non-standard Twitter Emoji sequence. http://emojipedia.org/pirate-flag/ 😃📖
# It is unlikely to be implemented in Noto Emoji, but you never know.

# https://www.youtube.com/watch?v=i8ju_10NkGY 🏴‍☠️ 🏴‍☠️ 🏴‍☠️


# Beyond this point we are mostly making up for not using the noto-emoji repo's complex and fancy "aliasing" system,
# by doing it the old-fashined way. We make full copies on disk of the "aliased" files, with the appropriate names for SCFBuild to understand.

array_male=(1f3c3 1f3c4 1f3ca 1f3cb 1f3cc 1f6a3 1f6b4 1f6b5 1f6b6 1f46e 1f93c 1f93d 1f93e 1f471 1f473 1f477 1f482 1f575 1f647 1f938 1f939 26f9)
# see: http://www.linuxjournal.com/content/bash-arrays
for k in ${array_male[*]}
do
    cp $k-200d-2642-fe0f.svg $k.svg
    cp $k-1f3ff-200d-2642-fe0f.svg $k-1f3ff.svg
    cp $k-1f3fe-200d-2642-fe0f.svg $k-1f3fe.svg
    cp $k-1f3fd-200d-2642-fe0f.svg $k-1f3fd.svg
    cp $k-1f3fc-200d-2642-fe0f.svg $k-1f3fc.svg
    cp $k-1f3fb-200d-2642-fe0f.svg $k-1f3fb.svg
    echo "copying $k substitutions and base glyph"
done


array_female=(1f64b 1f64d 1f64e 1f481 1f486 1f487 1f645 1f646 1f926 1f937 1f9d6 1f9d7 1f9d8 1f9d9 1f9da 1f9db 1f9dc 1f9dd)
# see: http://www.linuxjournal.com/content/bash-arrays
for k in ${array_female[*]}
do
    cp $k-200d-2640-fe0f.svg $k.svg
    cp $k-1f3ff-200d-2640-fe0f.svg $k-1f3ff.svg
    cp $k-1f3fe-200d-2640-fe0f.svg $k-1f3fe.svg
    cp $k-1f3fd-200d-2640-fe0f.svg $k-1f3fd.svg
    cp $k-1f3fc-200d-2640-fe0f.svg $k-1f3fc.svg
    cp $k-1f3fb-200d-2640-fe0f.svg $k-1f3fb.svg
    echo "copying $k substitutions and base glyph"
done


echo -e "\n   adding missing related base glyphs and singletons\n"

cp 1f9de-200d-2640-fe0f.svg 1f9de.svg
echo "copying genie base glyph (1f9de-200d-2640-fe0f.svg -> 1f9de.svg)"
# default genie 🧞

cp 1f9df-200d-2640-fe0f.svg 1f9df.svg
echo "copying zombie base glyph (1f9df-200d-2640-fe0f.svg -> 1f9df.svg)"
# default zombie 🧟


cp 1f468-200d-1f469-200d-1f466.svg 1f46a.svg
echo "copying family singleton glyph (1f468-200d-1f469-200d-1f466.svg -> 1f46a.svg)"
# default family 👪

cp 1f469-200d-2764-200d-1f48b-200d-1f468.svg 1f48f.svg
echo "copying couple kissing singleton glyph (1f469-200d-2764-200d-1f48b-200d-1f468.svg -> 1f48f.svg)"
# default couple kissing 💏

cp 1f469-200d-2764-200d-1f468.svg 1f491.svg
echo "copying couple with heart singleton glyph (1f469-200d-2764-200d-1f468.svg -> 1f491.svg)"
# default couple with heart 💑

# There a couple places where eosrei's repo has VS-16 and noto-emoji doesn't, so we add them down here as well.
echo -e "\n   aligning remaining names with eosrei's repo, by adding VS-16 in certain places\n"

mv 1f3cb-200d-2640-fe0f.svg 1f3cb-fe0f-200d-2640-fe0f.svg
echo "renaming from 1f3cb-200d-2640-fe0f.svg to 1f3cb-fe0f-200d-2640-fe0f.svg"
# Woman lifting weights 🏋️‍♀️  (align name with eosrei's repo)

mv 1f3cb-200d-2642-fe0f.svg 1f3cb-fe0f-200d-2642-fe0f.svg
echo "renaming from 1f3cb-200d-2642-fe0f.svg to 1f3cb-fe0f-200d-2642-fe0f.svg"
# Man lifting weights 🏋️‍♂️  (align name with eosrei's repo)


mv 1f3cc-200d-2640-fe0f.svg 1f3cc-fe0f-200d-2640-fe0f.svg
echo "renaming from 1f3cc-200d-2640-fe0f.svg to 1f3cc-fe0f-200d-2640-fe0f.svg"
# Woman golfing 🏌️‍♀️ (align name with eosrei's repo)

mv 1f3cc-200d-2642-fe0f.svg 1f3cc-fe0f-200d-2642-fe0f.svg
echo "renaming from 1f3cc-200d-2642-fe0f.svg to 1f3cc-fe0f-200d-2642-fe0f.svg"
# Man golfing 🏌️‍♂️ (align name with eosrei's repo)


mv 1f468-200d-2764-200d-1f48b-200d-1f468.svg 1f468-200d-2764-fe0f-200d-1f48b-200d-1f468.svg
echo "renaming from 1f468-200d-2764-200d-1f48b-200d-1f468.svg to 1f468-200d-2764-fe0f-200d-1f48b-200d-1f468.svg"
mv 1f469-200d-2764-200d-1f48b-200d-1f468.svg 1f469-200d-2764-fe0f-200d-1f48b-200d-1f468.svg
echo "renaming from 1f469-200d-2764-200d-1f48b-200d-1f468.svg to 1f469-200d-2764-fe0f-200d-1f48b-200d-1f468.svg"
mv 1f469-200d-2764-200d-1f48b-200d-1f469.svg 1f469-200d-2764-fe0f-200d-1f48b-200d-1f469.svg
echo "renaming from 1f469-200d-2764-200d-1f48b-200d-1f469.svg to 1f469-200d-2764-fe0f-200d-1f48b-200d-1f469.svg"
# Couples kissing (align names with eosrei's repo)

mv 1f468-200d-2764-200d-1f468.svg 1f468-200d-2764-fe0f-200d-1f468.svg
echo "renaming from 1f468-200d-2764-200d-1f468.svg to 1f468-200d-2764-fe0f-200d-1f468.svg"
mv 1f469-200d-2764-200d-1f468.svg 1f469-200d-2764-fe0f-200d-1f468.svg
echo "renaming from 1f469-200d-2764-200d-1f468.svg to 1f469-200d-2764-fe0f-200d-1f468.svg"
mv 1f469-200d-2764-200d-1f469.svg 1f469-200d-2764-fe0f-200d-1f469.svg
echo "renaming from 1f469-200d-2764-200d-1f469.svg to 1f469-200d-2764-fe0f-200d-1f469.svg"
# Couples with hearts (align names with eosrei's repo)


mv 1f575-200d-2642-fe0f.svg 1f575-fe0f-200d-2642-fe0f.svg
echo "renaming from 1f575-200d-2642-fe0f.svg to 1f575-fe0f-200d-2642-fe0f.svg"
mv 1f575-200d-2640-fe0f.svg 1f575-fe0f-200d-2640-fe0f.svg
echo "renaming from 1f575-200d-2640-fe0f.svg to 1f575-fe0f-200d-2640-fe0f.svg"
# 🕵️ Sleuth (align name with eosrei's repo)


mv 26f9-200d-2640-fe0f.svg 26f9-fe0f-200d-2640-fe0f.svg
echo "renaming from 26f9-200d-2640-fe0f.svg to 26f9-fe0f-200d-2640-fe0f.svg"
mv 26f9-200d-2642-fe0f.svg 26f9-fe0f-200d-2642-fe0f.svg
echo "renaming from 26f9-200d-2642-fe0f.svg to 26f9-fe0f-200d-2642-fe0f.svg"
# ⛹️ Basketball player (align name with eosrei's repo)
