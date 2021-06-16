IFS=$'\n'
pdfDir=~/Desktop/Books
epubDir=~/Desktop/epubs

cats=`ls $pdfDir`

for i in `echo "$cats"`; do  
   [ ! -d $epubDir/$i ]  && 
      mkdir $epubDir/$i   
done

for i in `echo "$cats"`; do pushd $pdfDir/$i
   for x in `ls *.pdf`; do 
      book=`echo "$x" | sed -e s/.pdf//g`
      [[ ! -f $epubDir/$i/$book.epub ]] &&
         ebook-convert $book.pdf $epubDir/$i/$book.epub
         tput setaf 2 
         echo "$book.epub -> done"
         tput sgr0
   done
   popd
done   
popd
