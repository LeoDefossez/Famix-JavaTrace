Extension { #name : 'FamixJTClassReferenceTest' }

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTClassReferenceTest >> testFillFromClassNotPrepared [

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

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTClassReferenceTest >> testFillFromDoesAddFields [

	| classReference |
	classReference := reader model newClassReference.
	classReference fillFrom: '<<CLASS_NOT_PREPARED>>' reader: reader.
	self assert: classReference fields size equals: 0.
	self assert: classReference isPrepared not
]
