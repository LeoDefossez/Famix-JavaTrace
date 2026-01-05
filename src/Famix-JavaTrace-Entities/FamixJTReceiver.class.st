"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `traceMethod` | `FamixJTReceiver` | `receiver` | `FamixJTTraceMethod` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `value` | `FamixJTTValueContainer` | `usage` | `FamixJTValue` | |



"
Class {
	#name : 'FamixJTReceiver',
	#superclass : 'FamixJTEntity',
	#traits : 'FamixJTTValueContainer',
	#classTraits : 'FamixJTTValueContainer classTrait',
	#instVars : [
		'#traceMethod => FMOne type: #FamixJTTraceMethod opposite: #receiver'
	],
	#category : 'Famix-JavaTrace-Entities-Entities',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixJTReceiver class >> annotation [

	<FMClass: #Receiver super: #FamixJTEntity>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixJTReceiver >> traceMethod [
	"Relation named: #traceMethod type: #FamixJTTraceMethod opposite: #receiver"

	<generated>
	<container>
	<derived>
	^ traceMethod
]

{ #category : 'accessing' }
FamixJTReceiver >> traceMethod: anObject [

	<generated>
	traceMethod := anObject
]

{ #category : 'navigation' }
FamixJTReceiver >> traceMethodGroup [
	<generated>
	<navigation: 'TraceMethod'>
	^ MooseSpecializedGroup with: self traceMethod
]
