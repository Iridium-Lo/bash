## Calibre convert: pdf -> epub

### GUI vs terminal

tested with same book single conversion:

- time GUI version: 1hr 36 mins
- time terminal version: 34 mins

### Terminal and GUI shortfalls

- need to recreate categories 
- need to select each file
- running in parallel severely reduces conversion speed 

## What this script does 

- creates the dir structure you have for categories
- updates the categories if you add new ones 
- converts all books you have with 1 cmd 
- does this sequentially to improve performance
- only converts books that haven't been converted

### How to use 

skip the below if you have your pdf folder on machine:

- connect device to machine
- I'm using a Mac so I go to: `iphone> files> Books`
- then drag and drop to: `~/Desktop` 
- make sure the folder dragged is named: `Books`

for `~/Desktop/books` each category should contain the pdfs:

```
  ├── biology
  ├── chemistry
  ├── computing
  ├── culture
  ├── enzymes
  ├── lucid
  ├── maths
  ├── medicine
  ├── neuroscience
  ├── occult
  ├── pharmacology
  ├── physics
  ├── psychiatry
  └── religion
```
Then:

`bash convert.sh`

### Output:

![title](https://github.com/Iridium-Lo/bash/blob/master/bookConvert/img/image.png)

#### Notes 

pdf dir and epub dir are both on the desktop 
so you can drag and drop the epub dir to your files app; can't seem to drag and drop to iphone from other locations
 
use the following cmd to stop your mac from sleeping or screen locking (scripts don't run):

`caffeinate -dimsu`
