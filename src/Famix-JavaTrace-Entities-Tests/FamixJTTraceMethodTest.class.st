"
A FamixJTTraceMethodTest is a test class for testing the behavior of FamixJTTraceMethod
"
Class {
	#name : 'FamixJTTraceMethodTest',
	#superclass : 'TestCase',
	#instVars : [
		'model'
	],
	#category : 'Famix-JavaTrace-Entities-Tests-Entities',
	#package : 'Famix-JavaTrace-Entities-Tests',
	#tag : 'Entities'
}

{ #category : 'running' }
FamixJTTraceMethodTest >> setUp [
	super setUp.

	"Put here a common initialization logic for tests"
	model := FamixJTModel new.
]

{ #category : 'tests' }
FamixJTTraceMethodTest >> testInvokedMethodIsOk [

	| traceMethod method invocation |
	"Init variables"
	traceMethod := model newTraceMethod.
	method := model newMethodNamed: 'main'.
	invocation := model newInvocation.

	"Connect elements"
	invocation addCandidate: method.
	traceMethod invocation: invocation.

	self assert: traceMethod invokedMethod equals: method
]

{ #category : 'tests' }
FamixJTTraceMethodTest >> testInvokedMethodWithNoCandidates [

	| traceMethod invocation |
	"Init variables"
	traceMethod := model newTraceMethod.
	invocation := model newInvocation.

	"Connect elements"
	traceMethod invocation: invocation.

	self should: [ traceMethod invokedMethod ] raise: Error
]

{ #category : 'tests' }
FamixJTTraceMethodTest >> testInvokedMethodWithTooManyCandidates [

	| traceMethod invocation method1 method2 |
	"Init variables"
	traceMethod := model newTraceMethod.
	method1 := model newMethodNamed: 'class1.main'.
	method2 := model newMethodNamed: 'class2.main'.
	invocation := model newInvocation.

	"Connect elements"
	invocation addCandidate: method1.
	invocation addCandidate: method2.
	traceMethod invocation: invocation.

	self should: [ traceMethod invokedMethod ] raise: Error
]
