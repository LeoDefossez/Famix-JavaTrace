"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixJTField` | `fields` | `FamixJTClassReference` | |
| `value` | `FamixJTTValueContainer` | `usage` | `FamixJTValue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAccessible` | `Boolean` | true | |
| `isAtMaxDepth` | `Boolean` | false | |
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixJTField',
	#superclass : 'FamixJTEntity',
	#traits : 'FamixJTTValueContainer + FamixTNamedEntity',
	#classTraits : 'FamixJTTValueContainer classTrait + FamixTNamedEntity classTrait',
	#instVars : [
		'#isAtMaxDepth => FMProperty defaultValue: false',
		'#isAccessible => FMProperty defaultValue: true',
		'#parent => FMOne type: #FamixJTClassReference opposite: #fields'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTField class >> annotation [

	<FMClass: #Field super: #FamixJTEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTField >> isAccessible [

	<FMProperty: #isAccessible type: #Boolean defaultValue: true>
	<generated>
	^ isAccessible ifNil: [ isAccessible := true ]
]

{ #category : 'accessing' }
FamixJTField >> isAccessible: anObject [
	<generated>
	isAccessible := anObject
]

{ #category : 'accessing' }
FamixJTField >> isAtMaxDepth [

	<FMProperty: #isAtMaxDepth type: #Boolean defaultValue: false>
	<generated>
	^ isAtMaxDepth ifNil: [ isAtMaxDepth := false ]
]

{ #category : 'accessing' }
FamixJTField >> isAtMaxDepth: anObject [
	<generated>
	isAtMaxDepth := anObject
]

{ #category : 'accessing' }
FamixJTField >> parent [
	"Relation named: #parent type: #FamixJTClassReference opposite: #fields"

	<generated>
	^ parent
]

{ #category : 'accessing' }
FamixJTField >> parent: anObject [

	<generated>
	parent := anObject
]
