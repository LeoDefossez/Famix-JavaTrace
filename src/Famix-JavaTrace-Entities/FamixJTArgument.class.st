"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `traceMethod` | `FamixJTArgument` | `arguments` | `FamixJTTraceMethod` | |
| `value` | `FamixJTTValueContainer` | `usage` | `FamixJTValue` | |



"
Class {
	#name : 'FamixJTArgument',
	#superclass : 'FamixJTEntity',
	#traits : 'FamixJTTValueContainer',
	#classTraits : 'FamixJTTValueContainer classTrait',
	#instVars : [
		'#traceMethod => FMOne type: #FamixJTTraceMethod opposite: #arguments'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTArgument class >> annotation [

	<FMClass: #Argument super: #FamixJTEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'as yet unclassified' }
FamixJTArgument >> parameter [

	|  arguments parameters |
	
	arguments := self traceMethod arguments.
	parameters := self traceMethod invokedMethod parameters.
	
	arguments size = parameters size ifFalse: [ self error: 'Method does not have the same number of arguments and parameter' ].
	
	^ parameters at: (arguments indexOf: self)
	
	
]

{ #category : 'accessing' }
FamixJTArgument >> traceMethod [
	"Relation named: #traceMethod type: #FamixJTTraceMethod opposite: #arguments"

	<generated>
	^ traceMethod
]

{ #category : 'accessing' }
FamixJTArgument >> traceMethod: anObject [

	<generated>
	traceMethod := anObject
]
