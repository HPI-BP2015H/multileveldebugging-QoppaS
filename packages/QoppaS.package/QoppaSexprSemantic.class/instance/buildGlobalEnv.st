as yet unclassified
buildGlobalEnv
	^QoppaWCons withCar: (QoppaWCons newDictFrom: {
		#+ -> (self wrapPrim: [:args| args reduce: [:a :b| a + b]] countingArgs: false).
		#-  -> (self wrapPrim: [:args| args reduce: [:a :b| a - b]] countingArgs: false).
		#*  -> (self wrapPrim: [:args| args reduce: [:a :b| a * b]] countingArgs: false).
		#/   -> (self wrapPrim: [:args| args reduce: [:a :b| a / b]] countingArgs: false).
		#<=  -> (self wrapPrim: [:args| args reduce: [:a :b| a <= b]] countingArgs: false).
		#=  -> (self wrapPrim: [:args| args reduce: [:a :b| a = b]] countingArgs: false).
		
		#cons -> (self wrapPrim: [:car :cdr| QoppaWCons withCar: car cdr: cdr] countingArgs: true).
		#car -> (self wrapPrim: [:cons| cons car] countingArgs: true).
		#cdr -> (self wrapPrim: [:cons| cons cdr] countingArgs: true).
		#'set-car!' -> (self wrapPrim: [:cons :car| cons car: car; yourself] countingArgs: true).
		#'set-cdr!' -> (self wrapPrim: [:cons :cdr| cons cdr: cdr; yourself] countingArgs: true).
		
		#bool -> self boolPrim.
		#'null?' -> (self wrapPrim: [:arg| arg isNil] countingArgs: true).
		#'symbol?' -> (self wrapPrim: [:arg| (arg isString) or: (arg isSymbol)] countingArgs: true).
		#'pair?' -> (self wrapPrim: [:arg| arg isCons] countingArgs: true).

		#eval -> (self wrapPrim: [:env :exp| self eval: exp in: env] countingArgs: true).
		#lookup -> (self wrapPrim: [:name :env| self lookup: name in: env] countingArgs: true).
		#operate -> (self wrapPrim: [:env :operative :operands| self operate: operative on: operands in: env] countingArgs: true).
	}).