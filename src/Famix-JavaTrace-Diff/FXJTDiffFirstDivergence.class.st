Class {
	#name : 'FXJTDiffFirstDivergence',
	#superclass : 'FXJTDiff',
	#category : 'Famix-JavaTrace-Diff',
	#package : 'Famix-JavaTrace-Diff'
}

{ #category : 'as yet unclassified' }
FXJTDiffFirstDivergence >> resolveDiff [ 
	"Return the first index where method names doesnt match anymore"

	| baseModel_trace targetModel_trace |
	baseModel_trace := baseModel allWithType: FamixJTTraceMethod.
	targetModel_trace := targetModel allWithType: FamixJTTraceMethod.

	baseModel_trace doWithIndex: [ :elem :i |
		(targetModel_trace at: i ifAbsent: [ ^ i ]) method name = elem method name ifFalse: [ ^ i ] ].
	^ -1
]
