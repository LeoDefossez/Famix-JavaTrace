"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixJTArrayValue` | `elements` | `FamixJTArrayReference` | |
| `value` | `FamixJTTValueContainer` | `usage` | `FamixJTValue` | |



"
Class {
	#name : 'FamixJTArrayValue',
	#superclass : 'FamixJTEntity',
	#traits : 'FamixJTTValueContainer',
	#classTraits : 'FamixJTTValueContainer classTrait',
	#instVars : [
		'#parent => FMOne type: #FamixJTArrayReference opposite: #elements'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTArrayValue class >> annotation [

	<FMClass: #ArrayValue super: #FamixJTEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTArrayValue >> parent [
	"Relation named: #parent type: #FamixJTArrayReference opposite: #elements"

	<generated>
	^ parent
]

{ #category : 'accessing' }
FamixJTArrayValue >> parent: anObject [

	<generated>
	parent := anObject
]
