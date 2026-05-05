Extension { #name : 'FamixJTArgument' }

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTArgument >> mooseNameOn: aStream [

	self parameter ifNotNil: [ :param |
			param name ifNotNil: [ :name |
					aStream
						nextPutAll: name;
						nextPutAll: ' = ' ] ].
	self value ifNotNil: [ :val | val mooseNameOn: aStream ] ifNil: [ aStream print: nil ]
]

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTArgument >> parameter [

	| arguments parameters |
	arguments := self traceMethod arguments.
	parameters := self traceMethod method parameters.

	arguments size = parameters size ifFalse: [ ^ nil ].

	^ parameters at: (arguments indexOf: self)
]
