"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receiver` | `FamixJTTraceMethod` | `traceMethod` | `FamixJTReceiver` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `arguments` | `FamixJTTraceMethod` | `traceMethod` | `FamixJTArgument` | |
| `method` | `FamixJTTraceMethod` | `traceMethods` | `FamixJavaMethod` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isArgsAccessible` | `Boolean` | true | |

"
Class {
	#name : 'FamixJTTraceMethod',
	#superclass : 'FamixJTTraceElement',
	#instVars : [
		'#isArgsAccessible => FMProperty defaultValue: true',
		'#receiver => FMOne type: #FamixJTReceiver opposite: #traceMethod',
		'#arguments => FMMany type: #FamixJTArgument opposite: #traceMethod'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTTraceMethod class >> annotation [

	<FMClass: #TraceMethod super: #FamixJTTraceElement>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixJTTraceMethod >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : 'accessing' }
FamixJTTraceMethod >> arguments [
	"Relation named: #arguments type: #FamixJTArgument opposite: #traceMethod"

	<generated>
	<derived>
	^ arguments
]

{ #category : 'accessing' }
FamixJTTraceMethod >> arguments: anObject [

	<generated>
	arguments value: anObject
]

{ #category : 'navigation' }
FamixJTTraceMethod >> invokedMethod [

	<derived>
	| candidates |
	candidates := self invocation candidates.
	candidates size = 1 ifFalse: [ self error: 'Number of candidates should be 1 but is ' , candidates size asString ].

	^ candidates first
]

{ #category : 'accessing' }
FamixJTTraceMethod >> isArgsAccessible [

	<FMProperty: #isArgsAccessible type: #Boolean defaultValue: true>
	<generated>
	^ isArgsAccessible ifNil: [ isArgsAccessible := true ]
]

{ #category : 'accessing' }
FamixJTTraceMethod >> isArgsAccessible: anObject [
	<generated>
	isArgsAccessible := anObject
]

{ #category : 'accessing' }
FamixJTTraceMethod >> method [
	"Relation named: #method type: #FamixJavaMethod opposite: #traceMethods"

	<generated>
	<FMProperty: #method type: #FamixJavaMethod opposite: #traceMethods>
	^ self attributeAt: #method ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FamixJTTraceMethod >> method: anObject [

	<generated>
	self attributeAt: #method put: (FMMultivalueLink on: self update: #traceMethods from: self method to: anObject).
]

{ #category : 'accessing' }
FamixJTTraceMethod >> receiver [
	"Relation named: #receiver type: #FamixJTReceiver opposite: #traceMethod"

	<generated>
	^ receiver
]

{ #category : 'accessing' }
FamixJTTraceMethod >> receiver: anObject [

	<generated>
	receiver := anObject
]

{ #category : 'navigation' }
FamixJTTraceMethod >> receiverGroup [
	<generated>
	<navigation: 'Receiver'>
	^ MooseSpecializedGroup with: self receiver
]
