Class {
	#name : #WAdocGenerator,
	#superclass : #WAComponent,
	#instVars : [
		'lib',
		'documentation'
	],
	#category : #DocGenerator
}

{ #category : #accessing }
WAdocGenerator >> documentation [

	^ documentation
]

{ #category : #accessing }
WAdocGenerator >> documentation: anObject [

	documentation := anObject
]

{ #category : #actions }
WAdocGenerator >> getLibrary [

	^ [ :value | lib := Smalltalk at: value asSymbol ]
]

{ #category : #initialization }
WAdocGenerator >> initialize [

	super initialize.
	documentation := 'hgol'
]

{ #category : #accessing }
WAdocGenerator >> lib [

	^ lib
]

{ #category : #accessing }
WAdocGenerator >> lib: anObject [

	lib := anObject
]

{ #category : #rendering }
WAdocGenerator >> renderContentOn: html [

	html form: [ 
		html text: 'Library'.
		html textInput callback: self getLibrary.
		html submitButton
			callback: [ 
				[ self showData ]
					on: Error
					do: [ self inform: 'Try again with a validate library ' ] ];
			text: 'Generate Documentation' ]
]

{ #category : #actions }
WAdocGenerator >> showData [

	self inform: 'Documentation:    ' , lib class printString.
	self inform: 'His superclass is ' , lib class superclass printString.
	self inform: 'His category are ' , lib class category printString.
	self inform: 'His subclassse are ' , lib class subclasses printString.
	self inform: 'His instance variables are: '
		, lib class instanceVariables printString.
	self inform:
		'His classes variables are: ' , lib class classVariables printString
]

{ #category : #accessing }
WAdocGenerator >> states [

	^ Array with: self
]
