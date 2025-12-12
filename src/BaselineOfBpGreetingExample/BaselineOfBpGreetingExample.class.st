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
		^ spec for: #common do: [
			spec package: 'BpCliGreetingExample'
		]
]
