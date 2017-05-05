for i in `ls -d *.svg`
do
echo "removing $i from svg-bw and svg-color"
rm ../../../build/svg-bw/$i
rm ../../../build/svg-color/$i
done
