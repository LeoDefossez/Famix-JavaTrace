Extension { #name : 'FamixJTTraceElement' }

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTTraceElement >> next [

	<derived>
	<FMComment: 'The next element in the trace'>
	<FMProperty: #next type: #FamixJTTraceElement>
	^ trace nextTo: self
]

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTTraceElement >> positionInTrace [
	
	<FMProperty: #positionInTrace type: #Number>
	<derived>
	<FMComment: 'The position of this element line in the trace'>
	^ trace ifNotNil:[ trace indexOfElement: self].
]

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTTraceElement >> previous [

	<derived>
	<FMComment: 'The previous element in the trace'>
	<FMProperty: #previous type: #FamixJTTraceElement>
	^ trace previousTo: self
]
