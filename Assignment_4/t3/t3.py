import sys
import scipy.io as sio
import nltk
from nltk.stem import WordNetLemmatizer
wnl = WordNetLemmatizer()

articles = []

myDict = {}
stopwords = nltk.corpus.stopwords.words('english');
netWords = []
count = 0;

WS = [];
DS = [];
wordID = 0;

def dumpclean(obj):
    if type(obj) == dict:
        for k, v in obj.items():
            if hasattr(v, '__iter__'):
                # print k
                dumpclean(v)
            # else:
                # print '%s : %s' % (k, v)
    elif type(obj) == list:
        for v in obj:
            if hasattr(v, '__iter__'):
                dumpclean(v)
            # else:
                # print v
    else:
        articles.append(obj)
        # print obj

def parseString(st):
    symbolString = "1234567890-~@#$%^&*(()_+=~<>?/,.;:!{}[]|\""
    for char in symbolString:
        if char in st:
          st = st.replace(char, "")
    if "'s" in st:
        st = st.replace("'s", "")
    if "-" in st:
        st.replace("-", " ")
    if len(st) > 1 and st[0] == "'":
        st = st[1:]
    if len(st) > 1 and st[-1] == "'":
        st = st[:-2]
    return st

print 'loading...'
test = sio.loadmat('TIME-articles.mat')
print 'TIME-articles loaded'
dumpclean(test)
print 'Articles stored in list'

for i in range(0,len(articles[0][0])):
	count +=1
	if count == 10:
		break
	for j in range(0,len(articles[0][0][i][0]) ):
		myWords = parseString( articles[0][0][i][0][j][0].strip().lower() )
		myWordsTokenized = nltk.word_tokenize(myWords)
		resultwords  = [word for word in myWordsTokenized if word.lower() not in stopwords]
		netWords = []
		for aWord in resultwords:
			lemmatized = wnl.lemmatize(aWord)
			netWords.append(lemmatized)
		for oneWord in netWords:
			if oneWord in myDict:
				if i not in myDict[oneWord]:
					myDict[oneWord] = myDict[oneWord] + [i]
			else:
				myDict[oneWord] = [i]

print 'Pre-processing complete'
# print myDict

thefile = open('WSDS.csv', 'w')

for word in myDict:
	wordID += 1
	for documentID in myDict[word]:
		documentID += 1
		WS.append(wordID)
		DS.append(documentID)
		thefile.write(str(wordID) + "," + str(documentID) +"\n")


thefile2 = open('wordsList.csv', 'w')
for word in myDict:
	thefile2.write(word + "\n")

print 'Exported to file'