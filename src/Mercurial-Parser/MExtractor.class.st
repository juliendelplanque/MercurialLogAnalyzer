Class {
	#name : #MExtractor,
	#superclass : #MMercurialGrammar,
	#pools : [
		'ChronologyConstants'
	],
	#category : #'Mercurial-Parser'
}

{ #category : #rules }
MExtractor >> changeSetLine [
	^ super changeSetLine ==> [ :tokens |
		String newFrom: tokens last ]
]

{ #category : #rules }
MExtractor >> dateLine [
	^ super dateLine ==> [ :tokens |
		|dateAndTimeString|
		dateAndTimeString := String newFrom: tokens last.
		self parseMercurialDateAndTime: dateAndTimeString ]
]

{ #category : #accessing }
MExtractor >> entries [
	^ super entries ==> [ :tokens |
		tokens first reject: #isCharacter ]
]

{ #category : #rules }
MExtractor >> entry [
	^ super entry ==> [ :tokens |
		MCommit new
			changeset: (tokens at: 1);
			tag: ((tokens at: 3) ifNotNil: #first);
			parents: ((tokens at: 4) ifNil: [ #() ] ifNotNil: [ :col | col first reject: #isCharacter ]);
			user: (tokens at: 5);
			dateAndTime: (tokens at: 7);
			summary: (tokens at: 9);
			yourself ]
]

{ #category : #rules }
MExtractor >> parentLine [
	^ super parentLine ==> [ :tokens |
		String newFrom: tokens last ]
]

{ #category : #parsing }
MExtractor >> parseMercurialDateAndTime: aString [
	| splitted monthNumber dayNumber year time date duration |
	splitted := aString splitOn: Character space.
	dayNumber := splitted third asInteger.
	monthNumber := MonthNames detectIndex: [ :monthName | (monthName first: 3) = splitted second ].
	year := splitted fifth asInteger.
	time := splitted fourth asTime.
	date := Date year: year month: monthNumber day: dayNumber.
	splitted sixth in: [ :offsetString |
		duration := Duration minutes: (offsetString copyFrom: 2 to: 3) asInteger * 60 + (offsetString copyFrom: 4 to: 5) asInteger.
		offsetString first = $-
			ifTrue: [ duration := duration negated ] ].
	^ DateAndTime date: date time: time
]

{ #category : #rules }
MExtractor >> summaryLine [
	^ super summaryLine ==> [ :tokens |
		String newFrom: tokens last ]
]

{ #category : #rules }
MExtractor >> tagLine [
	^ super tagLine ==> [ :tokens |
		String newFrom: tokens last ]
]

{ #category : #rules }
MExtractor >> userLine [
	^ super userLine ==> [ :tokens |
		String newFrom: tokens last ]
]
