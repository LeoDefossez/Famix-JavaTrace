Class {
	#name : 'FamixJTModel',
	#superclass : 'MooseModel',
	#traits : 'FamixJTTEntityCreator + FamixJavaTEntityCreator',
	#classTraits : 'FamixJTTEntityCreator classTrait + FamixJavaTEntityCreator classTrait',
	#category : 'Famix-JavaTrace-Entities-Model',
	#package : 'Famix-JavaTrace-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixJTModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'Famix-Java-Entities')
]

{ #category : 'meta' }
FamixJTModel class >> annotation [
	<FMClass: #FamixJTModel super: #MooseModel>
	<package: #'Famix-JavaTrace-Entities'>
	<generated>
]
