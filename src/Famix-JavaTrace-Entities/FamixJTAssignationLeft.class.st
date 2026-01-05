"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `assignation` | `FamixJTAssignationLeft` | `left` | `FamixJTAssignation` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FamixJTTValueContainer` | `usage` | `FamixJTValue` | |



"
Class {
	#name : 'FamixJTAssignationLeft',
	#superclass : 'FamixJTEntity',
	#traits : 'FamixJTTValueContainer',
	#classTraits : 'FamixJTTValueContainer classTrait',
	#instVars : [
		'#assignation => FMOne type: #FamixJTAssignation opposite: #left'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTAssignationLeft class >> annotation [

	<FMClass: #AssignationLeft super: #FamixJTEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTAssignationLeft >> assignation [
	"Relation named: #assignation type: #FamixJTAssignation opposite: #left"

	<generated>
	<container>
	<derived>
	^ assignation
]

{ #category : 'accessing' }
FamixJTAssignationLeft >> assignation: anObject [

	<generated>
	assignation := anObject
]

{ #category : 'navigation' }
FamixJTAssignationLeft >> assignationGroup [
	<generated>
	<navigation: 'Assignation'>
	^ MooseSpecializedGroup with: self assignation
]
