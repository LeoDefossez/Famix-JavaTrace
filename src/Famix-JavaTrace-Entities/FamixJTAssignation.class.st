"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `left` | `FamixJTAssignation` | `assignation` | `FamixJTAssignationLeft` | |
| `right` | `FamixJTAssignation` | `assignation` | `FamixJTAssignationRight` | |



"
Class {
	#name : 'FamixJTAssignation',
	#superclass : 'FamixJTTraceElement',
	#instVars : [
		'#left => FMOne type: #FamixJTAssignationLeft opposite: #assignation',
		'#right => FMOne type: #FamixJTAssignationRight opposite: #assignation'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTAssignation class >> annotation [

	<FMClass: #Assignation super: #FamixJTTraceElement>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTAssignation >> left [
	"Relation named: #left type: #FamixJTAssignationLeft opposite: #assignation"

	<generated>
	^ left
]

{ #category : 'accessing' }
FamixJTAssignation >> left: anObject [

	<generated>
	left := anObject
]

{ #category : 'navigation' }
FamixJTAssignation >> leftGroup [
	<generated>
	<navigation: 'Left'>
	^ MooseSpecializedGroup with: self left
]

{ #category : 'accessing' }
FamixJTAssignation >> right [
	"Relation named: #right type: #FamixJTAssignationRight opposite: #assignation"

	<generated>
	^ right
]

{ #category : 'accessing' }
FamixJTAssignation >> right: anObject [

	<generated>
	right := anObject
]

{ #category : 'navigation' }
FamixJTAssignation >> rightGroup [
	<generated>
	<navigation: 'Right'>
	^ MooseSpecializedGroup with: self right
]
