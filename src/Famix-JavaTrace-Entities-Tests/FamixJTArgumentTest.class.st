"
A FamixJTArgumentTest is a test class for testing the behavior of FamixJTArgument
"
Class {
	#name : 'FamixJTArgumentTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Famix-JavaTrace-Entities-Tests-Entities',
	#package : 'Famix-JavaTrace-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixJTArgumentTest >> setUp [
	super setUp.

	model := FamixJTModel new.
]

{ #category : 'tests' }
FamixJTArgumentTest >> testParameterErrorWhenMoreArgumentThanParameter [

	| traceMethod method invocation parameter argument argument2 |
	"Init variables"
	argument := model newArgument.
	argument2 := model newArgument.
	traceMethod := model newTraceMethod.
	method := model newMethodNamed: 'main'.
	invocation := model newInvocation.
	parameter := model newParameterNamed: 'args'.

	"Connect elements"
	traceMethod addArgument: argument.
	traceMethod addArgument: argument2.
	traceMethod invocation: invocation.
	invocation addCandidate: method.
	method addParameter: parameter.

	self should: [ argument parameter ] raise: Error
]

{ #category : 'tests' }
FamixJTArgumentTest >> testParameterErrorWhenMoreParameterThanArgument [

	| traceMethod method invocation parameter argument parameter2 |
	"Init variables"
	argument := model newArgument.
	traceMethod := model newTraceMethod.
	method := model newMethodNamed: 'main'.
	invocation := model newInvocation.
	parameter := model newParameterNamed: 'args'.
	parameter2 := model newParameterNamed: 'args2'.

	"Connect elements"
	traceMethod addArgument: argument.
	traceMethod invocation: invocation.
	invocation addCandidate: method.
	method addParameter: parameter.
	method addParameter: parameter2.

	self should: [ argument parameter ] raise: Error
]

{ #category : 'tests' }
FamixJTArgumentTest >> testParameterIsOk [

	| traceMethod method invocation parameter argument |
	"Init variables"
	argument := model newArgument.
	traceMethod := model newTraceMethod.
	method := model newMethodNamed: 'main'.
	invocation := model newInvocation.
	parameter := model newParameterNamed: 'args'.

	"Connect elements"
	traceMethod addArgument: argument.
	traceMethod invocation: invocation.
	invocation addCandidate: method.
	method addParameter: parameter.

	self assert: argument parameter equals: parameter
]

{ #category : 'tests' }
FamixJTArgumentTest >> testParameterIsOkWhenMultipleArguments [

	| traceMethod method invocation parameter1 argument1 argument2 parameter2 |
	"Init variables"
	argument1 := model newArgument.
	argument2 := model newArgument.
	traceMethod := model newTraceMethod.
	method := model newMethodNamed: 'main'.
	invocation := model newInvocation.
	parameter1 := model newParameterNamed: 'args'.
	parameter2 := model newParameterNamed: 'args2'.

	"Connect elements"
	traceMethod addArgument: argument1.
	traceMethod addArgument: argument2.
	traceMethod invocation: invocation.
	invocation addCandidate: method.
	method addParameter: parameter1.
	method addParameter: parameter2.

	self assert: argument1 parameter equals: parameter1.
	self assert: argument2 parameter equals: parameter2
]
