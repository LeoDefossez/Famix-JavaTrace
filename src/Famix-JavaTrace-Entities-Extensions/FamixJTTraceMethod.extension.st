Extension { #name : 'FamixJTTraceMethod' }

{ #category : '*Famix-JavaTrace-Entities-Extensions' }
FamixJTTraceMethod >> mooseNameOn: aStream [

	aStream
		nextPutAll: 'Line ';
		nextPutAll: self positionInTrace asString;
		nextPutAll: ' : ';
		nextPutAll: self method parentType name;
		nextPut: $.;
		nextPutAll: self method signature
]
