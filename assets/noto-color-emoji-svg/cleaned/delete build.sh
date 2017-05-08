for i in `ls -d *.svg`

# if the build folder exists
if [ -d "../../../build" ]; then

# delete all files with an SVG in cleaned from the build folder
  do
  echo "removing $i from svg-bw and svg-color"
  rm ../../../build/svg-bw/$i
  rm ../../../build/svg-color/$i
  done
fi

# regardless, copy from cleaned to the main `assets/noto-nolor-emoji-svg` folder
cp ./*.svg ../
