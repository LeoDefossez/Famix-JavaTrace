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

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTArgument >> parameter [

	|  arguments parameters |
	
	arguments := self traceMethod arguments.
	parameters := self traceMethod invokedMethod parameters.
	
	arguments size = parameters size ifFalse: [ self error: 'Method does not have the same number of arguments and parameter' ].
	
	^ parameters at: (arguments indexOf: self)
	
	
]
