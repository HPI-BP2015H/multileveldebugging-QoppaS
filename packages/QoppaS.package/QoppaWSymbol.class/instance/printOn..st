accessing
printOn: aStream
	aStream nextPutAll: 'Q'.
	self content printOn: aStream.