"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `value` | `Object` | nil | |

"
Class {
	#name : 'FamixJTPrimitiveValue',
	#superclass : 'FamixJTValue',
	#instVars : [
		'#value => FMProperty'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTPrimitiveValue class >> annotation [

	<FMClass: #PrimitiveValue super: #FamixJTValue>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTPrimitiveValue >> value [

	<FMProperty: #value type: #Object>
	<generated>
	^ value
]

{ #category : 'accessing' }
FamixJTPrimitiveValue >> value: anObject [
	<generated>
	value := anObject
]
