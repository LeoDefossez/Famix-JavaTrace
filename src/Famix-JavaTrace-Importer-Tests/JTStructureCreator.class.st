Class {
	#name : 'JTStructureCreator',
	#superclass : 'Object',
	#category : 'Famix-JavaTrace-Importer-Tests',
	#package : 'Famix-JavaTrace-Importer-Tests'
}

{ #category : 'setup' }
JTStructureCreator class >> simpleArrayReferenceDict [

	^ Dictionary new
		  at: #reference put: (Dictionary new
				   at: #refered put: (Dictionary new
						    at: #elements put: {  };
						    yourself);
				   at: #uniqueId put: 1;
				   at: #type put: 'int[]';
				   yourself);
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleFieldDict [

	| fieldDict |
	fieldDict := Dictionary new.
	fieldDict at: #name put: #aField.
	fieldDict at: #value put: self simpleValueDict.
	^ fieldDict
]

{ #category : 'as yet unclassified' }
JTStructureCreator class >> simpleFileDict [

	| file |
	file := Dictionary new.
	file at: 'valueIndependents' put: false.
	file at: 'Lines' put: {  }.
	^ file
]

{ #category : 'setup' }
JTStructureCreator class >> simpleMethodCallDict [

	| methodCallDict argsDict methodDict |
	methodCallDict := Dictionary new.
	methodCallDict at: #arguments put: (argsDict := Dictionary new).
	argsDict at: #argsValues put: {  }.

	"create a simple method with no paremeter to make sure no errors happens from having no arguments"
	methodDict := self simpleMethodDict.
	methodDict at: #parameters put: {  }.
	methodCallDict at: #method put: methodDict.
	^ methodCallDict
]

{ #category : 'setup' }
JTStructureCreator class >> simpleMethodDict [

	^ Dictionary new
		  at: #name put: #main;
		  at: #parentType put: 'Pharo';
		  at: #isClassSide put: true;
		  at: #signature put: 'Pharo.main(String[])';
		  at: #parameters put: {  };
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleObjectReferenceDict [

	^ Dictionary new
		  at: #reference put: (Dictionary new
				   at: #refered put: (Dictionary new
						    at: #fields put: {  };
						    yourself);
				   at: #uniqueId put: 1;
				   at: #type put: 'im.an.Object';
				   yourself);
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleParameterDict [

	^ Dictionary new
		  at: #name put: #args;
		  at: #type put: #Pharo;
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simplePrimitiveValueDict [

	^ Dictionary new
		  at: #primitiveValue put: (Dictionary new
				   at: #type put: #int;
				   at: #value put: 42;
				   yourself);
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleStringReferenceDict [

	^ Dictionary new
		  at: #reference put: (Dictionary new
				   at: #refered put: #yesIAM;
				   yourself);
		  at: #uniqueId put: 1;
		  at: #type put: 'java.lang.String';
		  yourself;
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleTraceMethodDict [

	^ self simpleMethodCallDict
		  at: #receiver put: self simpleArrayReferenceDict;
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleValueDict [
	"Provide a simple value structure"
	
	^ self simplePrimitiveValueDict
]
