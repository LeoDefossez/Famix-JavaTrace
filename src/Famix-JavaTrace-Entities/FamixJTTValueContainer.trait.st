"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FamixJTTValueContainer` | `usage` | `FamixJTValue` | |



"
Trait {
	#name : 'FamixJTTValueContainer',
	#instVars : [
		'#value => FMOne type: #FamixJTValue opposite: #usage'
	],
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#category : 'Famix-JavaTrace-Entities-Traits',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixJTTValueContainer classSide >> annotation [

	<FMClass: #TValueContainer super: #Object>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTTValueContainer >> value [
	"Relation named: #value type: #FamixJTValue opposite: #usage"

	<generated>
	^ value
]

{ #category : 'accessing' }
FamixJTTValueContainer >> value: anObject [

	<generated>
	value := anObject
]
