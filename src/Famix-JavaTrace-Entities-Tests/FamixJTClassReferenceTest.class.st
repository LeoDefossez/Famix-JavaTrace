"
A FamixCSClassReferenceTest is a test class for testing the behavior of FamixCSClassReference
"
Class {
	#name : 'FamixJTClassReferenceTest',
	#superclass : 'TestCase',
	#instVars : [
		'reader'
	],
	#category : 'Famix-JavaTrace-Entities-Tests-Entities',
	#package : 'Famix-JavaTrace-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixJTClassReferenceTest >> setUp [

	super setUp.

	reader := JavaTraceJsonReader new.
	reader model: (FamixJTModel new
			 name: 'testing';
			 yourself)
]
