Extension { #name : 'FamixJavaMethod' }

{ #category : '*Famix-JavaTrace-Entities-accessing' }
FamixJavaMethod >> traceMethods [
	"Relation named: #traceMethods type: #FamixJTTraceMethod opposite: #method"

	<generated>
	<derived>
	<FMProperty: #traceMethods type: #FamixJTTraceMethod opposite: #method>
	<package: #'Famix-JavaTrace-Entities'>
	^ self attributeAt: #traceMethods ifAbsentPut: [ FMMultivalueLink on: self opposite: #method: ]
]

{ #category : '*Famix-JavaTrace-Entities-accessing' }
FamixJavaMethod >> traceMethods: anObject [

	<generated>
	self traceMethods value: anObject
]
