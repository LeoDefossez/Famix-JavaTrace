Extension { #name : 'FamixJavaInvocation' }

{ #category : '*Famix-JavaTrace-Entities-accessing' }
FamixJavaInvocation >> traceMethods [
	"Relation named: #traceMethods type: #FamixJTTraceMethod opposite: #invocation"

	<generated>
	<derived>
	<FMProperty: #traceMethods type: #FamixJTTraceMethod opposite: #invocation>
	<package: #'Famix-JavaTrace-Entities'>
	^ self attributeAt: #traceMethods ifAbsentPut: [ FMMultivalueLink on: self opposite: #invocation: ]
]

{ #category : '*Famix-JavaTrace-Entities-accessing' }
FamixJavaInvocation >> traceMethods: anObject [

	<generated>
	self traceMethods value: anObject
]
