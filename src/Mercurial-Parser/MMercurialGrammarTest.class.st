Class {
	#name : #MMercurialGrammarTest,
	#superclass : #PPCompositeParserTest,
	#category : #'Mercurial-Parser'
}

{ #category : #accessing }
MMercurialGrammarTest >> parserClass [
	^ MMercurialGrammar
]

{ #category : #tests }
MMercurialGrammarTest >> testChangeSetLine [
	self parse: 'changeset:   590:c918d08f5a80' rule: #changeSetLine
]

{ #category : #tests }
MMercurialGrammarTest >> testDateLine [
	self parse: 'date:        Fri Dec 07 15:57:34 2018 +0100' rule: #dateLine
]

{ #category : #tests }
MMercurialGrammarTest >> testEntries [
	self parse: 'changeset:   592:332a2177e208
user:        jbe
date:        Sat Dec 08 01:26:25 2018 +0100
summary:     Reduced indices on "issue" table

changeset:   591:d955519f7471
user:        jbe
date:        Fri Dec 07 17:49:53 2018 +0100
summary:     Renamed indices on issue to match naming convention

changeset:   590:c918d08f5a80
user:        jbe
date:        Fri Dec 07 15:57:34 2018 +0100
summary:     Added missing index on "member_useterms" table

' rule: #entries
]

{ #category : #tests }
MMercurialGrammarTest >> testEntry [
	self parse: 'changeset:   590:c918d08f5a80
user:        jbe
date:        Fri Dec 07 15:57:34 2018 +0100
summary:     Added missing index on "member_useterms" table
' rule: #entry
]

{ #category : #tests }
MMercurialGrammarTest >> testParentLine [
	self parse: 'parent:      576:eb5f4e4f17d8' rule: #parentLine
]

{ #category : #tests }
MMercurialGrammarTest >> testSummaryLine [
	self parse: 'summary:     Added missing index on "member_useterms" table' rule: #summaryLine
]

{ #category : #tests }
MMercurialGrammarTest >> testTagLine [
	self parse: 'tag:         tip' rule: #tagLine
]

{ #category : #tests }
MMercurialGrammarTest >> testUserLine [
	self parse: 'user:        jbe' rule: #userLine
]
