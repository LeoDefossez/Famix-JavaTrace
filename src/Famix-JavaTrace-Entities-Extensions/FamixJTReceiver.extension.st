Extension { #name : 'FamixJTReceiver' }

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTReceiver >> mooseNameOn: aStream [

	self value
		ifNil: [ aStream print: nil ]
		ifNotNil: [ self value mooseNameOn: aStream ]
]
