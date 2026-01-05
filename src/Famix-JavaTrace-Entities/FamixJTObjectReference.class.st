"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `uniqueID` | `Number` | nil | |

"
Class {
	#name : 'FamixJTObjectReference',
	#superclass : 'FamixJTValue',
	#instVars : [
		'#uniqueID => FMProperty'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTObjectReference class >> annotation [

	<FMClass: #ObjectReference super: #FamixJTValue>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTObjectReference >> uniqueID [

	<FMProperty: #uniqueID type: #Number>
	<generated>
	^ uniqueID
]

{ #category : 'accessing' }
FamixJTObjectReference >> uniqueID: anObject [
	<generated>
	uniqueID := anObject
]
