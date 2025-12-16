Class {
	#name : #BPCliGreetingExample,
	#superclass : #Gt4BpRunnerBridgeCliExamples,
	#category : #BpCliGreetingExample
}

{ #category : #'example - bthread' }
BPCliGreetingExample >> btGreeting [
	<gtExample>
	^ 
'bp.registerBThread("Greeting", function() {
    var nameEvents = bp.EventSet("nameEvents", function (evt) {
        return evt.name == "nameProvided" && evt.data != null && evt.data.name != null;
    });
    while (true) {
        var evt = bp.sync({waitFor: nameEvents});
	    bp.sync({request: bp.Event("nameGreeted", {"greeting":"Hello " + evt.data.name + "!"})});
    }
});'
]

{ #category : #example }
BPCliGreetingExample >> emptyRunnerCli [
	<gtExample>
	| runner |
	runner := (Gt4BpRunnerBridgeCli 
		fromDirectory: (FileLocator temp / 'bt-examples' / 'greeting') asFileReference)
		onEvent: [ :event | Transcript crShow: 'BP Event -> ' , event asString ].
	^ runner
]

{ #category : #example }
BPCliGreetingExample >> greeting [
	<gtExample>
	| runner |
	runner := self emptyRunnerCli.
	runner loadBProgram: self btGreeting named: 'btGreeting.js'.
	^ runner
]
