#!/bin/sh

# for url in $(cat $1)
# do
#     curl -LO $url
# done

if [ ! -d "$2/tagged" ]; then
    mkdir $2/tagged
fi

for f in $2/*.txt
do
    base=$(basename $f)
    
    echo '\n'
    echo "java -mx700m -cp '$1/stanford-ner.jar' edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier $1/classifiers/english.muc.7class.distsim.crf.ser.gz -textFile $f -outputFormat tabbedEntities > sample/tagged/${base%_djvu.txt}.tsv"
    echo "\n"

    java -mx700m -cp "$1/stanford-ner.jar" edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier "$1/classifiers/english.muc.7class.distsim.crf.ser.gz" -textFile $f -outputFormat tabbedEntities > "$2/tagged/${base%_djvu.txt}.tsv"
done