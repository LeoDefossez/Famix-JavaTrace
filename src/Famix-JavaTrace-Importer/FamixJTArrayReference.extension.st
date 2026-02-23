Extension { #name : 'FamixJTArrayReference' }

{ #category : '*Famix-JavaTrace-Importer' }
FamixJTArrayReference >> fillFrom: aCollection reader: aJTReader [ 

	(aCollection at: 'elements') do: [ :elem | self addElement: (aJTReader createArrayValueWith: elem) ]
]
