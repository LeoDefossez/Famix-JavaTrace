Class {
	#name : 'FamixJTEntity',
	#superclass : 'MooseEntity',
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'meta' }
FamixJTEntity class >> metamodel [

	<generated>
	^ FamixJTModel metamodel
]

{ #category : 'testing' }
FamixJTEntity >> isQueryable [

	<generated>
	^ false
]
