Class {
	#name : #BaselineOfBpGreetingExample,
	#superclass : #BaselineOf,
	#category : #BaselineOfBpGreetingExample
}

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
		do: [ self gt4Bp: spec.
			spec
				package: 'BpCliGreetingExample'
				with: [ spec requires: #('Gt4BP') ] ]
]

{ #category : #baseline }
BaselineOfBpGreetingExample >> gt4Bp: spec [.
	spec
		baseline: 'Gt4BP'
		with: [ spec repository: 'github://isegorg/gt4bp:main/src' ]
]
