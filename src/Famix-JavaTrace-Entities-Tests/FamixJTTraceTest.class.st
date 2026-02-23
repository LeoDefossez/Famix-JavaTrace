"
A FamixCSStackTest is a test class for testing the behavior of FamixCSStack
"
Class {
	#name : 'FamixJTTraceTest',
	#superclass : 'TestCase',
	#instVars : [
		'trace'
	],
	#category : 'Famix-JavaTrace-Entities-Tests-Entities',
	#package : 'Famix-JavaTrace-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixJTTraceTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	
	trace := FamixJTTrace new.
]

{ #category : 'tests' }
FamixJTTraceTest >> testIndexOfLine [

	| elem1 elem2 |
	elem1 := trace addTraceElement: FamixJTTraceElement new.
	elem2 := trace addTraceElement: FamixJTTraceElement new.

	self assert: (trace indexOfElement: elem1) equals: 1.
	self assert: (trace indexOfElement: elem2) equals: 2
]

{ #category : 'tests' }
FamixJTTraceTest >> testNextTo [

	| elem1 elem2 |
	elem1 := trace addTraceElement: FamixJTTraceElement new.
	elem2 := trace addTraceElement: FamixJTTraceElement new.

	self assert: (trace nextTo: elem1) equals: elem2.
	self assert: (trace nextTo: elem2) equals: nil
]

{ #category : 'tests' }
FamixJTTraceTest >> testPreviousTo [

	| elem1 elem2 |
	elem1 := trace addTraceElement: FamixJTTraceElement new.
	elem2 := trace addTraceElement: FamixJTTraceElement new.

	self assert: (trace previousTo: elem2) equals: elem1.
	self assert: (trace previousTo: elem1) equals: nil.
]
