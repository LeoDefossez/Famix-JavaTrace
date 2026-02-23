"
A FamixJTArgumentTest is a test class for testing the behavior of FamixJTArgument
"
Class {
	#name : 'FamixJTArgumentTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Famix-JavaTrace-Entities-Tests',
	#package : 'Famix-JavaTrace-Entities-Tests'
}

{ #category : 'running' }
FamixJTArgumentTest >> setUp [
	super setUp.

	model := FamixJTModel new.
]

{ #category : 'tests' }
FamixJTArgumentTest >> testParameterErrorWhenMoreArgumentThanParameter [

	| traceMethod method parameter argument argument2 |
	"Init variables"
	argument := model newArgument.
	argument2 := model newArgument.
	traceMethod := model newTraceMethod.
	method := model newMethodNamed: 'main'.
	parameter := model newParameterNamed: 'args'.

	"Connect elements"
	traceMethod addArgument: argument.
	traceMethod addArgument: argument2.
	traceMethod method: method.
	method addParameter: parameter.

	self should: [ argument parameter ] raise: Error
]

{ #category : 'tests' }
FamixJTArgumentTest >> testParameterErrorWhenMoreParameterThanArgument [

	| traceMethod method parameter argument parameter2 |
	"Init variables"
	argument := model newArgument.
	traceMethod := model newTraceMethod.
	method := model newMethodNamed: 'main'.
	parameter := model newParameterNamed: 'args'.
	parameter2 := model newParameterNamed: 'args2'.

	"Connect elements"
	traceMethod addArgument: argument.
	traceMethod method: method.
	method addParameter: parameter.
	method addParameter: parameter2.

	self should: [ argument parameter ] raise: Error
]

{ #category : 'tests' }
FamixJTArgumentTest >> testParameterIsOk [

	| traceMethod method  parameter argument |
	"Init variables"
	argument := model newArgument.
	traceMethod := model newTraceMethod.
	method := model newMethodNamed: 'main'.
	parameter := model newParameterNamed: 'args'.

	"Connect elements"
	traceMethod addArgument: argument.
	traceMethod method: method.
	method addParameter: parameter.

	self assert: argument parameter equals: parameter
]

{ #category : 'tests' }
FamixJTArgumentTest >> testParameterIsOkWhenMultipleArguments [

	| traceMethod method  parameter1 argument1 argument2 parameter2 |
	"Init variables"
	argument1 := model newArgument.
	argument2 := model newArgument.
	traceMethod := model newTraceMethod.
	method := model newMethodNamed: 'main'.
	parameter1 := model newParameterNamed: 'args'.
	parameter2 := model newParameterNamed: 'args2'.

	"Connect elements"
	traceMethod addArgument: argument1.
	traceMethod addArgument: argument2.
	traceMethod method: method.
	method addParameter: parameter1.
	method addParameter: parameter2.

	self assert: argument1 parameter equals: parameter1.
	self assert: argument2 parameter equals: parameter2
]
