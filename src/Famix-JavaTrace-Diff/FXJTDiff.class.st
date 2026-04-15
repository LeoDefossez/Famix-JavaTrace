Class {
	#name : 'FXJTDiff',
	#superclass : 'Object',
	#category : 'Famix-JavaTrace-Diff',
	#package : 'Famix-JavaTrace-Diff'
}

{ #category : 'instance creation' }
FXJTDiff class >> baseModel: aJTModel targetModel: anotherJTModel [
	"Return the first index where method names doesnt match anymore"

	| aJTModel_trace anotherJTModel_trace |
	aJTModel_trace := (aJTModel allWithType: FamixJTTraceMethod) asOrderedCollection.
	anotherJTModel_trace := (anotherJTModel allWithType: FamixJTTraceMethod) asOrderedCollection.

	aJTModel_trace doWithIndex: [ :elem :i |
		(anotherJTModel_trace at: i ifAbsent: [ ^ i ]) method name = elem method name ifFalse: [ ^ i ] ]
]
