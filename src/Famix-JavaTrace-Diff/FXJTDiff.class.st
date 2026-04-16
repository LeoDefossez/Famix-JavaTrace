Class {
	#name : 'FXJTDiff',
	#superclass : 'Object',
	#instVars : [
		'baseModel',
		'targetModel'
	],
	#category : 'Famix-JavaTrace-Diff',
	#package : 'Famix-JavaTrace-Diff'
}

{ #category : 'instance creation' }
FXJTDiff class >> baseModel: aJTModel targetModel: anotherJTModel [

	^ self new baseModel: aJTModel targetModel: anotherJTModel
]

{ #category : 'instance creation' }
FXJTDiff class >> runOnBaseModel: aJTModel targetModel: anotherJTModel [

	^ self new runOnBaseModel: aJTModel targetModel: anotherJTModel
]

{ #category : 'accessing' }
FXJTDiff >> baseModel [

	^ baseModel
]

{ #category : 'accessing' }
FXJTDiff >> baseModel: aJTModel [

	baseModel := aJTModel
]

{ #category : 'as yet unclassified' }
FXJTDiff >> baseModel: aJTModel targetModel: anotherJTModel [

	self
		baseModel: aJTModel;
		targetModel: anotherJTModel
]

{ #category : 'accessing' }
FXJTDiff >> resolveDiff [
	
	self subclassResponsibility 
]

{ #category : 'accessing' }
FXJTDiff >> runOnBaseModel: aJTModel targetModel: anotherJTModel [
	
	self baseModel: aJTModel targetModel: anotherJTModel.
	^ self resolveDiff.
]

{ #category : 'accessing' }
FXJTDiff >> targetModel [

	^ targetModel
]

{ #category : 'accessing' }
FXJTDiff >> targetModel: aJTModel [

	targetModel := aJTModel
]
