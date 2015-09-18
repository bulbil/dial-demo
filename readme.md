

### Introduction to Text Analysis: *The Dial* Demo
These commands must be entered into the Terminal, which is an application included with all Mac operating systems. For them to work, they must be entered exactly (or if you can simply cut and paste if you prefer).

#### OVERVIEW
from Text -->

- discover
- collect
- augment
- cleanup
- explore

\--> to Analysis

#### DISCOVERY

**identify a meaningful body of text / how to access it**

- [penn online books catalog](http://onlinebooks.library.upenn.edu/webbin/serial?id=thedial)
- find where and if a plaintext version exists, [for example](https://ia802708.us.archive.org/5/items/dialjournallitcrit21chicrich/dialjournallitcrit21chicrich_djvu.txt)
- find the redirect pattern, e.g.: [archive.org/1/items/dialjournallitcrit21chicrich/dialjournallitcrit21chicrich_djvu.txt](http://archive.org/1/items/dialjournallitcrit21chicrich/dialjournallitcrit21chicrich_djvu.txt)

#### COLLECTION

**gather / document / archive**

- transform identifiers into redirect pattern:
    - `(^.*?")(.*?)(/details/)(.*)(".*$)`
    - `$2/1/items/$4/$4_djvu\.txt\n`
- url transformation from upenn online source html
- `mkdir sample-dir`
- `cd sample-dir`
- curl script for downloading all the urls:
    - `for url in $(cat <filepath>); do curl -LO $url; done`
    - or `../dial-curl.sh <url_list.txt>`
    - or `../dial-curl.sh ../dial-urls-sample.txt`

#### AUGMENTATION / MODELING

**connect resources or algorithms to make the data more useful**

- using the [Stanford Named Entity Recognizer](http://nlp.stanford.edu/software/CRF-NER.shtml)
- you can use the GUI by opening the `ner-gui.command` file
- but to process a number of texts, you may need to automate
    - `cd sample-dir`
    - `./dial-ner.sh  <ner filepath> <texts file path>`
    - in this case `./dial-ner.sh ~/Applications/stanford-ner-2015-4-20 sample`

#### CLEANUP

**ensure data is machine-friendly and people-friendly**

- create a new project in OpenRefine
- import all the tagged files in the `sample` folder
- get rid of untagged words using text filters
    - facet by blank
    - remove matching rows
- find unique values
    - sort by column
    - reorder rows permanently
    - edit cells --> blank down
    - facet by blank
    - remove matching rows
- use clustering to disambiguate
- use facets and export to generate useful subsets

Checkout the [OpenRefine documentation](https://github.com/OpenRefine/OpenRefine/wiki/Recipes) for further recipes ...

