Class {
	#name : #MCommit,
	#superclass : #Object,
	#instVars : [
		'changeset',
		'user',
		'dateAndTime',
		'summary'
	],
	#category : #'Mercurial-Model'
}

{ #category : #accessing }
MCommit >> changeset [
	^ changeset
]

{ #category : #accessing }
MCommit >> changeset: anObject [
	changeset := anObject
]

{ #category : #accessing }
MCommit >> dateAndTime [
	^ dateAndTime
]

{ #category : #accessing }
MCommit >> dateAndTime: anObject [
	dateAndTime := anObject
]

{ #category : #accessing }
MCommit >> summary [
	^ summary
]

{ #category : #accessing }
MCommit >> summary: anObject [
	summary := anObject
]

{ #category : #accessing }
MCommit >> user [
	^ user
]

{ #category : #accessing }
MCommit >> user: anObject [
	user := anObject
]
