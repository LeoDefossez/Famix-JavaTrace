Extension { #name : 'FamixJTClassReference' }

{ #category : '*Famix-JavaTrace-Importer' }
FamixJTClassReference >> fillFrom: aDictionary reader: aCSReader [

	aDictionary at: #isPrepared ifPresent: [ :value |
			value ifFalse: [
					aDictionary
						at: #fields
						ifPresent: [ :elems |
						elems ifNotEmpty: [ Error signal: 'ClassReference is not prepared but still have fields informations' ] ].
					^ self
						  isPrepared: false;
						  yourself ] ].

	(aDictionary at: 'fields')
		collect: [ :fieldDict | aCSReader createField: (fieldDict at: #field) ]
		thenDo: [ :object | self addField: object ].
	^ self
]
