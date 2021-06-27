IFS=$'\n'
pdfDir=$HOME/Desktop/Books
epubDir=$HOME/Desktop/epubs
appDir=/Applications/calibre.app

isCalibre() {
  [ ! -d $appDir ] &&
   echo 'install calibre and retry'
   exit 1
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
  [ ! -f "$epubDir/$2/$1.epub" ] &&
   output 5 "$1" '...' 
   ebook-convert "$1.pdf"  \
     "$epubDir/$2/$1.epub" \
     > /dev/null 2>&1
 }

isCalibre

export -f updateCats
export PATH=$appDir/Contents/MacOS:$PATH

parallel -j 0 updateCats ::: `ls $pdfDir`

for i in `ls $pdfDir`; do 
   cd $pdfDir/$i
   colo 7 
   echo -e "\n[$i]"
   for x in `ls *.pdf`; do
      book=`strip "$x"`
      convert "$book" $i
      output 6 "$book" '->'
      cd - > /dev/null
   done
done
