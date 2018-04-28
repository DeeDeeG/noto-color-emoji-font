for i in $(\ls -d *.svg)
do
mv $i ${i:6}
done
