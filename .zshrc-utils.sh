function optim() {
  # For this one to run you need to install a few CLIs
  # brew install webp
  # yarn global add avif
  # yarn global add imageoptim-cli

  dirPath=$(pwd)
  filePath=$dirPath/$1
  fileName=$filePath:t:r
  fileExtension=$filePath:t:e
  filePathWebp="${filePath/.${fileExtension}/".webp"}"

  echo -e "\033[0;34mi Running cwebp...\033[0m"
  cwebp -quiet $filePath -o $filePathWebp

  echo -e "\033[0;34mi Running avif...\033[0m"
  avif --input="$filePath"

  imageoptim --no-stats $filePath

  echo "✅ ${fileName}.webp generated"
  echo "✅ ${fileName}.avif generated"
  echo "✅ ${fileName}.${fileExtension} optimized"
}
