Extension { #name : 'FamixJTArrayValue' }

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTArrayValue >> mooseNameOn: aStream [

	value ifNil: [ aStream print: nil ] ifNotNil: [ value mooseNameOn: aStream ]
]
