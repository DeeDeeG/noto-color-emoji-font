for i in $(\ls -d *_*.svg)
do
if [ ${#i} -eq 13 ]
then
echo 13131313
elif [ ${#i} -eq 15 ]
then
echo 1515151515
fi
# j=${i:0:5}
# k=${i:6}
# cp $i /home/mint/Work/Font_Business/svg_renaming/svg_round2/$j-$k
done
