Extension { #name : 'FamixJTStringReferenceTest' }

{ #category : '*Famix-JavaTrace-Importer-Tests' }
FamixJTStringReferenceTest >> testFillFromDoesAddElements [

	| stringReference value |
	value := #imAString.
	stringReference := reader model newStringReference.
	stringReference fillFrom: value reader: reader.
	
	self assert: stringReference value equals: value
]
