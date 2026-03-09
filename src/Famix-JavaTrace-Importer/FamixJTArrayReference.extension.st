Extension { #name : 'FamixJTArrayReference' }

{ #category : '*Famix-JavaTrace-Importer' }
FamixJTArrayReference >> fillFrom: aDictionary reader: aJTReader [

	aDictionary at: #atMaxDepth ifPresent: [ :value |
			value ifTrue: [
					aDictionary
						at: #elements
						ifPresent: [ :elems | elems ifNotEmpty: [ Error signal: 'ArrayReference at max depth is containing value' ] ].
					^ self
						  isAtMaxDepth: true;
						  yourself ] ].
	(aDictionary at: 'elements') do: [ :elem | self addElement: (aJTReader createArrayValueWith: elem) ]
]
