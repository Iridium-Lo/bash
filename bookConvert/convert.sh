IFS=$'\n'
pdfDir=~/Desktop/Books
epubDir=~/Desktop/epubs
appDir=/Applications/calibre.app

isCalibre() {
  if [ ! -d $appDir ]; then
      echo 'install calibre and retry'
      exit 1
  fi   
 }

colo() { tput setaf $1; }

output() {
  colo $1
  echo "$3 $2.epub" 
 }

updateCats() {
  [ ! -d $epubDir/$1 ] &&
   mkdir -p $epubDir/$1
 }

strip() {
  echo "$1" | \
  sed -e s#.pdf##g
 }

convert() {
  if [ ! -f $epubDir/$2/"$1".epub ]; then
      output 5 "$1" '...'
      ebook-convert "$1".pdf \
        epubDir/$2/"$1".epub \
        > /dev/null 2>&1
  fi
 }

isCalibre

export PATH=$appDir/Contents/MacOS:$PATH

for i in `ls $pdfDir`; do
   updateCats $i
   cd $pdfDir/$i
   colo 7 
   echo -e "\n[$i]"
   for x in `ls *.pdf`; do
      book=`strip "$x"`
      convert "$book" $i   && \
      output 2 "$book" '-' || \
      output 6 "$book" '->'
      cd - > /dev/null
   done
done
