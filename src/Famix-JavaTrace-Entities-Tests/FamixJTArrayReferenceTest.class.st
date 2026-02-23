"
A FamixCSArrayReferenceTest is a test class for testing the behavior of FamixCSArrayReference
"
Class {
	#name : 'FamixJTArrayReferenceTest',
	#superclass : 'TestCase',
	#instVars : [
		'reader'
	],
	#category : 'Famix-JavaTrace-Entities-Tests-Entities',
	#package : 'Famix-JavaTrace-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixJTArrayReferenceTest >> setUp [

	super setUp.

	reader := JavaTraceJsonReader new.
	reader model: (FamixJTModel new
			 name: 'testing';
			 yourself).
]

{ #category : 'importing' }
FamixJTArrayReferenceTest >> testSizeAddElement [
	"to test:
	- adding an element augment the size, and reseting element reset the size"

	| arrayReference |
	arrayReference := FamixJTArrayReference new
		                  addElement: FamixJTArrayValue new;
		                  yourself.
	self assert: arrayReference size equals: 1.

	"Remove the element"
	arrayReference elements: {  }.
	self assert: arrayReference size equals: 0
]

{ #category : 'importing' }
FamixJTArrayReferenceTest >> testSizeResetElements [
	"to test:
	- adding an element augment the size, and reseting element reset the size"

	| arrayReference |
	arrayReference := FamixJTArrayReference new.
	
	arrayReference elements: {  }.
	self assert: arrayReference size equals: 0
]
