IFS=$'\n'
pdfDir=~/Desktop/Books
epubDir=~/Desktop/epubs

cats=`ls $pdfDir`

for i in `echo "$cats"`; do
   [ ! -d $epubDir/$i ] \
   && mkdir -p $epubDir/$i
done

for i in `echo "$cats"`; do 
   cd $pdfDir/$i
   tput setaf 7
   echo -e "\n[$i]"
      for x in `ls *.pdf`; do 
         book=`echo "$x" | sed -e s/.pdf//g`
         [[ ! -f $epubDir/$i/$book.epub ]] \
         && ebook-convert $book.pdf        \
               epubDir/$i/$book.epub       \
               > /dev/null 2>&1
            tput setaf 2
            echo "-> $book.epub"
            tput sgr0
            cd - > /dev/null
      done
done
