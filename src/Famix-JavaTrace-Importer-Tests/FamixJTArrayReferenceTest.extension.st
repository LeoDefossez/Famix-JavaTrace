Extension { #name : 'FamixJTArrayReferenceTest' }

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTArrayReferenceTest >> testFillFromDoesAddElements [

	| arrayReference |
	arrayReference := reader model newArrayReference.
	arrayReference
		fillFrom: (Dictionary new
				 at: #elements put: { JTStructureCreator simplePrimitiveValueDict };
				 yourself)
		reader: reader.
	self assert: arrayReference elements size equals: 1
]
