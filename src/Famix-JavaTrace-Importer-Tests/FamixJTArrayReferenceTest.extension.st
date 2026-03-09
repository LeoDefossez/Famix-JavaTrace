Extension { #name : 'FamixJTArrayReferenceTest' }

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTArrayReferenceTest >> testFillFromAtMaxDepthFalseWithAnElement [

	| arrayReference arrayReferenceDict |
	arrayReference := reader model newArrayReference.
	arrayReferenceDict := Dictionary new
		                      at: #atMaxDepth put: false;
		                      at: #elements put: { JTStructureCreator simplePrimitiveValueDict };
		                      yourself.

	arrayReference fillFrom: arrayReferenceDict reader: reader.

	self assert: arrayReference elements size equals: 1.
	self deny: arrayReference isAtMaxDepth
]

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTArrayReferenceTest >> testFillFromAtMaxDepthTrue [

	| arrayReference |
	arrayReference := reader model newArrayReference.
	arrayReference
		fillFrom: (Dictionary new
				 at: #atMaxDepth put: true;
				 at: #elements put: {  };
				 yourself)
		reader: reader.
		
	self assert: arrayReference elements size equals: 0.
	self assert: arrayReference isAtMaxDepth
]

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTArrayReferenceTest >> testFillFromAtMaxDepthTrueWithAnElement [

	| arrayReference arrayReferenceDict |
	arrayReference := reader model newArrayReference.
	arrayReferenceDict := Dictionary new
		                      at: #atMaxDepth put: true;
		                      at: #elements put: { JTStructureCreator simplePrimitiveValueDict };
		                      yourself.

	self should: [ arrayReference fillFrom: arrayReferenceDict reader: reader ] raise: Error.
]

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
