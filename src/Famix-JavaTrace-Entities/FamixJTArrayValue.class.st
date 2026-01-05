"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parent` | `FamixJTArrayValue` | `elements` | `FamixJTArrayReference` | |
| `value` | `FamixJTTValueContainer` | `usage` | `FamixJTValue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAtMaxDepth` | `Boolean` | false | |

"
Class {
	#name : 'FamixJTArrayValue',
	#superclass : 'FamixJTEntity',
	#traits : 'FamixJTTValueContainer',
	#classTraits : 'FamixJTTValueContainer classTrait',
	#instVars : [
		'#isAtMaxDepth => FMProperty defaultValue: false',
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
FamixJTArrayValue >> isAtMaxDepth [

	<FMProperty: #isAtMaxDepth type: #Boolean defaultValue: false>
	<generated>
	^ isAtMaxDepth ifNil: [ isAtMaxDepth := false ]
]

{ #category : 'accessing' }
FamixJTArrayValue >> isAtMaxDepth: anObject [
	<generated>
	isAtMaxDepth := anObject
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
