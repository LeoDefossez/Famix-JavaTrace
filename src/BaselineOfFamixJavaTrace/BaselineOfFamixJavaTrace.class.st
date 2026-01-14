Class {
	#name : 'BaselineOfFamixJavaTrace',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixJavaTrace',
	#package : 'BaselineOfFamixJavaTrace'
}

{ #category : 'baselines' }
BaselineOfFamixJavaTrace >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec
				package: 'Famix-JavaTrace-Generator';
				package: 'Famix-JavaTrace-Entities';
				package: 'Famix-JavaTrace-Entities-Tests' with: [ spec requires: 'Famix-JavaTrace-Entities' ] ]
]
