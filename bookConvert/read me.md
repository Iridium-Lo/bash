## Calibre convert: pdf -> epub

I download pdf books on my phone and have them organised by category

I copied this file to my desktop from my phone

Then to my horror some books would take 2 hours to convert 

So I switched to the cmdline version of calibre after being suggested it

## GUI vs terminal

tested with same book single conversion:

- time GUI version: 1hr 36 mins
- time terminal version: 34 mins
- terminal is much faster 

### Terminal and GUI shortfalls

- need to recreate categories 
- need to select each file
- running in parallel severely reduces conversion speed 

These are all tedious problems 

## What this script does 

- creates the dir structure you have for categories
- updates the categories if you add new ones 
- converts all books you have with 1 cmd 
- does this sequentially to improve performance
- only converts books that haven't been converted

## How to use 

Have your pdf folder setup like this:

`Books/<individual categories>/<pdf files for each category>

skip the below if you have your pdf folder on machine:

- connect device to machine
- I'm using a Mac so I go to: `iphone> files> epubs`
- then drag and drop to: `~/Desktop` 

### Notes 
pdf dir and epub dir are both on the desktop 
so you can drag and drop the epub dir to your files app
Can't seem to drag and drop to iphone from other locations
Then you can open it in `books`

