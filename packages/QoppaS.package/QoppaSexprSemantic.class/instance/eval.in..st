as yet unclassified
eval: expression in: env
	"(expression isKindOf: OhmNode)
		ifTrue: [	^self operate: (self value: expression children first) on: (expression children allButFirst) in: env]."
	"expression isVariableBinding
		ifTrue: [^(self lookup: expression key in: env) cdr car]."
	expression isNumber
		ifTrue: [^expression].
	expression isQuoted
		ifTrue: [^expression].
	expression isSymbol
		ifTrue: [^(self lookup: expression in: env) cdr car].
	expression isCons
		ifTrue: [^self operate: (self eval: expression car in: env)
					on: expression cdr in: env ].
	^expression
	