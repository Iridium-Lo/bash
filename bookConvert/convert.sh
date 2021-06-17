IFS=$'\n'
pdfDir=~/Desktop/Books
epubDir=~/Desktop/epubs

cats=`ls $pdfDir`

colo(){ tput setaf $1; }

output() {
  colo $1
  echo "$3 $2.epub" 
 }

isCalibre() {
 if `which calibre`; then 
    export PATH=
 }


checkUpdateCats() {
  [ ! -d $epubDir/$1 ] &&
     mkdir -p $epubDir/$1
 }

convert() {
  if [ ! -f $epubDir/$2/"$1".epub ]; then 
        output 5 "$1" '...'
        ebook-convert "$1".pdf  \
           epubDir/$2/"$1".epub \
           > /dev/null 2>&1
  fi
 }

for i in `echo "$cats"`; do 
   checkUpdateCats $i
   cd $pdfDir/$i
   colo 7 
   echo -e "\n[$i]"
   for x in `ls *.pdf`; do 
      book=`echo "$x" | sed -e s/.pdf//g`
      convert "$book" $i    &&   \
      output 2 "$book" '-'  ||   \
      output 6 "$book" '->'
      cd - > /dev/null 
   done
done
