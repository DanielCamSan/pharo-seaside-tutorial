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

{ #category : #initialization }
WAdocGenerator >> initialize [ 
 	super initialize .
	documentation := 'hgol'.
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
	html form:[
		html text: 'Library'.
		html textInput 
			callback:[ :value | lib := value].
		html submitButton 
			callback:[
				self documentation: ('The class is',(lib class)).
				self inform: 'Documentation:    ', documentation ];
			text: 'Generate Documentation'.
		].
]

{ #category : #accessing }
WAdocGenerator >> states [ 
	^ Array with: self
]
