Extension { #name : 'FamixJTTrace' }

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTTrace >> indexOfElement: anElement [

	^ traceElements indexOf: anElement
]

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTTrace >> mooseNameOn: aStream [

	aStream
		nextPutAll: 'aTrace (';
		print: traceElements size;
		nextPutAll: ' elements)'
]

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTTrace >> nextTo: aTraceElement [

	<derived>
	<FMComment: 'The element next to the given element in the trace'>
	^ traceElements after: aTraceElement ifAbsent: [ nil ]
]

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTTrace >> previousTo: aTraceElement [

	<derived>
	<FMComment: 'The element before to the given element in the trace'>
	^ traceElements before: aTraceElement ifAbsent: [ nil ]
]
