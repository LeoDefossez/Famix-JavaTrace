Class {
	#name : 'JavaTraceJsonReaderTest',
	#superclass : 'TestCase',
	#instVars : [
		'reader'
	],
	#category : 'Famix-JavaTrace-Importer-Tests',
	#package : 'Famix-JavaTrace-Importer-Tests'
}

{ #category : 'setup' }
JavaTraceJsonReaderTest >> setUp [

	super setUp.

	"Put here a common initialization logic for tests"
	reader := JavaTraceJsonReader new.
	reader model: (FamixJTModel new
			 name: 'testing';
			 yourself)
]

{ #category : 'createArrayArgument' }
JavaTraceJsonReaderTest >> testCreateArgumentCreatedArgumentIsInTheModel [

	| arg |
	arg := reader createArgument: nil.

	self assert: arg class equals: FamixJTArgument.
	self assert: (reader model includes: arg)
]

{ #category : 'createArrayArgument' }
JavaTraceJsonReaderTest >> testCreateArgumentWithNilValue [

	| arg |
	arg := reader createArgument: nil.
	
	self assert: arg value isNil.
]

{ #category : 'createArrayArgument' }
JavaTraceJsonReaderTest >> testCreateArgumentWithValue [

	| arg |
	"In this test we just need to know if a value is imported, how the value is imported is not useful here"
	arg := reader createArgument: JTStructureCreator simpleValueDict.
	
	self assert: arg value isNotNil.
]

{ #category : 'createClassNamed' }
JavaTraceJsonReaderTest >> testCreateClassCreatedClassIsInTheModel [

	| class |
	class := reader createClassNamed: 'Myclass[]'.
	
	self assert: class isClass.
	self assert: (reader model includes: class).
]

{ #category : 'createClassNamed' }
JavaTraceJsonReaderTest >> testCreateClassNamedArray [

	| class |
	"In FamixJava, no differencies are made on typing with an array of a class or with a class"
	class := reader createClassNamed: 'Myclass[]'.

	self assert: class isStub.
	self assert: class name equals: #Myclass
]

{ #category : 'createClassNamed' }
JavaTraceJsonReaderTest >> testCreateClassNamedHandlePackages [

	| class |
	class := reader createClassNamed: 'org.example.Pharo'.

	self assert: class name equals: 'Pharo'.
	self assert: class typeContainer name equals: 'example'.
	self assert: class typeContainer parentPackage name equals: 'org'
]

{ #category : 'createClassNamed' }
JavaTraceJsonReaderTest >> testCreateClassNamedNormal [
	| class name | 
	
	class := reader createClassNamed: (name := #Myclass).
	
	self assert: class isStub.
	self assert: class name equals: name.
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldAccessible [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #accessible put: true.

	field := reader createField: fieldDict.

	self assert: field isAccessible
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldCreatedFieldIsInTheModel [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.

	field := reader createField: fieldDict.

	self assert: field class equals: FamixJTField.
	self assert: (reader model includes: field)
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldNoName [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict removeKey: #name.

	self should: [ field := reader createField: fieldDict ] raise: Error
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldNoPrecsionOnAccessible [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict removeKey: #accessible ifAbsent: [ "not problem if already absent" ].

	field := reader createField: fieldDict.
	self assert: field isAccessible
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldNoValue [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict removeKey: #value ifAbsent: [ "no problem if already absent" ].
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldNoValueWhileAccessible [
	"Create a collection to test createField"

	| field fieldDict |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #accessible put: true.
	fieldDict removeKey: #value ifAbsent: [ "not problem if already absent" ].
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldNotAccessibleWithNoValue [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #accessible put: false.
	fieldDict removeKey: #value ifAbsent: [ "not problem if already absent" ].

	field := reader createField: fieldDict.
	self assert: field isAccessible not
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldValueWhileInaccessible [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #accessible put: false.
	fieldDict at: #value put: JTStructureCreator simpleValueDict.
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldValueWithNilValue [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #value put: nil.
	
	field := reader createField: fieldDict. 
	self assert: field value isNil
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldValueWithNilValueWhileInaccessible [
	"Create a collection to test createField"

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #value put: nil.
	fieldDict at: #accessible put: false.
	
	self should: [ field := reader createField: fieldDict ] raise: Error.
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodCreateTwoMethodIfDifferentNameButSameType [
	"Create two time the same method, and check if the is only one"

	reader createMethod: JTStructureCreator simpleMethodDict.
	reader createMethod: (JTStructureCreator simpleMethodDict
			 at: #name put: #imDIFFERENT;
			 yourself).

	self assert: (reader model entities select: [ :entity | entity isMethod ]) size equals: 2
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodCreateTwoMethodIfDifferentTypeButSameName [
	"Create two time the same method, and check if the is only one"

	reader createMethod: JTStructureCreator simpleMethodDict.
	reader createMethod: (JTStructureCreator simpleMethodDict
			 at: #parentType put: #ImDIFFERENT;
			 yourself).

	self assert: (reader model entities select: [ :entity | entity isMethod ]) size equals: 2
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodCreateTwoMethodsIfNotTheSameParameters [

	| methodDict method |
	"create a method making sure parameters is not empty"
	methodDict := JTStructureCreator simpleMethodDict
		              at: #parameters put: { JTStructureCreator simpleParameterDict };
		              yourself.
	method := reader createMethod: methodDict.

	"create a method making sure parameters is empty"
	methodDict := JTStructureCreator simpleMethodDict
		              at: #parameters put: {  };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: (reader model entities select: [ :entity | entity isMethod ]) size equals: 2
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodCreatedMethodIsInTheModel [

	| method |
	method := reader createMethod: JTStructureCreator simpleMethodDict.

	self assert: method isMethod.
	self assert: (reader model includes: method)
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodDontCreateTwice [
	"Create two time the same method, and check if the is only one"
	reader createMethod: JTStructureCreator simpleMethodDict.
	reader createMethod: JTStructureCreator simpleMethodDict.
	
	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 1
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is empty"
	methodDict := JTStructureCreator simpleMethodDict
		              at: #parameters put: {  };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: method parameters isEmpty
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodIsClassSide [
	"Create two time the same method, and check if the is only one"

	self assert: (reader createMethod: (JTStructureCreator simpleMethodDict
				  at: #isClassSide put: true;
				  yourself)) isClassSide.

	self assert: (reader createMethod: (JTStructureCreator simpleMethodDict
				  at: #isClassSide put: false; at:#name put:#imDIFFERENT;
				  yourself)) isClassSide not
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodIsStub [
	"Create two time the same method, and check if the is only one"
	
	| method |
	method := reader createMethod: JTStructureCreator simpleMethodDict.
	
	self assert: method isStub.
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodNotEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is not empty"
	methodDict := JTStructureCreator simpleMethodDict
		              at: #parameters put: { JTStructureCreator simpleParameterDict };
		              yourself.
	method := reader createMethod: methodDict.

	self assert: method parameters isNotEmpty
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodParentType [
	"Create two time the same method, and check if the is only one"
	| method name |
	method := (reader createMethod: (JTStructureCreator simpleMethodDict
				  at: #parentType put: (name := #Pharo);
				  yourself)).
				
	self assert: method parentType isClass.
	self assert: method parentType name equals: name.
]

{ #category : 'createPackage' }
JavaTraceJsonReaderTest >> testCreatePackageDefaultPackage [

	| package  |
	package := reader createPackageFromStringCollection: {  }.

	self assert: package name equals:  '<Default Package>'.
]

{ #category : 'createPackage' }
JavaTraceJsonReaderTest >> testCreatePackageFromStringCollection1Element [

	| package |
	package := reader createPackageFromStringCollection: { 'org' }.

	self assert: package name equals: 'org'.
]

{ #category : 'createPackage' }
JavaTraceJsonReaderTest >> testCreatePackageFromStringCollection2Elements [

	| package |
	package := reader createPackageFromStringCollection: { 'org'. 'example' }.

	self assert: package name equals: 'example'.
	self assert: package parentPackage name equals: 'org'
]

{ #category : 'createPackage' }
JavaTraceJsonReaderTest >> testCreatePackageFromStringCollectionReuseExistingPackages [

	| package1 package2 |
	package1 := reader createPackageFromStringCollection: { 'org'. 'example' }.
	package2 := reader createPackageFromStringCollection: { 'org'. 'test' }.

	self assert: package1 parentPackage identicalTo: package2 parentPackage.
]

{ #category : 'createParameters' }
JavaTraceJsonReaderTest >> testCreateParametersCreatedParametersAreInModel [

	| paramArray parameters |
	paramArray := { JTStructureCreator simpleParameterDict }.
	parameters := reader createParameters: paramArray.

	self assert: (reader model includesAll: parameters)
]

{ #category : 'createParameters' }
JavaTraceJsonReaderTest >> testCreateParametersEmpty [

	| paramArray paramResult |
	paramArray := {  }.
	paramResult := reader createParameters: paramArray.

	self assert: paramArray isEmpty
]

{ #category : 'createParameters' }
JavaTraceJsonReaderTest >> testCreateParametersName [

	| paramArray name parameters |
	paramArray := { (JTStructureCreator simpleParameterDict
		               at: #name put: (name := #args);
		               yourself) }.

	parameters := reader createParameters: paramArray.

	parameters do: [ :param | self assert: param name equals: name ]
]

{ #category : 'createParameters' }
JavaTraceJsonReaderTest >> testCreateParametersTyping [

	| paramArray type parameters |
	paramArray := { (JTStructureCreator simpleParameterDict
		               at: #type put: (type := #Pharo);
		               yourself) }.

	parameters := reader createParameters: paramArray.

	parameters do: [ :param | self assert: param typing declaredType name equals: type ]
]

{ #category : 'createParameters' }
JavaTraceJsonReaderTest >> testCreateParametersTypingPackage [

	| paramArray type parameters |
	paramArray := { (JTStructureCreator simpleParameterDict
		               at: #type put: (type := 'org.example.Pharo');
		               yourself) }.

	parameters := reader createParameters: paramArray.

	parameters do: [ :param | self assert: param typing declaredType name equals: 'Pharo' ].
	parameters do: [ :param | self assert: param typing declaredType typeContainer name equals: 'example' ].
	parameters do: [ :param | self assert: param typing declaredType typeContainer parentPackage name equals: 'org' ].
]

{ #category : 'createPrimitiveType' }
JavaTraceJsonReaderTest >> testCreatePrimitiveTypeCreatedPrimitiveTypeIsInTheModel [

	| primType |
	primType := reader createPrimitiveType: #int.

	self assert: primType isPrimitiveType.
	self assert: (reader model includes: primType)
]

{ #category : 'createPrimitiveType' }
JavaTraceJsonReaderTest >> testCreatePrimitiveTypeDeleteSuffix [
	| primType |
	"In FamixJava there is no diference in typing with array or single value"
	primType := reader createPrimitiveType: 'int[]'.

	self assert:  primType name equals: #int
]

{ #category : 'createPrimitiveType' }
JavaTraceJsonReaderTest >> testCreatePrimitiveTypeIsStub [
	| primType |
	primType := reader createPrimitiveType: #int.

	self assert:  primType isStub
]

{ #category : 'createPrimitiveValue' }
JavaTraceJsonReaderTest >> testCreatePrimitiveValueCreatedPrimitiveValueIsInTheModel [

	| primVal |
	primVal := reader createPrimitiveValue: (JTStructureCreator simplePrimitiveValueDict at: #primitiveValue).

	self assert: primVal class equals: FamixJTPrimitiveValue .
	self assert: (reader model includes: primVal)
]

{ #category : 'createPrimitiveValue' }
JavaTraceJsonReaderTest >> testCreatePrimitiveValueTyping [

	| primVal |
	primVal := reader createPrimitiveValue: ((JTStructureCreator simplePrimitiveValueDict at:#primitiveValue)
			            at: #type put: #int;
			            yourself).

	self assert: primVal typing declaredType name equals: #int
]

{ #category : 'createPrimitiveValue' }
JavaTraceJsonReaderTest >> testCreatePrimitiveValueWithValue [

	| primVal value |
	primVal := reader createPrimitiveValue: ((JTStructureCreator simplePrimitiveValueDict at: #primitiveValue)
			            at: #value put: (value := 42);
			            yourself).

	self assert: primVal value equals: value
]

{ #category : 'createPrimitiveValue' }
JavaTraceJsonReaderTest >> testCreatePrimitiveValueWithoutValue [

	| primValDict |
	primValDict := JTStructureCreator simplePrimitiveValueDict at: #primitiveValue.
	primValDict removeKey: #value ifAbsent: [ "No problem if already absent" ].
	self should: [ reader createPrimitiveValue: primValDict ] raise: Error
]

{ #category : 'createReceiver' }
JavaTraceJsonReaderTest >> testCreateReceiverIsInTheModel [

	| receiver |
	receiver := reader createReceiver: JTStructureCreator simpleArrayReferenceDict.

	self assert: receiver class equals: FamixJTReceiver.
	self assert: (reader model includes: receiver)
]

{ #category : 'createReceiver' }
JavaTraceJsonReaderTest >> testCreateReceiverNotAReference [

	self should: [ reader createReceiver: (JTStructureCreator simplePrimitiveValueDict at: #primitiveType) ] raise: Error
]

{ #category : 'createReceiver' }
JavaTraceJsonReaderTest >> testCreateReceiverWithReference [

	"Smoke test to make sure the reference we have is right"
	reader createReceiver: JTStructureCreator simpleArrayReferenceDict 
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementArgumentsAccessibleWithValue [
	"Smoke test, we just check if createTraceElement act as expected"

	| traceMethodDict argsDict |
	traceMethodDict := JTStructureCreator simpleTraceMethodDict.
	traceMethodDict at: #method put: (JTStructureCreator simpleMethodDict
			 at: #parameters put: { JTStructureCreator simpleParameterDict };
			 yourself).

	argsDict := traceMethodDict at: #arguments.
	argsDict at: #argsValues put: { JTStructureCreator simpleValueDict }.
	argsDict at: #accessible put: true.

	reader createTraceElement: traceMethodDict .
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementArgumentsAccessibleWithoutValue [

	| stacklineDict argsDict |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	argsDict := stacklineDict at: #arguments.
	argsDict removeKey: #argsValues ifAbsent: ["no problem if already absent"].
	argsDict at: #accessible put: true.

	self should: [ reader createTraceElement: stacklineDict ] raise: Error
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementArgumentsInAccessibleWithValue [

	| stacklineDict argsDict |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	argsDict := stacklineDict at: #arguments.
	argsDict at: #argsValues put: { JTStructureCreator simpleValueDict }.
	argsDict at: #accessible put: false.

	self should: [ reader createTraceElement: stacklineDict ] raise: Error
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementArgumentsInAccessibleWithoutValue [
	"Smoke test, this test just check if no error happen in this case"

	| stacklineDict argsDict |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	argsDict := stacklineDict at: #arguments.
	argsDict
		removeKey: #argsValues
		ifAbsent: [ "no problem if already absent" ].
	argsDict at: #accessible put: false.

	reader createTraceElement: stacklineDict
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementCheckMethodCreation [

	| stacklineDict methodCall |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	stacklineDict at: #method put: JTStructureCreator simpleMethodDict.

	methodCall := reader createTraceElement: stacklineDict.
	self assert: methodCall method isNotNil
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementCreatedTraceElementIsInTheModel [

	| traceMethod |
	traceMethod := reader createTraceElement: JTStructureCreator simpleTraceMethodDict.

	self assert: traceMethod class equals: FamixJTTraceMethod.
	self assert: (reader model includes: traceMethod)
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementLinkArgumentsAndParameters [

	| stacklineDict methodDict argsDict stackline |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.

	methodDict := stacklineDict at: #method put: JTStructureCreator simpleMethodDict.
	methodDict at: #parameters put: { JTStructureCreator simpleParameterDict }.

	argsDict := stacklineDict at: #arguments.
	argsDict at: #argsValues put: { JTStructureCreator simpleValueDict }.

	stackline := reader createTraceElement: stacklineDict.

	self assert: stackline arguments first parameter equals: stackline method parameters first
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementNoMethod [

	| stacklineDict |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	stacklineDict removeKey: #method ifAbsent: [ "No problem if already absent" ].
	self should: [ reader createTraceElement: stacklineDict ] raise: Error
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementReceiverNil [

	| stacklineDict stackline |
	stacklineDict := JTStructureCreator simpleTraceMethodDict
		                 at: #receiver put: nil;
		                 yourself.

	stackline := reader createTraceElement: stacklineDict.

	self assert: stackline receiver isNil
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementReceiverNotNil [

	| stacklineDict stackline |
	stacklineDict := JTStructureCreator simpleTraceMethodDict
		                 at: #receiver put: JTStructureCreator simpleArrayReferenceDict;
		                 yourself.

	stackline := reader createTraceElement: stacklineDict.

	self assert: stackline receiver isNotNil
]

{ #category : 'createTraceElement' }
JavaTraceJsonReaderTest >> testCreateTraceElementWithNoMethod [

	| stacklineDict |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	stacklineDict removeKey: #method ifAbsent: [ "No problem if already absent" ].
	self should: [ reader createTraceElement: stacklineDict ] raise: Error
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceAlreadyFoundWithAReferedValue [

	| arrayReferenceDict |
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict at: #reference.
	"Making sure there is a refered value"
	arrayReferenceDict at: #refered put: (Dictionary new
			 at: #elements put: {  };
			 yourself).
	arrayReferenceDict at: #alreadyFound put: true.

	self should: [ reader createValueReference: arrayReferenceDict ] raise: Error
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceAlreadyFoundWithoutAReferedValue [
	"Smoke test, we just check if createValueReference act as expected"
	| arrayReferenceDict |
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict at: #reference.
	arrayReferenceDict at: #alreadyFound put: false.
	"Create it to make the reader able to find a link with the first appearance"
	reader createValueReference: arrayReferenceDict.
	
	"Making sure there is a no refered value"
	arrayReferenceDict removeKey: #refered ifAbsent: [ "No problem if already absent" ].
	arrayReferenceDict at: #alreadyFound put: true.

	reader createValueReference: arrayReferenceDict
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceChooseClassAsTyping [

	| arrayReferenceDict arrayReference|
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict at: #reference.

	"Making sure there is a no refered value"
	arrayReferenceDict at:#type put:'my.app.Pharo'.
	
	arrayReference := reader createValueReference: arrayReferenceDict.
	
	self assert: arrayReference typing declaredType isClass.
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceChoosePrimitiveTypeAsTyping [

	| arrayReferenceDict arrayReference|
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict at: #reference.

	"Making sure there is a no refered value"
	arrayReferenceDict at:#type put:#int.
	
	arrayReference := reader createValueReference: arrayReferenceDict.
	
	self assert: arrayReference typing declaredType isPrimitiveType.
	
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceNotAlreadyFoundWithAReferedValue [
	"Smoke test, we just check if createValueReference hold the not already found value"

	| arrayReferenceDict |
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict
		                      at: #reference.
	"Making sure there is a refered value"
	arrayReferenceDict at: #refered put: (Dictionary new
			 at: #elements put: {  };
			 yourself).
	arrayReferenceDict at: #alreadyFound put: false.

	reader createValueReference: arrayReferenceDict
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceNotAlreadyFoundWithoutAReferedValue [

	| arrayReferenceDict |
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict at: #reference.

	"Making sure there is a no refered value"
	arrayReferenceDict removeKey: #refered ifAbsent: [ "No problem if already absent" ].
	arrayReferenceDict at: #alreadyFound put: false.

	self should: [ reader createValueReference: arrayReferenceDict ] raise: Error
]

{ #category : 'createValueWith' }
JavaTraceJsonReaderTest >> testCreateValueWithEmptyDictionary [

	self should: [ reader createValueWith: Dictionary new ] raise: Error
]

{ #category : 'createValueWith' }
JavaTraceJsonReaderTest >> testCreateValueWithPrimitiveType [
	"Smoke test, we just check if CreateValue hold with a primitive type"

	reader createValueWith: JTStructureCreator simplePrimitiveValueDict 
]

{ #category : 'createValueWith' }
JavaTraceJsonReaderTest >> testCreateValueWithReference [
	"Smoke test, we just check if createValueWith: hold with an ArrayReference"

	reader createValueWith: JTStructureCreator simpleArrayReferenceDict
]

{ #category : 'read' }
JavaTraceJsonReaderTest >> testReadValueIndependentsFalseAndError [

	| fileDict elem1 value1 elem2 value2 |
	value1 := JTStructureCreator simpleObjectReferenceDict
		          at: 'uniqueId' put: 1;
		          at: 'alreadyFound' put: false;
		          yourself.
	elem1 := JTStructureCreator simpleTraceMethodDict
		         at: 'receiver' put: value1;
		         yourself.

	value2 := JTStructureCreator simpleObjectReferenceDict
		          at: 'uniqueId' put: 1;
		          at: 'alreadyFound' put: false;
		          yourself.
	elem2 := JTStructureCreator simpleTraceMethodDict
		         at: 'receiver' put: value2;
		         yourself.

	fileDict := JTStructureCreator simpleFileDict.
	fileDict at: 'valueIndependents' put: false.
	fileDict at: 'Lines' put: {
			elem1.
			elem2 }.

	self should: [ reader read: fileDict ] raise: Error
]

{ #category : 'read' }
JavaTraceJsonReaderTest >> testReadValueIndependentsFalseAndNoError [
	"Smoke test, should not have error"

	| fileDict elem1 value1 elem2 value2 |
	value1 := JTStructureCreator simpleObjectReferenceDict
		          at: 'uniqueId' put: 1;
		          at: 'alreadyFound' put: false;
		          yourself.
	elem1 := JTStructureCreator simpleTraceMethodDict
		         at: 'receiver' put: value1;
		         yourself.

	value2 := Dictionary new
		          at: 'reference' put: (Dictionary new
				           at: 'uniqueId' put: 1;
				           at: 'alreadyFound' put: true;
				           yourself);
		          yourself.
	
	elem2 := JTStructureCreator simpleTraceMethodDict
		         at: 'receiver' put: value2;
		         yourself.

	fileDict := JTStructureCreator simpleFileDict.
	fileDict at: 'valueIndependents' put: false.
	fileDict at: 'Lines' put: {
			elem1.
			elem2 }.

	reader read: fileDict
]

{ #category : 'read' }
JavaTraceJsonReaderTest >> testReadValueIndependentsTrueAndNoError [
	"smoke test, should not raise error"

	| fileDict elem1 value1 elem2 value2 |
	value1 := JTStructureCreator simpleObjectReferenceDict
		          at: 'uniqueId' put: 1;
		          at: 'alreadyFound' put: false;
		          yourself.
	elem1 := JTStructureCreator simpleTraceMethodDict
		         at: 'receiver' put: value1;
		         yourself.

	value2 := JTStructureCreator simpleObjectReferenceDict
		          at: 'uniqueId' put: 1;
		          at: 'alreadyFound' put: false;
		          yourself.
	elem2 := JTStructureCreator simpleTraceMethodDict
		         at: 'receiver' put: value2;
		         yourself.

	fileDict := JTStructureCreator simpleFileDict.
	fileDict at: 'valueIndependents' put: true.
	fileDict at: 'Lines' put: {
			elem1.
			elem2 }.

	reader read: fileDict
]

{ #category : 'read' }
JavaTraceJsonReaderTest >> testReadValueIndependentstrueAndError [
	"Smoke test, should not have error"

	| fileDict elem1 value1 elem2 value2 |
	value1 := JTStructureCreator simpleObjectReferenceDict
		          at: 'uniqueId' put: 1;
		          at: 'alreadyFound' put: false;
		          yourself.
	elem1 := JTStructureCreator simpleTraceMethodDict
		         at: 'receiver' put: value1;
		         yourself.

	value2 := Dictionary new
		          at: 'reference' put: (Dictionary new
				           at: 'uniqueId' put: 1;
				           at: 'alreadyFound' put: true;
				           yourself);
		          yourself.

	elem2 := JTStructureCreator simpleTraceMethodDict
		         at: 'receiver' put: value2;
		         yourself.

	fileDict := JTStructureCreator simpleFileDict.
	fileDict at: 'valueIndependents' put: true.
	fileDict at: 'Lines' put: {
			elem1.
			elem2 }.

	self should: [ reader read: fileDict ] raise: Error
]

{ #category : 'fillValueCheckingMaxDepth' }
JavaTraceJsonReaderTest >> testfillValueCheckingMaxDepthAtMaxDepth [
	| aField |
	aField := reader model newField.
	reader fillValueCheckingMaxDepthOn: aField with: '<<MAX_DEPTH_REACHED>>'.

	self assert: aField isAtMaxDepth 
]

{ #category : 'fillValueCheckingMaxDepth' }
JavaTraceJsonReaderTest >> testfillValueCheckingMaxDepthWithNil [

	| aField |
	aField := reader model newField.
	reader fillValueCheckingMaxDepthOn: aField with: nil.

	self assert: aField value isNil
]

{ #category : 'fillValueCheckingMaxDepth' }
JavaTraceJsonReaderTest >> testfillValueCheckingWithAString [
	| aField |
	aField := reader model newField.
	self should:[reader fillValueCheckingMaxDepthOn: aField with: 'imJustAString'] raise: Error.
	self should:[reader fillValueCheckingMaxDepthOn: aField with: '<<imJustAString>>'] raise: Error.

	
]

{ #category : 'instantiateReferenceEntity' }
JavaTraceJsonReaderTest >> testinstantiateReferenceEntityAClassReference [

	| reference |
	reference := reader instantiateReferenceEntityFrom: (JTStructureCreator simpleObjectReferenceDict at: #reference).

	self assert: reference class equals: FamixJTClassReference.
	self assert: (reader model includes: reference)
]

{ #category : 'instantiateReferenceEntity' }
JavaTraceJsonReaderTest >> testinstantiateReferenceEntityAClassReferenceNotPrepared [

	| reference |
	reference := reader instantiateReferenceEntityFrom: (Dictionary new
			              at: #refered put: '<<CLASS_NOT_PREPARED>>';
			              yourself).

	self assert: reference class equals: FamixJTClassReference.
	self assert: (reader model includes: reference)
]

{ #category : 'instantiateReferenceEntity' }
JavaTraceJsonReaderTest >> testinstantiateReferenceEntityAStringReference [

	| reference |
	reference := reader instantiateReferenceEntityFrom: (JTStructureCreator simpleStringReferenceDict at: #reference).

	self assert: reference class equals: FamixJTStringReference.
	self assert: (reader model includes: reference)
]

{ #category : 'instantiateReferenceEntity' }
JavaTraceJsonReaderTest >> testinstantiateReferenceEntityArrayReference [

	| reference |
	reference := reader instantiateReferenceEntityFrom: (JTStructureCreator simpleArrayReferenceDict at: #reference).

	self assert: reference class equals: FamixJTArrayReference.
	self assert: (reader model includes: reference)
]
