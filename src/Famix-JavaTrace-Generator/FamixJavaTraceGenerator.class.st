Class {
	#name : 'FamixJavaTraceGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'tValueContainer',
		'trace',
		'traceElement',
		'assignation',
		'traceMethod',
		'assignationLeft',
		'assignationRight',
		'entity',
		'argument',
		'receiver',
		'value',
		'primitiveValue',
		'objectReference',
		'classReference',
		'arrayReference',
		'stringReference',
		'field',
		'arrayValue',
		'invocation'
	],
	#category : 'Famix-JavaTrace-Generator',
	#package : 'Famix-JavaTrace-Generator'
}

{ #category : 'accessing' }
FamixJavaTraceGenerator class >> packageName [

    ^ #'Famix-JavaTrace-Entities'
]

{ #category : 'accessing' }
FamixJavaTraceGenerator class >> prefix [

    ^ #'FamixJT'
]

{ #category : 'accessing' }
FamixJavaTraceGenerator class >> submetamodels [

	^ { FamixJavaGenerator }
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> defineClassExternalDependencies [ 

	"Famix Java dependencies"
	invocation := self remoteEntity: #Invocation withPrefix: #FamixJava.
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> defineClassValueModel [

	value := builder newClassNamed: #Value.
	primitiveValue := builder newClassNamed: #PrimitiveValue.
	objectReference := builder newClassNamed: #ObjectReference.
	classReference := builder newClassNamed: #ClassReference.
	arrayReference := builder newClassNamed: #ArrayReference.
	stringReference := builder newClassNamed: #StringReference.

	field := builder newClassNamed: #Field.
	arrayValue := builder newClassNamed: #ArrayValue
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> defineClasses [

	super defineClasses.
	"Definning entities"
	entity := builder newClassNamed: #Entity.

	"Trace core"
	trace := builder newClassNamed: #Trace.
	traceElement := builder newClassNamed: #TraceElement.
	assignation := builder newClassNamed: #Assignation.
	traceMethod := builder newClassNamed: #TraceMethod.

	"Trace value containers"
	assignationLeft := builder newClassNamed: #AssignationLeft.
	assignationRight := builder newClassNamed: #AssignationRight.
	argument := builder newClassNamed: #Argument.
	receiver := builder newClassNamed: #Receiver.
	
	self defineClassValueModel.
	self defineClassExternalDependencies
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> defineHierarchy [

	super defineHierarchy.

	"Trace core"
	trace --|> entity.
	traceElement --|> entity.
	assignation --|> traceElement.
	traceMethod --|> traceElement.

	"Trace value containers"
	argument --|> entity.
	argument --|> tValueContainer.
	receiver --|> entity.
	receiver --|> tValueContainer.
	assignationLeft --|> entity.
	assignationLeft --|> tValueContainer.
	assignationRight --|> entity.
	assignationRight --|> tValueContainer.
	

	"querryable"
	trace --|> #TEntityMetaLevelDependency.
	traceElement --|> #TEntityMetaLevelDependency.

	self defineHierarchyValueModel
]

{ #category : 'as yet unclassified' }
FamixJavaTraceGenerator >> defineHierarchyValueModel [
	
	"inheritances"
	value --|> entity.
	primitiveValue --|> value.
	objectReference --|> value.
	classReference --|> objectReference.
	arrayReference --|> objectReference.
	stringReference --|> objectReference.
	field --|> entity.
	arrayValue --|> entity.

	"trait usages"
	value --|> #TTypedEntity.
	field --|> tValueContainer.
	field --|> #TNamedEntity.
	arrayValue --|> tValueContainer.

	"querryable"
	tValueContainer --|> #TEntityMetaLevelDependency.
	value --|> #TEntityMetaLevelDependency.
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> defineProperties [

	super defineProperties.
	self definePropertiesValueModel.


	traceMethod property: #isArgsAccessible type: #Boolean defaultValue: true
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> definePropertiesValueModel [
	
	primitiveValue property: #value type: #Object.
	stringReference property: #value type: #String.

	objectReference property: #uniqueID type: #Number.

	
	field property: #isAtMaxDepth type: #Boolean defaultValue: false .
	arrayValue property: #isAtMaxDepth type: #Boolean defaultValue: false .
	field property: #isAccessible type: #Boolean defaultValue: true.
	classReference property: #isPrepared type: #Boolean defaultValue: true.
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> defineRelations [

	super defineRelations.
	self defineRelationsValueModel.

	trace <>-* traceElement.
	traceMethod *- invocation.
	traceMethod <>- receiver.
	traceMethod -* argument.

	(assignation property: #left) <>- (assignationLeft property: #assignation).
	(assignation property: #right) <>- (assignationRight property: #assignation)
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> defineRelationsValueModel [
	

	(classReference property: #fields) -* (field property: #parent).
	(arrayReference property: #elements) -* (arrayValue property: #parent).

	(tValueContainer property: #value) *- (value property: #usage)
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> defineTraits [

	super defineTraits.
	self defineTraitsValueModel
]

{ #category : 'definition' }
FamixJavaTraceGenerator >> defineTraitsValueModel [

	tValueContainer := builder newTraitNamed: #TValueContainer
]
