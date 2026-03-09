"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `elements` | `FamixJTArrayReference` | `parent` | `FamixJTArrayValue` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isAtMaxDepth` | `Boolean` | false | |

"
Class {
	#name : 'FamixJTArrayReference',
	#superclass : 'FamixJTObjectReference',
	#instVars : [
		'#elements => FMMany type: #FamixJTArrayValue opposite: #parent',
		'#isAtMaxDepth => FMProperty defaultValue: false'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTArrayReference class >> annotation [

	<FMClass: #ArrayReference super: #FamixJTObjectReference>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixJTArrayReference >> addElement: anObject [
	<generated>
	^ self elements add: anObject
]

{ #category : 'accessing' }
FamixJTArrayReference >> elements [
	"Relation named: #elements type: #FamixJTArrayValue opposite: #parent"

	<generated>
	<derived>
	^ elements
]

{ #category : 'accessing' }
FamixJTArrayReference >> elements: anObject [

	<generated>
	elements value: anObject
]

{ #category : 'accessing' }
FamixJTArrayReference >> isAtMaxDepth [

	<FMProperty: #isAtMaxDepth type: #Boolean defaultValue: false>
	<generated>
	^ isAtMaxDepth ifNil: [ isAtMaxDepth := false ]
]

{ #category : 'accessing' }
FamixJTArrayReference >> isAtMaxDepth: anObject [
	<generated>
	isAtMaxDepth := anObject
]
