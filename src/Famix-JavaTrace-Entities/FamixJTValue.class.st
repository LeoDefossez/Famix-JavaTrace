"
## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `usage` | `FamixJTValue` | `value` | `FamixJTTValueContainer` | |



"
Class {
	#name : 'FamixJTValue',
	#superclass : 'FamixJTEntity',
	#traits : 'FamixTTypedEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTTypedEntity classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#usage => FMMany type: #FamixJTTValueContainer opposite: #value'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTValue class >> annotation [

	<FMClass: #Value super: #FamixJTEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixJTValue >> addUsage: anObject [
	<generated>
	^ self usage add: anObject
]

{ #category : 'accessing' }
FamixJTValue >> usage [
	"Relation named: #usage type: #FamixJTTValueContainer opposite: #value"

	<generated>
	<derived>
	^ usage
]

{ #category : 'accessing' }
FamixJTValue >> usage: anObject [

	<generated>
	usage value: anObject
]
