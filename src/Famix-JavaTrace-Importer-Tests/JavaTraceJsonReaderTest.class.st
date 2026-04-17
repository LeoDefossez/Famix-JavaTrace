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

{ #category : 'classNamed' }
JavaTraceJsonReaderTest >> testClassCreatedClassIsInTheModel [

	| class |
	class := reader ensureCreateClassNamed: 'Myclass[]'.
	
	self assert: class isClass.
	self assert: (reader model includes: class).
]

{ #category : 'classNamed' }
JavaTraceJsonReaderTest >> testClassNamedArray [

	| class |
	"In FamixJava, no differencies are made on typing with an array of a class or with a class"
	class := reader ensureCreateClassNamed: 'Myclass[]'.

	self assert: class isStub.
	self assert: class name equals: #Myclass
]

{ #category : 'classNamed' }
JavaTraceJsonReaderTest >> testClassNamedHandlePackages [

	| class |
	class := reader ensureCreateClassNamed: 'org.example.Pharo'.

	self assert: class name equals: 'Pharo'.
	self assert: class typeContainer name equals: 'example'.
	self assert: class typeContainer parentPackage name equals: 'org'
]

{ #category : 'classNamed' }
JavaTraceJsonReaderTest >> testClassNamedNormal [
	| class name | 
	
	class := reader ensureCreateClassNamed: (name := #Myclass).
	
	self assert: class isStub.
	self assert: class name equals: name.
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

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldWithMaxDepthFalseAndValue [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #atMaxDepth put: false.
	fieldDict at: #value put: JTStructureCreator simpleValueDict.

	self shouldnt: [ field := reader createField: fieldDict ] raise: Error
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldWithMaxDepthTrueAndNoValueAccessible [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #atMaxDepth put: true.
	fieldDict at: #accessible put: true.
	fieldDict at: #value put: nil.

	self shouldnt: [ field := reader createField: fieldDict ] raise: Error
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldWithMaxDepthTrueAndNoValueNotAccessible [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #atMaxDepth put: true.
	fieldDict at: #accessible put: false.
	fieldDict at: #value put: nil.

	self shouldnt: [ field := reader createField: fieldDict ] raise: Error
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldWithMaxDepthTrueAndValue [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict at: #atMaxDepth put: true.
	fieldDict at: #value put: JTStructureCreator simpleValueDict.

	self should: [ field := reader createField: fieldDict ] raise: Error
]

{ #category : 'createField' }
JavaTraceJsonReaderTest >> testCreateFieldWithoutMaxDepth [

	| fieldDict field |
	fieldDict := JTStructureCreator simpleFieldDict.
	fieldDict removeKey: #atMaxDepth ifAbsent: [ "nothing" ].


	self shouldnt: [ field := reader createField: fieldDict ] raise: Error
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodCreateTwoMethodIfDifferentSignature [
	"Create two time the same method, and check if the is only one"

	reader ensureCreateMethod: (JTStructureCreator simpleMethodDict
			 at: #signature put: 'java.foo(String)';
			 yourself).
	reader ensureCreateMethod: (JTStructureCreator simpleMethodDict
			 at: #signature put: 'java.foo()';
			 yourself).

	self assert: (reader model entities select: [ :entity | entity isMethod ]) size equals: 2
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodCreatedMethodIsInTheModel [

	| method |
	method := reader ensureCreateMethod: JTStructureCreator simpleMethodDict.

	self assert: method isMethod.
	self assert: (reader model includes: method)
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodDontCreateTwice [
	"Create two time the same method, and check if the is only one"
	reader ensureCreateMethod: JTStructureCreator simpleMethodDict.
	reader ensureCreateMethod: JTStructureCreator simpleMethodDict.
	
	self assert: (reader model entities select:[:entity | entity isMethod]) size equals: 1
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is empty"
	methodDict := JTStructureCreator simpleMethodDict
		              at: #parameters put: {  };
		              yourself.
	method := reader ensureCreateMethod: methodDict.

	self assert: method parameters isEmpty
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodIsClassSide [
	"Create two time the same method, and check if only one is created"

	| dict method |
	dict := JTStructureCreator simpleMethodDict.
	method := reader ensureCreateMethod: dict.
	self assert: method identicalTo: (reader ensureCreateMethod: dict)
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodIsStub [
	"Create two time the same method, and check if the is only one"
	
	| method |
	method := reader ensureCreateMethod: JTStructureCreator simpleMethodDict.
	
	self assert: method isStub.
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodNotEmptyParameters [

	| methodDict method |
	"create a method making sure parameters is not empty"
	methodDict := JTStructureCreator simpleMethodDict
		              at: #parameters put: { JTStructureCreator simpleParameterDict };
		              yourself.
	method := reader ensureCreateMethod: methodDict.

	self assert: method parameters isNotEmpty
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodParametricAbsent [
	"Create two time the same method, and check if the is only one"

	| method name |
	method := reader ensureCreateMethod: (JTStructureCreator simpleMethodDict
			           at: #parentType put: (Dictionary new
					            at: #name put: (name := #Pharo);
					            yourself);
			           yourself).

	self assert: method parentType isClass.
	self assert: method parentType name equals: name.
	self assert: method isParametricEntity not
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodParametricFalse [
	"Create two time the same method, and check if the is only one"

	| method name |
	method := reader ensureCreateMethod: (JTStructureCreator simpleMethodDict
			           at: #parentType put: (Dictionary new
					            at: #name put: (name := #Pharo);
					            yourself);
			           at: #isParametric put: false;
			           yourself).

	self assert: method parentType isClass.
	self assert: method parentType name equals: name.
	self assert: method isParametricEntity not
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodParametricTrue [
	"Create two time the same method, and check if the is only one"

	| method name |
	method := reader ensureCreateMethod: (JTStructureCreator simpleMethodDict
			           at: #parentType put: (Dictionary new
					            at: #name put: (name := #Pharo);
					            yourself);
			           at: #isParametric put: true;
			           yourself).

	self assert: method parentType isClass.
	self assert: method parentType name equals: name.
	self assert: method isParametricEntity
]

{ #category : 'createMethod' }
JavaTraceJsonReaderTest >> testCreateMethodParentType [
	"Create two time the same method, and check if the is only one"

	| method name |
	method := reader ensureCreateMethod: (JTStructureCreator simpleMethodDict
			           at: #parentType put: (Dictionary new
					            at: #name put: (name := #Pharo);
					            yourself);
			           yourself).

	self assert: method parentType isClass.
	self assert: method parentType name equals: name
]

{ #category : 'createPackage' }
JavaTraceJsonReaderTest >> testCreatePackageDefaultPackage [

	| package  |
	package := reader ensureCreatePackageFromStringCollection: {  }.

	self assert: package name equals:  '<Default Package>'.
]

{ #category : 'createPackage' }
JavaTraceJsonReaderTest >> testCreatePackageFromStringCollection1Element [

	| package |
	package := reader ensureCreatePackageFromStringCollection: { 'org' }.

	self assert: package name equals: 'org'.
]

{ #category : 'createPackage' }
JavaTraceJsonReaderTest >> testCreatePackageFromStringCollection2Elements [

	| package |
	package := reader ensureCreatePackageFromStringCollection: { 'org'. 'example' }.

	self assert: package name equals: 'example'.
	self assert: package parentPackage name equals: 'org'
]

{ #category : 'createPackage' }
JavaTraceJsonReaderTest >> testCreatePackageFromStringCollectionReuseExistingPackages [

	| package1 package2 |
	package1 := reader ensureCreatePackageFromStringCollection: { 'org'. 'example' }.
	package2 := reader ensureCreatePackageFromStringCollection: { 'org'. 'test' }.

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
		               at: #type put: (Dictionary new
				                at: #name put: (type := 'org.example.Pharo');
				                yourself);
		               yourself) }.

	parameters := reader createParameters: paramArray.

	parameters do: [ :param | self assert: param typing declaredType name equals: 'Pharo' ].
	parameters do: [ :param | self assert: param typing declaredType typeContainer name equals: 'example' ].
	parameters do: [ :param | self assert: param typing declaredType typeContainer parentPackage name equals: 'org' ]
]

{ #category : 'createPrimitiveType' }
JavaTraceJsonReaderTest >> testCreatePrimitiveTypeCreatedPrimitiveTypeIsInTheModel [

	| primType |
	primType := reader ensureCreatePrimitiveType: #int.

	self assert: primType isPrimitiveType.
	self assert: (reader model includes: primType)
]

{ #category : 'createPrimitiveType' }
JavaTraceJsonReaderTest >> testCreatePrimitiveTypeDeleteSuffix [
	| primType |
	"In FamixJava there is no diference in typing with array or single value"
	primType := reader ensureCreatePrimitiveType: 'int[]'.

	self assert:  primType name equals: #int
]

{ #category : 'createPrimitiveType' }
JavaTraceJsonReaderTest >> testCreatePrimitiveTypeIsStub [
	| primType |
	primType := reader ensureCreatePrimitiveType: #int.

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

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodArgumentsAccessibleWithValue [
	"Smoke test, we just check if createTraceElement act as expected"

	| traceMethodDict argsDict |
	traceMethodDict := JTStructureCreator simpleTraceMethodDict.
	traceMethodDict at: #method put: (JTStructureCreator simpleMethodDict
			 at: #parameters put: { JTStructureCreator simpleParameterDict };
			 yourself).

	argsDict := traceMethodDict at: #arguments.
	argsDict at: #argsValues put: { JTStructureCreator simpleValueDict }.
	argsDict at: #accessible put: true.

	reader createTraceMethod: traceMethodDict .
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodArgumentsAccessibleWithoutValue [

	| stacklineDict argsDict |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	argsDict := stacklineDict at: #arguments.
	argsDict removeKey: #argsValues ifAbsent: ["no problem if already absent"].
	argsDict at: #accessible put: true.

	self should: [ reader createTraceMethod: stacklineDict ] raise: Error
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodArgumentsInAccessibleWithValue [

	| stacklineDict argsDict |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	argsDict := stacklineDict at: #arguments.
	argsDict at: #argsValues put: { JTStructureCreator simpleValueDict }.
	argsDict at: #accessible put: false.

	self should: [ reader createTraceMethod: stacklineDict ] raise: Error
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodArgumentsInAccessibleWithoutValue [
	"Smoke test, this test just check if no error happen in this case"

	| stacklineDict argsDict |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	argsDict := stacklineDict at: #arguments.
	argsDict
		removeKey: #argsValues
		ifAbsent: [ "no problem if already absent" ].
	argsDict at: #accessible put: false.

	reader createTraceMethod: stacklineDict
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodCheckMethodCreation [

	| stacklineDict methodCall |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	stacklineDict at: #method put: JTStructureCreator simpleMethodDict.

	methodCall := reader createTraceMethod: stacklineDict.
	self assert: methodCall method isNotNil
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodCreatedTraceElementIsInTheModel [

	| traceMethod |
	traceMethod := reader createTraceMethod: JTStructureCreator simpleTraceMethodDict.

	self assert: traceMethod class equals: FamixJTTraceMethod.
	self assert: (reader model includes: traceMethod)
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodDuplicateMethod [

	| traceMethod1 traceMethod2 methodCall1 methodCall2 |
	traceMethod1 := JTStructureCreator simpleTraceMethodDict.
	"We are forced to put a parentId to the second, because we only allow one method to not have parent, that method is the first one of the trace"
	traceMethod2 := JTStructureCreator simpleTraceMethodDict
		                at: #parentId put: (traceMethod1 at: #id);
		                at: #receiver put: (JTStructureCreator simpleClassReferenceDictWithId: 2);
		                yourself.

	methodCall1 := reader createTraceMethod: traceMethod1.
	methodCall2 := reader createTraceMethod: traceMethod2.

	self assert: methodCall1 method identicalTo: methodCall2 method
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodLinkArgumentsAndParameters [

	| stacklineDict methodDict argsDict stackline |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.

	methodDict := stacklineDict at: #method put: JTStructureCreator simpleMethodDict.
	methodDict at: #parameters put: { JTStructureCreator simpleParameterDict }.

	argsDict := stacklineDict at: #arguments.
	argsDict at: #argsValues put: { JTStructureCreator simpleValueDict }.

	stackline := reader createTraceMethod: stacklineDict.

	self assert: stackline arguments first parameter equals: stackline method parameters first
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodNoMethod [

	| stacklineDict |
	stacklineDict := JTStructureCreator simpleTraceMethodDict.
	stacklineDict removeKey: #method ifAbsent: [ "No problem if already absent" ].
	self should: [ reader createTraceMethod: stacklineDict ] raise: Error
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodNoParents [

	| traceMethodDict |
	traceMethodDict := JTStructureCreator simpleTraceMethodDict
		                   at: #parentId put: -1;
		                   yourself.

	self assert: (reader createTraceMethod: traceMethodDict) parent isNil
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodOnlyFirstMethodHasNoParents [

	
	| traceMethodDict1 traceMethodDict2 |
	traceMethodDict1 := JTStructureCreator simpleTraceMethodDict
		                         at: #parentId put: -1;
		                         at: #id put: 1;
		                         yourself.
	traceMethodDict2 := JTStructureCreator simpleTraceMethodDict
		                   at: #parentId put: -1;
		                   at: #id put: 2;
		                   at: #receiver put: nil;
		                   yourself.

	 reader createTraceMethod: traceMethodDict1.

	self should: [reader createTraceMethod: traceMethodDict2 ] raise: Error
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodReceiverNil [

	| stacklineDict stackline |
	stacklineDict := JTStructureCreator simpleTraceMethodDict
		                 at: #receiver put: nil;
		                 yourself.

	stackline := reader createTraceMethod: stacklineDict.

	self assert: stackline receiver isNil
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodReceiverNotNil [

	| stacklineDict stackline |
	stacklineDict := JTStructureCreator simpleTraceMethodDict
		                 at: #receiver put: JTStructureCreator simpleArrayReferenceDict;
		                 yourself.

	stackline := reader createTraceMethod: stacklineDict.

	self assert: stackline receiver isNotNil
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodSameSignatureDifferentClass [

	| traceMethod1 traceMethod2 methodCall1 methodCall2 |
	traceMethod1 := JTStructureCreator simpleTraceMethodDict
		                at: #method put: (JTStructureCreator simpleMethodDictwithParentName: 'Foo');
		                yourself.
	"We are forced to put a parentId to the second, because we only allow one method to not have parent, that method is the first one of the trace"
	traceMethod2 := JTStructureCreator simpleTraceMethodDict
		                at: #method put: (JTStructureCreator simpleMethodDictwithParentName: 'Bar');
		                at: #parentId put: (traceMethod1 at: #id);
		                at: #receiver put: (JTStructureCreator simpleClassReferenceDictWithId: 2);
		                yourself.

	methodCall1 := reader createTraceMethod: traceMethod1.
	methodCall2 := reader createTraceMethod: traceMethod2.

	self deny: methodCall1 method identicalTo: methodCall2 method
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodSameSignatureSameClassNameDifferentPackage [

	| traceMethod1 traceMethod2 methodCall1 methodCall2 |
	traceMethod1 := JTStructureCreator simpleTraceMethodDict
		                at: #method put: (JTStructureCreator simpleMethodDictwithParentName: 'org.Foo');
		                yourself.
	"We are forced to put a parentId to the second, because we only allow one method to not have parent, that method is the first one of the trace"
	traceMethod2 := JTStructureCreator simpleTraceMethodDict
		                at: #parentId put: (traceMethod1 at: #id);
		                at: #method put: (JTStructureCreator simpleMethodDictwithParentName: 'everf.Foo');
		                at: #receiver put: (JTStructureCreator simpleClassReferenceDictWithId: 2);
		                yourself.

	methodCall1 := reader createTraceMethod: traceMethod1.
	methodCall2 := reader createTraceMethod: traceMethod2.

	self deny: methodCall1 method identicalTo: methodCall2 method
]

{ #category : 'createTraceMethod' }
JavaTraceJsonReaderTest >> testCreateTraceMethodWithParents [

	| parentTraceMethodDict traceMethodDict parentTraceMethod |
	parentTraceMethodDict := JTStructureCreator simpleTraceMethodDict
		                         at: #parentId put: -1;
		                         at: #id put: 1;
		                         yourself.
	traceMethodDict := JTStructureCreator simpleTraceMethodDict
		                   at: #parentId put: 1;
		                   at: #id put: 2;
		                   at: #receiver put: nil;
		                   yourself.

	parentTraceMethod := reader createTraceMethod: parentTraceMethodDict.

	self assert: (reader createTraceMethod: traceMethodDict) parent identicalTo: parentTraceMethod
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

	self should: [ reader createObjectReference: arrayReferenceDict ] raise: Error
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceAlreadyFoundWithoutAReferedValue [
	"Smoke test, we just check if createValueReference act as expected"
	| arrayReferenceDict |
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict at: #reference.
	arrayReferenceDict at: #alreadyFound put: false.
	"Create it to make the reader able to find a link with the first appearance"
	reader createObjectReference: arrayReferenceDict.
	
	"Making sure there is a no refered value"
	arrayReferenceDict removeKey: #refered ifAbsent: [ "No problem if already absent" ].
	arrayReferenceDict at: #alreadyFound put: true.

	reader createObjectReference: arrayReferenceDict
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceChooseClassAsTyping [

	| arrayReferenceDict arrayReference |
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict at: #reference.

	"Making sure there is a no refered value"
	arrayReferenceDict at: #type put: (Dictionary new
			 at: #name put: 'my.app.Pharo';
			 yourself).

	arrayReference := reader createObjectReference: arrayReferenceDict.

	self assert: arrayReference typing declaredType isClass
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceChoosePrimitiveTypeAsTyping [

	| arrayReferenceDict arrayReference|
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict at: #reference.

	"Making sure there is a no refered value"
	arrayReferenceDict at:#type put:#int.
	
	arrayReference := reader createObjectReference: arrayReferenceDict.
	
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

	reader createObjectReference: arrayReferenceDict
]

{ #category : 'createValueReference' }
JavaTraceJsonReaderTest >> testCreateValueReferenceNotAlreadyFoundWithoutAReferedValue [

	| arrayReferenceDict |
	arrayReferenceDict := JTStructureCreator simpleArrayReferenceDict at: #reference.

	"Making sure there is a no refered value"
	arrayReferenceDict removeKey: #refered ifAbsent: [ "No problem if already absent" ].
	arrayReferenceDict at: #alreadyFound put: false.

	self should: [ reader createObjectReference: arrayReferenceDict ] raise: Error
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
		         at: #parentId put: 1;
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
		         at: #parentId put: 1;
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

{ #category : 'instantiateReferenceEntity' }
JavaTraceJsonReaderTest >> testinstantiateReferenceEntityAClassReference [

	| reference |
	reference := reader instantiateReferenceEntityFrom: (JTStructureCreator simpleObjectReferenceDict at: #reference).

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
