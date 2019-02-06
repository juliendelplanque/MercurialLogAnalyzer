Class {
	#name : #MCommit,
	#superclass : #Object,
	#instVars : [
		'changeset',
		'user',
		'dateAndTime',
		'summary',
		'tag',
		'parents'
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
MCommit >> parents [
	^ parents
]

{ #category : #accessing }
MCommit >> parents: anObject [
	parents := anObject
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
MCommit >> tag [
	^ tag
]

{ #category : #accessing }
MCommit >> tag: anObject [
	tag := anObject
]

{ #category : #accessing }
MCommit >> user [
	^ user
]

{ #category : #accessing }
MCommit >> user: anObject [
	user := anObject
]
