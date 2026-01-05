"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `fields` | `FamixJTClassReference` | `parent` | `FamixJTField` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isPrepared` | `Boolean` | true | |

"
Class {
	#name : 'FamixJTClassReference',
	#superclass : 'FamixJTObjectReference',
	#instVars : [
		'#isPrepared => FMProperty defaultValue: true',
		'#fields => FMMany type: #FamixJTField opposite: #parent'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTClassReference class >> annotation [

	<FMClass: #ClassReference super: #FamixJTObjectReference>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixJTClassReference >> addField: anObject [
	<generated>
	^ self fields add: anObject
]

{ #category : 'accessing' }
FamixJTClassReference >> fields [
	"Relation named: #fields type: #FamixJTField opposite: #parent"

	<generated>
	<derived>
	^ fields
]

{ #category : 'accessing' }
FamixJTClassReference >> fields: anObject [

	<generated>
	fields value: anObject
]

{ #category : 'accessing' }
FamixJTClassReference >> isPrepared [

	<FMProperty: #isPrepared type: #Boolean defaultValue: true>
	<generated>
	^ isPrepared ifNil: [ isPrepared := true ]
]

{ #category : 'accessing' }
FamixJTClassReference >> isPrepared: anObject [
	<generated>
	isPrepared := anObject
]
