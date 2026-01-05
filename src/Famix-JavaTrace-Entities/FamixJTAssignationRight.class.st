"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `assignation` | `FamixJTAssignationRight` | `right` | `FamixJTAssignation` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FamixJTTValueContainer` | `usage` | `FamixJTValue` | |



"
Class {
	#name : 'FamixJTAssignationRight',
	#superclass : 'FamixJTEntity',
	#traits : 'FamixJTTValueContainer',
	#classTraits : 'FamixJTTValueContainer classTrait',
	#instVars : [
		'#assignation => FMOne type: #FamixJTAssignation opposite: #right'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTAssignationRight class >> annotation [

	<FMClass: #AssignationRight super: #FamixJTEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTAssignationRight >> assignation [
	"Relation named: #assignation type: #FamixJTAssignation opposite: #right"

	<generated>
	<container>
	<derived>
	^ assignation
]

{ #category : 'accessing' }
FamixJTAssignationRight >> assignation: anObject [

	<generated>
	assignation := anObject
]

{ #category : 'navigation' }
FamixJTAssignationRight >> assignationGroup [
	<generated>
	<navigation: 'Assignation'>
	^ MooseSpecializedGroup with: self assignation
]
