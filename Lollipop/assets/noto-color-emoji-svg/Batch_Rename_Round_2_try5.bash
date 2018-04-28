for i in $(\ls -d *_*.svg)
do
j=${i:0:4}
k=${i:6}
cp $i /home/mint/Work/Font_Business/svg_renaming/svg_round2/$j-$k
done
