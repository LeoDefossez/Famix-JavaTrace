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
JTStructureCreator class >> simpleClassReferenceDict [

	^ Dictionary new
		  at: #reference put: (Dictionary new
				   at: #refered put: (Dictionary new
						    at: #fields put: {  };
						    yourself);
				   at: #uniqueId put: 1;
				   at: #type put: (Dictionary new
					    at: #name put: 'im.an.Object';
					    yourself);
				   yourself);
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleClassReferenceDictWithId: anId [

	^ Dictionary new
		  at: #reference put: (Dictionary new
				   at: #refered put: (Dictionary new
						    at: #fields put: {  };
						    yourself);
				   at: #uniqueId put: anId;
				   at: #type put: (Dictionary new
					    at: #name put: 'im.an.Object';
					    yourself);
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
		  at: #parentType put: (Dictionary new
				   at: #name put: 'Pharo';
				   yourself);
		  at: #isClassSide put: true;
		  at: #signature put: 'main(String[])';
		  at: #parameters put: {  };
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleMethodDictwithParentName: aName [

	^ Dictionary new
		  at: #name put: #main;
		  at: #parentType put: (Dictionary new
				   at: #name put: aName;
				   yourself);
		  at: #isClassSide put: true;
		  at: #signature put: 'main(String[])';
		  at: #parameters put: {  };
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleObjectReferenceDict [

	^ self simpleClassReferenceDict
]

{ #category : 'setup' }
JTStructureCreator class >> simpleParameterDict [

	^ Dictionary new
		  at: #name put: #args;
		  at: #type put: #int;
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
		  at: #type put: (Dictionary new
			   at: #name put: 'java.lang.String';
			   yourself);
		  yourself;
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleTraceMethodDict [

	^ self simpleMethodCallDict
		  at: #receiver put: self simpleClassReferenceDict;
		  yourself
]

{ #category : 'setup' }
JTStructureCreator class >> simpleValueDict [
	"Provide a simple value structure"
	
	^ self simplePrimitiveValueDict
]
