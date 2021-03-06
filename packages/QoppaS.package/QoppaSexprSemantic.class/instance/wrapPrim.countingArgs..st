as yet unclassified
wrapPrim: aBlock countingArgs: countArgs
	"returns a block that takes one array of arguments for aBlock and checks the arity, and evaluates them"

	^[:args |
		|evaluatedArgs|
		evaluatedArgs := (args collect: [:arg| self eval: arg in: self environment]).
		countArgs
			ifFalse: [aBlock value: evaluatedArgs]
			ifTrue: [		
				aBlock numArgs = args size
				ifTrue: [ aBlock valueWithArguments: evaluatedArgs]
				ifFalse: [ Error signal: 'ArityMismatch for', aBlock]]]