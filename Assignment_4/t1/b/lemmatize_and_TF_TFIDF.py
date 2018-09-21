import csv
import nltk
import math
from operator import add
from nltk.stem import WordNetLemmatizer
wnl = WordNetLemmatizer()

lemmatizedDict = {}
terms_per_doc = [0] * 2000

headerParsed = 0
with open("input_non_lemmatized.csv") as f:
    for i,line in enumerate(f):
        if (headerParsed==0):
            headerParsed = 1
        else:
            myLine = line.split(';')
            theWord = myLine[-1]
            theWord = theWord.replace("\"", "")
            theWord = theWord.replace("\n", "")
            
            print theWord
            if theWord=="metadata_file":
                print '\nCOMPLETED LEMMATIZING...\n\n'
                break
            else:
                theWord = wnl.lemmatize(theWord)
                del myLine[-1]
                myLine = map(lambda elem: int(float(elem.replace("\"", ""))), myLine)

                #boolean_myLine = map(lambda elem: 0 if (elem==0) else 1, myLine)
                terms_per_doc = map(add, terms_per_doc, myLine)

                if theWord in lemmatizedDict:
                    lemmatizedDict[theWord] = map(add, myLine, lemmatizedDict[theWord])
                else:
                    lemmatizedDict[theWord] = myLine
                #print lemmatizedDict[theWord]

print len(lemmatizedDict)
del myLine[-1]
document_names = map(lambda elem: elem.replace("\"", ""), myLine)
# print document_names

num_docs = len(document_names)
#######################
## TERM COUNTS FILE
#######################
print 'WRITING TERM COUNTS TO FILE . . .'
### WRITE THE HEADER TO THE CSV FILE
wordlist = open('output_lemmatized_term_counts.csv', 'w')
wordlist.write("Word_ID,")
for doc in range(1,num_docs+1):
    if doc==num_docs:
        wordlist.write("%s\n" % document_names[doc-1])
    else:
        wordlist.write("%s," % document_names[doc-1])

### WRITE WORDS AND THEIR COUNT VECTORS TO FILE
for wordInfo in lemmatizedDict:
    wordlist.write("%s," % wordInfo)
    for doc in range(1,num_docs+1):
        if doc==num_docs:
            wordlist.write("%s\n" % lemmatizedDict[wordInfo][doc-1])
        else:
            wordlist.write("%s," % lemmatizedDict[wordInfo][doc-1])


#######################
## TERM FREQUENCIES FILE
#######################
print 'WRITING TF (term frequencies) AND TF-IDF TO FILE . . .'
### WRITE THE HEADER TO THE CSV FILE
file_tf = open('output_lemmatized_TF_(term_frequencies).csv', 'w')
file_tf.write("Word_ID,")
file_tfidf = open('output_lemmatized_TF-IDF.csv', 'w')
file_tfidf.write("Word_ID,")
for doc in range(1,num_docs+1):
    if doc==num_docs:
        file_tf.write("%s\n" % document_names[doc-1])
        file_tfidf.write("%s\n" % document_names[doc-1])
    else:
        file_tf.write("%s," % document_names[doc-1])
        file_tfidf.write("%s," % document_names[doc-1])

count=0
### WRITE WORDS AND THEIR COUNT VECTORS TO FILE
for wordInfo in lemmatizedDict:
    count += 1
    print 'Processing Word ' + str(count) + ' of ' + str(len(lemmatizedDict))
    term_counts = lemmatizedDict[wordInfo]
    term_frequencies = map(lambda x,y: float(x)/float(y) if (y>0) else 0, term_counts, terms_per_doc)

    boolean_myWord = map(lambda elem: 0 if (elem==0) else 1, term_counts)
    docs_containing_myWord = sum(boolean_myWord)

    tfidf = map(lambda x: x * math.log((float(num_docs) / float(docs_containing_myWord)),10), term_frequencies)

    file_tf.write("%s," % wordInfo)
    file_tfidf.write("%s," % wordInfo)
    for doc in range(1,num_docs+1):
        if doc==num_docs:
            file_tf.write("%s\n" % term_frequencies[doc-1])
            file_tfidf.write("%s\n" % tfidf[doc-1])
        else:
            file_tf.write("%s," % term_frequencies[doc-1])
            file_tfidf.write("%s," % tfidf[doc-1])

