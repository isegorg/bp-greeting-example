Class {
	#name : 'BaselineOfBpGreetingExample',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfBpGreetingExample',
	#package : 'BaselineOfBpGreetingExample'
}

{ #category : 'loading' }
BaselineOfBpGreetingExample class >> assimilateKnowledgeGt4BpLepiter [
	(LeDatabasesRegistry defaultLogicalDatabase
		databaseNamed: 'isegorg/gt4bp/lepiter') processKnowledge
]

{ #category : 'loading' }
BaselineOfBpGreetingExample class >> loadAndAssimilateKnowledgeGt4BpLepiter [
	self loadGt4BpLepiter.
	self assimilateKnowledgeGt4BpLepiter
]

{ #category : 'loading' }
BaselineOfBpGreetingExample class >> loadGt4BpLepiter [
	| gt4BpBaselineSymbol anEnvironment |
	gt4BpBaselineSymbol := #BaselineOfGt4BP.
	anEnvironment := Smalltalk globals.
	anEnvironment
		at: gt4BpBaselineSymbol
		ifPresent: [ :class |
			"To ensure logical DB properties creation in cli mode"
			LeLogicalDatabaseProperties defaultForGlamorousToolkit.
			gt4BpBaselineSymbol asClass loadLepiter ]
		ifAbsent: [  "NotFound signalFor: gt4BpBaselineSymbol in: anEnvironment" ]
]

{ #category : 'loading' }
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

{ #category : 'baseline' }
BaselineOfBpGreetingExample >> baseline: spec [
	<baseline>
	^ spec
		for: #common
		do: [
	    spec preLoadDoIt: #'preLoadDependencies:'.
			spec
				package: 'BpCliGreetingExample' ]
]

{ #category : 'baseline' }
BaselineOfBpGreetingExample >> gt4Bp: spec [
	Metacello new
		repository: 'github://isegorg/gt4bp:main/src';
		baseline: 'Gt4BP';
		load.
		self class loadAndAssimilateKnowledgeGt4BpLepiter
]

{ #category : 'baseline' }
BaselineOfBpGreetingExample >> lepiterLiterate: spec [
	Metacello new
			repository: 'github://blueplanelabs/lepiter-literate:main/src';
			baseline: 'LepiterLiterate';
			load.
]

{ #category : 'loading' }
BaselineOfBpGreetingExample >> postLoadChanges: spec [
	self class loadAndAssimilateKnowledgeGt4BpLepiter
]

{ #category : 'loading' }
BaselineOfBpGreetingExample >> preLoadDependencies: spec [
		self
			lepiterLiterate: spec;
			gt4Bp: spec.
]
