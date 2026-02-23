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
				package: 'Famix-JavaTrace-Entities-Extensions' with: [ spec requires: 'Famix-JavaTrace-Entities' ];
				package: 'Famix-JavaTrace-Entities-Tests'
				with: [ spec requires: { 'Famix-JavaTrace-Entities'. 'Famix-JavaTrace-Entities-Extensions' } ];
				package: 'Famix-JavaTrace-Importer'
				with: [ spec requires: { 'Famix-JavaTrace-Entities'. 'Famix-JavaTrace-Entities-Extensions' } ];
				package: 'Famix-JavaTrace-Importer-Tests' with: [ spec requires: 'Famix-JavaTrace-Importer' ] ]
]
