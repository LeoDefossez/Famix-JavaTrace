"
## Usage 
```
file := '/Path/To/.../JDIOutput.tr' asFileReference.
model := CallStackJsonReader import: file.
```
	
	

"
Class {
	#name : 'JavaTraceJsonReader',
	#superclass : 'Object',
	#instVars : [
		'filename',
		'model',
		'createdPrimitives',
		'createdClasses',
		'createdMethods',
		'createdReference',
		'createdSourcesPackages',
		'defaultPackage'
	],
	#category : 'Famix-JavaTrace-Importer',
	#package : 'Famix-JavaTrace-Importer'
}

{ #category : 'api' }
JavaTraceJsonReader class >> import: aFileReference [

	^ self new readFrom: aFileReference
]

{ #category : 'class initialization' }
JavaTraceJsonReader class >> initialize [

	self registerExternalDropHandler
]

{ #category : 'class initialization' }
JavaTraceJsonReader class >> registerExternalDropHandler [
	ExternalDropHandler registerHandler: (ExternalDropHandler type: nil extension: #tr action: [ :fileReference |
				 (self import: fileReference)
					 install;
					 inspect ])
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createArgument: aCollection [
	"Instiantiate an argument given to a method in a TraceMethod"
	| arg |
	arg := model newArgument.
	aCollection ifNotNil: [ arg value: (self createValueWith: aCollection) ].
	^ arg
]

{ #category : 'as yet unclassified' }
JavaTraceJsonReader >> createArguments: aDictionary forTraceMethod: aTraceMethod [

	| accessible argValuesDict |
	"Default: accessible if not specified"
	accessible := aDictionary at: #accessible ifAbsent: true.
	"Default: accessible if not specified"
	argValuesDict := aDictionary at: #argsValues ifAbsent: nil.
	aTraceMethod isArgsAccessible: accessible.

	"Checking if the method call has a valid construction
	Should be either
	- accessible and have a value
	- inaccessible and dont have a value"
	accessible ~= argValuesDict notNil ifTrue: [
			Error signal:
				'Invalid methodCall arguments accessibility or description' ].

	accessible
		ifTrue: [
				argValuesDict do: [ :argDict |
					aTraceMethod addArgument: (self createArgument: argDict) ] ]
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createArrayValueWith: aCollection [
	"Instantiate an ArrayValue"
	^ self fillValueCheckingMaxDepthOn: model newArrayValue with: aCollection.
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createClassNamed: aString [
	"Instantiate a FamixJavaClass with the given name"

	| sequence container name |
	sequence := (aString removeSuffix: '[]') splitOn: $..
	name := sequence last.

	container := self createPackageFromStringCollection: sequence allButLast.
	^ createdClasses at: name ifAbsentPut: [
			  (model newClassNamed: name)
				  typeContainer: container;
				  isStub: true;
				  yourself ]
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createField: aDictionary [
	"Instantiate a field from a ClassReference"

	| field valueDict accessible |
	"Default: accessible if not specified"
	accessible := aDictionary at: #accessible ifAbsent: [ true ].
	"Default: nil if not specified"
	valueDict := aDictionary at: #value ifAbsent: nil.

	"Checking if the field has a valid construction
	Should be either
	- accessible and have a value
	- inaccessible and dont have a value"
	accessible ~= (aDictionary includesKey: #value) ifTrue: [
		Error signal: 'Field has not a valid construction' ].

	field := model newField
		         name: (aDictionary at: #name);
		         isAccessible: accessible;
		         yourself.

	^ self fillValueCheckingMaxDepthOn: field with: valueDict
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createMethod: aDictionary [
	"Instantiate a FamixJavaMethod with all given informations"

	| paramTypeNames methodNameDict methodTypesDict |
	paramTypeNames := (aDictionary at: #parameters) collect: [ :param | param at: #type ].

	methodNameDict := createdMethods at: (aDictionary at: #name) ifAbsentPut: [ Dictionary new ].

	methodTypesDict := methodNameDict at: (aDictionary at: #parentType) ifAbsentPut: [ Dictionary new ].

	^ methodTypesDict at: paramTypeNames ifAbsentPut: [ self instantiateMethodFrom: aDictionary ]
]

{ #category : 'accessing' }
JavaTraceJsonReader >> createPackageFromStringCollection: aCollection [

	| currentParent |
	"if the collection is empty then return the default package"
	aCollection ifEmpty: [ ^ self defaultPackage ].
	
	"Search for the source package"
	currentParent := createdSourcesPackages at: aCollection first ifAbsentPut: [ model newPackageNamed: aCollection first ].

	"If we are in a source package, then return it now"
	aCollection size = 1 ifTrue: [ ^ currentParent ].

	"If in nested package create all and return the deepest one"
	aCollection allButFirst do: [ :each | currentParent := self createPackageNamed: each withParent: currentParent ].
	^ currentParent
]

{ #category : 'accessing' }
JavaTraceJsonReader >> createPackageNamed: aString withParent: aPackage [

	^ aPackage childEntities detect: [ :each | each name = aString ] ifNone: [
			  (model newPackageNamed: aString)
				  parentPackage: aPackage;
				  yourself ]
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createParameters: anArray [
	"Instantiates all parameters of a method"

	^ anArray collect: [ :param |
		  self createTypingFor: (model newParameterNamed: (param at: #name)) with: (self createClassNamed: (param at: #type)) ]
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createPrimitiveType: aString [
	"Instantiate a PrimitiveType if not already on the model"
	| name |
	name := aString removeSuffix: '[]'.
	^ createdClasses at: name ifAbsentPut: [
			  (model newPrimitiveTypeNamed: name)
				  isStub: true;
				  yourself ]
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createPrimitiveValue: aDictionary [
	"Instantiate a PrimitiveValue"

	| primVal |
	primVal := model newPrimitiveValue.
	self createTypingFor: primVal with: (self createPrimitiveType: (aDictionary at: #type)).
	primVal value: (aDictionary at: #value).
	^ primVal
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createReceiver: aDictionary [
	"Instantiate the receiver of in a TraceMethod"

	aDictionary at: #reference ifPresent: [ :reference | ^ model newReceiver value: (self createValueReference: (aDictionary at: #reference)) ].
	aDictionary at: #primitiveValue ifPresent: [ :primitive | Error signal: 'Receiver should not be a primitiveType argument value' ].
	Error signal: 'Unexcepted receiver value'
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createTraceElement: aDictionary [
	"Instantiate an element of a trace"

	"NOTE : IT IS IMPORTANT TO FOLLOW THE STEPS
		1. Method
		2. Arguments
		3. Receiver
		BECAUSE THE JAVA EXTRACTOR NEED FOLLOW THIS EXACT ORDER TO CREATE ALREADY FOUND REFERENCES"

	| line |
	line := model newTraceMethod.

	aDictionary
		at: #method
		ifPresent: [ :methodDict | line method: (self createMethod: methodDict) ]
		ifAbsent: [ Error signal: 'MethodCall has no method' ].

	self createArguments: (aDictionary at: #arguments) forTraceMethod: line.

	(aDictionary at: #receiver) ifNotNil: [ :receiver | line receiver: (self createReceiver: receiver) ].
	line method: (self createMethod: (aDictionary at: #method)).

	^ line
]

{ #category : 'as yet unclassified' }
JavaTraceJsonReader >> createTypingFor: anObject with: type [

	^ anObject
		  typing: (model newEntityTyping declaredType: type);
		  yourself
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createValueReference: aDictionary [
	"Instantiate a ValueReference"

	| reference type uniqueId typeName |
	uniqueId := aDictionary at: #uniqueId.

	"Check alreadyFound case"
	(aDictionary at: #alreadyFound ifAbsent: [ false ]) ifTrue: [
			^ createdReference at: uniqueId ifAbsent: [
				  Error signal:
					  'The objectReference with ID: ' , uniqueId asString , ' is indicated to be already found, but is not in the saved references' ] ].

	"Ensure no duplicate creation"
	reference := createdReference
		             at: uniqueId
		             ifPresent: [
		             Error signal:
			             'Trying to create an object with ID: ' , uniqueId asString , ' while an existing ObjectReference already has this ID' ]
		             ifAbsentPut: [ (self instantiateReferenceEntityFrom: aDictionary) uniqueID: uniqueId ].

	"Fill reference"
	reference fillFrom: (aDictionary at: #refered) reader: self.
	
	typeName := aDictionary at: #type.
	"Determine type"
	type := (typeName includesSubstring: '.')
		        ifTrue: [ self createClassNamed: typeName ]
		        ifFalse: [ self createPrimitiveType: typeName ].

	self createTypingFor: reference with: type.

	^ reference
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> createValueWith: aDictionnary [
	"Choose which subTypes of a Value should be instantiated"

	"Looking for either a reference or a primitive type, if neither are present throw an error"

	aDictionnary at: #reference ifPresent: [ :reference | ^ self createValueReference: reference ].
	aDictionnary at: #primitiveValue ifPresent: [ :primitive | ^ self createPrimitiveValue: primitive ].
	Error signal: 'Unexcepted argument value'
]

{ #category : 'accessing' }
JavaTraceJsonReader >> defaultPackage [

	^ defaultPackage ifNil: [ defaultPackage := model newPackageNamed: '<Default Package>' ]
]

{ #category : 'as yet unclassified' }
JavaTraceJsonReader >> fillValueCheckingMaxDepthOn: aCSObject with: aCollection [

	^ aCollection
		  ifNotNil: [
				  aCollection isString
					  ifTrue: [
							  (aCollection sameAs: '<<MAX_DEPTH_REACHED>>')
								  ifTrue: [ aCSObject isAtMaxDepth: true ]
								  ifFalse: [ Error signal: 'Uneccepted String in field import :' , aCollection ] ]
					  ifFalse: [ aCSObject value: (self createValueWith: aCollection) ] ]
		  ifNil: [ aCSObject ]
]

{ #category : 'initialization' }
JavaTraceJsonReader >> initialize [

	createdReference := Dictionary new.
	createdPrimitives := Dictionary new.
	createdClasses := Dictionary new.
	createdMethods := Dictionary new.
	createdSourcesPackages := Dictionary new
]

{ #category : 'as yet unclassified' }
JavaTraceJsonReader >> instantiateMethodFrom: aDictionnary [

	| method |
	method := (model newMethodNamed: (aDictionnary at: #name)) isStub: true.

	method isClassSide: (aDictionnary at: #isClassSide).
	method parentType: (self createClassNamed: (aDictionnary at: #parentType)).
	method signature: (aDictionnary at: #signature).

	(self createParameters: (aDictionnary at: #parameters)) do: [ :param | method addParameter: param ].
	^ method
]

{ #category : 'accessing' }
JavaTraceJsonReader >> instantiateReferenceEntityFrom: aDictionary [

	| refered |
	refered := aDictionary at: #refered.
	refered isDictionary ifTrue: [
			refered at: #fields ifPresent: [ :fields | ^ model newClassReference ].
			refered at: #elements ifPresent: [ :elements | ^ model newArrayReference ] ].

	refered isString ifTrue: [
			^ (refered sameAs: '<<CLASS_NOT_PREPARED>>')
				  ifTrue: [
						  model newClassReference
							  isPrepared: false;
							  yourself ]
				  ifFalse: [ model newStringReference ] ].
	Error signal: 'Should either be String or dictionary'
]

{ #category : 'accessing' }
JavaTraceJsonReader >> model [
	^ model
]

{ #category : 'accessing' }
JavaTraceJsonReader >> model: aModel [

	model := aModel
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> read: json [
	"Instantiate the JavaCallStack model from a json object"

	| stack lines valueIndependents |
	json ifEmpty: [ Error signal: 'The json file is empty' ] ifNotEmpty: [
			model := FamixJTModel new
				         name: filename;
				         yourself.
			stack := model newTrace.

			valueIndependents := json at: #valueIndependents.
			lines := json at: #Lines.

			lines do: [ :line |
					valueIndependents ifTrue: [ createdReference := Dictionary new ].
					stack addTraceElement: (self createTraceElement: line) ].
			"reset moose name to make sure no error appear"
			model entities do: #resetMooseName ]
]

{ #category : 'instance creation' }
JavaTraceJsonReader >> readFrom: aFileReference [
	"Read the file reference as a json file and start the import as a JavaCallStack model"

	| reader |
	filename := aFileReference basename.
	reader := NeoJSONReader on: aFileReference readStream.
	self read: reader next.
	reader close.

	^ model
]
