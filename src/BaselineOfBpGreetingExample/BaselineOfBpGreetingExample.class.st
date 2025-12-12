Class {
	#name : #BaselineOfBpGreetingExample,
	#superclass : #BaselineOf,
	#category : #BaselineOfBpGreetingExample
}

{ #category : #loading }
BaselineOfBpGreetingExample class >> loadAndTangleGt4BpLepiter [
	| anEnvironment gt4BpBaselineSymbol |
	gt4BpBaselineSymbol := #BaselineOfGt4BP.
	anEnvironment := Smalltalk globals.
	anEnvironment
		at: gt4BpBaselineSymbol
		ifPresent: [ :class | gt4BpBaselineSymbol class loadLepiter ]
		ifAbsent: [ "NotFound signalFor: gt4BpBaselineSymbol in: anEnvironment" ]
]

{ #category : #loading }
BaselineOfBpGreetingExample class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'bp-greeting-example' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfBpGreetingExample >> baseline: spec [
	<baseline>
	^ spec
		for: #common
		do: [
			self
				lepiterLiterate: spec;
				gt4Bp: spec.
			spec
				package: 'BpCliGreetingExample'
				with: [ spec requires: #('LepiterLiterate' 'Gt4BP') ] ]
]

{ #category : #baseline }
BaselineOfBpGreetingExample >> gt4Bp: spec [.
	spec
		baseline: 'Gt4BP'
		with: [ 
			spec
				repository: 'github://isegorg/gt4bp:main/src';
				postLoadDoIt: #'postLoadChanges:' ]
]

{ #category : #baseline }
BaselineOfBpGreetingExample >> lepiterLiterate: spec [.
	spec
		baseline: 'LepiterLiterate'
		with: [ spec repository: 'github://blueplanelabs/lepiter-literate:main/src' ]
]

{ #category : #loading }
BaselineOfBpGreetingExample >> postLoadChanges: spec [
	self class loadAndTangleGt4BpLepiter
]
