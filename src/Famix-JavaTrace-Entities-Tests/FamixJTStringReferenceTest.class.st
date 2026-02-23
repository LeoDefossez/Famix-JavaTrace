"
A FamixCSStringReferenceTest is a test class for testing the behavior of FamixCSStringReference
"
Class {
	#name : 'FamixJTStringReferenceTest',
	#superclass : 'TestCase',
	#instVars : [
		'reader'
	],
	#category : 'Famix-JavaTrace-Entities-Tests-Entities',
	#package : 'Famix-JavaTrace-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixJTStringReferenceTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	
	reader := JavaTraceJsonReader new.
	reader model: (FamixJTModel new
			 name: 'testing';
			 yourself)
]
