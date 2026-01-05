"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `traceElements` | `FamixJTTrace` | `trace` | `FamixJTTraceElement` | |



"
Class {
	#name : 'FamixJTTrace',
	#superclass : 'FamixJTEntity',
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#traceElements => FMMany type: #FamixJTTraceElement opposite: #trace'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTTrace class >> annotation [

	<FMClass: #Trace super: #FamixJTEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixJTTrace >> addTraceElement: anObject [
	<generated>
	^ self traceElements add: anObject
]

{ #category : 'accessing' }
FamixJTTrace >> traceElements [
	"Relation named: #traceElements type: #FamixJTTraceElement opposite: #trace"

	<generated>
	<derived>
	^ traceElements
]

{ #category : 'accessing' }
FamixJTTrace >> traceElements: anObject [

	<generated>
	traceElements value: anObject
]

{ #category : 'navigation' }
FamixJTTrace >> traceElementsGroup [
	<generated>
	<navigation: 'TraceElements'>
	^ MooseSpecializedGroup withAll: self traceElements asSet
]
