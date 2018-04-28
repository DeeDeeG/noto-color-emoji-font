for i in $(\ls -d *.svg)
do
mv $i ${i:1}
done
