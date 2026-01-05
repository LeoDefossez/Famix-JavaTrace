"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixJTTEntityCreator',
	#category : 'Famix-JavaTrace-Entities-Model',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixJTTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newArgument [

	<generated>
	^ self add: FamixJTArgument new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newArrayReference [

	<generated>
	^ self add: FamixJTArrayReference new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newArrayValue [

	<generated>
	^ self add: FamixJTArrayValue new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newAssignation [

	<generated>
	^ self add: FamixJTAssignation new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newAssignationLeft [

	<generated>
	^ self add: FamixJTAssignationLeft new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newAssignationRight [

	<generated>
	^ self add: FamixJTAssignationRight new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newClassReference [

	<generated>
	^ self add: FamixJTClassReference new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newEntity [

	<generated>
	^ self add: FamixJTEntity new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newField [

	<generated>
	^ self add: FamixJTField new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newFieldNamed: aName [

	<generated>
	^ self add: (FamixJTField named: aName)
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newObjectReference [

	<generated>
	^ self add: FamixJTObjectReference new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newPrimitiveValue [

	<generated>
	^ self add: FamixJTPrimitiveValue new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newReceiver [

	<generated>
	^ self add: FamixJTReceiver new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newStringReference [

	<generated>
	^ self add: FamixJTStringReference new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newTrace [

	<generated>
	^ self add: FamixJTTrace new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newTraceElement [

	<generated>
	^ self add: FamixJTTraceElement new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newTraceMethod [

	<generated>
	^ self add: FamixJTTraceMethod new
]

{ #category : 'entity creation' }
FamixJTTEntityCreator >> newValue [

	<generated>
	^ self add: FamixJTValue new
]
