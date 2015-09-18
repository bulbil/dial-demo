## Designing a Digital Project: Text Analysis Workshop Notes

### Introduction to Text Analysis: *The Dial* Demo
These commands must be entered into the Terminal, which is an application included with all Mac operating systems. For them to work, they must be entered exactly (or if you can simply cut and paste if you prefer).

#### introduction
- from Text -->
- - collection
- - cleanup
- - augment
- - visualize
- - --> to Analysis

#### exploring data sources
- [penn online books catalog](http://onlinebooks.library.upenn.edu/webbin/serial?id=thedial)
- find where and if a plaintext version exists, [for example](https://ia802708.us.archive.org/5/items/dialjournallitcrit21chicrich/dialjournallitcrit21chicrich_djvu.txt)
- redirect pattern, e.g.: `http://archive.org/1/items/dialjournallitcrit21chicrich/dialjournallitcrit21chicrich_djvu.txt`
- transformed identifiers into the new pattern

#### data collection (e.g., web-scraping)
- url transformation from upenn online source html
- curl script for downloading all the urls:
- - `for url in $(cat <filepath>); do curl -LO $url; done`
- - or `./dial-curl.sh <url_list.txt>`

#### data transformation / augmentation
- using the [Stanford Named Entity Recognizer](http://nlp.stanford.edu/software/CRF-NER.shtml)
- you can use the GUI by opening the `ner-gui.command` file
- but to process a number of texts, you may need to automate
- - `./dial-ner.sh  <ner filepath> <texts file path>`
- - in this case `./dial-ner.sh ~/Applications/stanford-ner-2015-4-20 sample`

#### cleanup
- create a new project in OpenRefine
- import all the tagged files in the `sample` folder
- get rid of untagged words using text filters
- - facet by blank
- - remove matching rows
- remove punctuation
- standardize uppercase
- find unique values
- use facets, generate subsets of the data
- use clustering to disambiguate

Checkout the [OpenRefine documentation](https://github.com/OpenRefine/OpenRefine/wiki/Recipes) for further recipes ...

#### visualize
- carto db

