Class {
	#name : #MExtractorTest,
	#superclass : #TestCase,
	#instVars : [
		'extractor'
	],
	#category : #'Mercurial-Parser'
}

{ #category : #running }
MExtractorTest >> setUp [
	super setUp.
	extractor := MExtractor new.
]

{ #category : #test }
MExtractorTest >> testParseMercurialDateAndTime [
	self
		assert: (extractor parseMercurialDateAndTime: 'Tue Nov 17 12:00:00 2009 +0100')
		equals: '2009-11-17T12:00:00+01:00' asDateAndTime
]
