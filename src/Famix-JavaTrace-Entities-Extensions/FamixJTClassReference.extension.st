Extension { #name : 'FamixJTClassReference' }

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTClassReference >> mooseNameOn: aStream [

	typing
		ifNil: [ aStream print: nil ]
		ifNotNil: [ typing declaredType mooseNameOn: aStream ]
]
