"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `trace` | `FamixJTTraceElement` | `traceElements` | `FamixJTTrace` | |



"
Class {
	#name : 'FamixJTTraceElement',
	#superclass : 'FamixJTEntity',
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#trace => FMOne type: #FamixJTTrace opposite: #traceElements'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTTraceElement class >> annotation [

	<FMClass: #TraceElement super: #FamixJTEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTTraceElement >> trace [
	"Relation named: #trace type: #FamixJTTrace opposite: #traceElements"

	<generated>
	<container>
	^ trace
]

{ #category : 'accessing' }
FamixJTTraceElement >> trace: anObject [

	<generated>
	trace := anObject
]

{ #category : 'navigation' }
FamixJTTraceElement >> traceGroup [
	<generated>
	<navigation: 'Trace'>
	^ MooseSpecializedGroup with: self trace
]
