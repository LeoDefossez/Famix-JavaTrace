Extension { #name : 'FamixJTArgument' }

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTArgument >> mooseNameOn: aStream [

	self parameter name ifNotNil: [
			aStream
				nextPutAll: self parameter name;
				nextPutAll: ' = ' ].
	self value
		ifNotNil: [ :val | val mooseNameOn: aStream ]
		ifNil: [ aStream print: nil ]
]
