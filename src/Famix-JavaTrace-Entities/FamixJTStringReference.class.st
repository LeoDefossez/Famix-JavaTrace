"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `value` | `String` | nil | |

"
Class {
	#name : 'FamixJTStringReference',
	#superclass : 'FamixJTObjectReference',
	#instVars : [
		'#value => FMProperty'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTStringReference class >> annotation [

	<FMClass: #StringReference super: #FamixJTObjectReference>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTStringReference >> value [

	<FMProperty: #value type: #String>
	<generated>
	^ value
]

{ #category : 'accessing' }
FamixJTStringReference >> value: anObject [
	<generated>
	value := anObject
]
