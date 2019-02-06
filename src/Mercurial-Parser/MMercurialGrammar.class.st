Class {
	#name : #MMercurialGrammar,
	#superclass : #PPCompositeParser,
	#instVars : [
		'changeSetLine',
		'dateLine',
		'summaryLine',
		'userLine',
		'entry',
		'tagLine',
		'entries',
		'parentLine'
	],
	#category : #'Mercurial-Parser'
}

{ #category : #rules }
MMercurialGrammar >> changeSetLine [
	^ 'changeset:' asParser , #space asParser plus , #newline asParser negate plus
]

{ #category : #rules }
MMercurialGrammar >> dateLine [
	^ 'date:' asParser , #space asParser plus , #newline asParser negate plus
]

{ #category : #rules }
MMercurialGrammar >> entries [
	^ (entry separatedBy: #newline asParser) , #newline asParser
]

{ #category : #rules }
MMercurialGrammar >> entry [
	^ changeSetLine , #newline asParser ,
	(tagLine , #newline asParser) optional ,
	((parentLine separatedBy: #newline asParser) , #newline asParser) optional ,
	userLine , #newline asParser ,
	dateLine , #newline asParser ,
	summaryLine , #newline asParser
]

{ #category : #rules }
MMercurialGrammar >> parentLine [
	^ 'parent:' asParser , #space asParser plus , #newline asParser negate plus
]

{ #category : #accessing }
MMercurialGrammar >> start [
	"Answer the production to start this parser with."
	
	^ entries end
]

{ #category : #rules }
MMercurialGrammar >> summaryLine [
	^ 'summary:' asParser , #space asParser plus , #newline asParser negate plus
]

{ #category : #rules }
MMercurialGrammar >> tagLine [
	^ 'tag:' asParser , #space asParser plus , #newline asParser negate plus
]

{ #category : #rules }
MMercurialGrammar >> userLine [
	^ 'user:' asParser , #space asParser plus , #newline asParser negate plus
]
