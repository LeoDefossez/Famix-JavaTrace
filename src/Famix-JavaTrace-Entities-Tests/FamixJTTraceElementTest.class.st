"
A FamixCSStacklineTest is a test class for testing the behavior of FamixCSStackline
"
Class {
	#name : 'FamixJTTraceElementTest',
	#superclass : 'TestCase',
	#category : 'Famix-JavaTrace-Entities-Tests-Entities',
	#package : 'Famix-JavaTrace-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'tests' }
FamixJTTraceElementTest >> testIndex [

	| trace traceElement1 traceElement2 |
	trace := FamixJTTrace new.

	trace := FamixJTTrace new.
	trace addTraceElement: (traceElement1 := FamixJTTraceElement new).
	trace addTraceElement: (traceElement2 := FamixJTTraceElement new).

	self assert: traceElement1 positionInTrace equals: 1.
	self assert: traceElement2 positionInTrace equals: 2
]

{ #category : 'tests' }
FamixJTTraceElementTest >> testNext [

	| trace traceElement1 traceElement2 |
	trace := FamixJTTrace new.

	trace := FamixJTTrace new.
	trace addTraceElement: (traceElement1 := FamixJTTraceElement new).
	trace addTraceElement: (traceElement2 := FamixJTTraceElement new).

	self assert: traceElement1 next equals: traceElement2
]

{ #category : 'tests' }
FamixJTTraceElementTest >> testPrevious [

	| trace traceElement1 traceElement2 |
	trace := FamixJTTrace new.

	trace := FamixJTTrace new.
	trace addTraceElement: (traceElement1 := FamixJTTraceElement new).
	trace addTraceElement: (traceElement2 := FamixJTTraceElement new).

	self assert: traceElement2 previous equals: traceElement1
]
