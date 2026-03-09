Extension { #name : 'FamixJTClassReferenceTest' }

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTClassReferenceTest >> testFillFromClassNotPreparedWithFields [

	| classReference classReferenceDict |
	classReference := reader model newClassReference.
	classReferenceDict := Dictionary new
		                      at: #isPrepared put: false;
		                      at: #fields put: { (Dictionary new
				                       at: #field put: JTStructureCreator simpleFieldDict;
				                       yourself) };
		                      yourself.

	self should: [ classReference fillFrom: classReferenceDict reader: reader ] raise: Error
]

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTClassReferenceTest >> testFillFromClassNotPreparedWithoutFields [

	| classReference classReferenceDict |
	classReference := reader model newClassReference.
	classReferenceDict := Dictionary new
		                      at: #isPrepared put: false;
		                      at: #fields put: {  };
		                      yourself.

	classReference fillFrom: classReferenceDict reader: reader.

	self assert: classReference fields size equals: 0
]

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTClassReferenceTest >> testFillFromClassPreparedWithFields [

	| classReference classReferenceDict |
	classReference := reader model newClassReference.
	classReferenceDict := Dictionary new
		                      at: #fields put: { (Dictionary new
				                       at: #field put: JTStructureCreator simpleFieldDict;
				                       yourself) };
		                      yourself.

	classReference fillFrom: classReferenceDict reader: reader.

	self assert: classReference fields size equals: 1
]

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTClassReferenceTest >> testFillFromClassPreparedWithoutFields [

	| classReference classReferenceDict |
	classReference := reader model newClassReference.
	classReferenceDict := Dictionary new
		                      at: #isPrepared put: true;
		                      at: #fields put: {  };
		                      yourself.

	classReference fillFrom: classReferenceDict reader: reader.

	self assert: classReference fields size equals: 0
]

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTClassReferenceTest >> testFillFromDoesAddFields [

	| classReference |
	classReference := reader model newClassReference.
	classReference
		fillFrom: (Dictionary new
				 at: #fields put: { (Dictionary new
						  at: #field put: JTStructureCreator simpleFieldDict;
						  yourself) };
				 yourself)
		reader: reader.
		
	self assert: classReference fields size equals: 1
]
