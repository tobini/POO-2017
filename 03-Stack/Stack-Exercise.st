!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'lastItem size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'GDS 5/7/2017 17:48:39'!
initialize
	lastItem _ EmptyStackItem new.
	size _ 0.! !


!OOStack methodsFor: 'accessing' stamp: 'GDS 5/7/2017 17:47:18'!
size
	^ size.! !

!OOStack methodsFor: 'accessing' stamp: 'GDS 5/7/2017 17:41:18'!
top
	^ lastItem value.! !


!OOStack methodsFor: 'testing' stamp: 'GDS 5/7/2017 17:34:59'!
isEmpty
 	^ lastItem isEmpty! !


!OOStack methodsFor: 'removing' stamp: 'GDS 5/7/2017 17:55:45'!
pop
	| poppedItem |
	
	poppedItem _ lastItem.
	lastItem _ lastItem previousItem.
	size  _ size - 1.
	
	^ poppedItem value! !


!OOStack methodsFor: 'adding' stamp: 'GDS 5/7/2017 17:47:53'!
push: anObject
	lastItem  _ FilledStackItem newWithValue: anObject onTopOf: lastItem.
	size _ size + 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStack class methodsFor: 'instance creation' stamp: 'GDS 5/7/2017 16:54:53'!
new 
	| stack |
	stack _ super new.
	stack initialize.
	^ stack! !


!classDefinition: #StackItem category: #'Stack-Exercise'!
Object subclass: #StackItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackItem methodsFor: 'testing' stamp: 'GDS 5/7/2017 17:35:18'!
isEmpty

	^ self subclassResponsibility! !


!StackItem methodsFor: 'accessing' stamp: 'GDS 5/7/2017 17:44:50'!
previousItem
	^ self subclassResponsibility! !

!StackItem methodsFor: 'accessing' stamp: 'GDS 5/7/2017 17:42:17'!
value
	^ self subclassResponsibility! !


!classDefinition: #EmptyStackItem category: #'Stack-Exercise'!
StackItem subclass: #EmptyStackItem
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackItem methodsFor: 'comparing' stamp: 'GDS 5/7/2017 17:53:24'!
= aStackItem
	^ self isKindOf: (aStackItem class)! !


!EmptyStackItem methodsFor: 'testing' stamp: 'GDS 5/7/2017 17:35:50'!
isEmpty
	^ true! !


!EmptyStackItem methodsFor: 'accessing' stamp: 'GDS 5/7/2017 17:44:22'!
previousItem
	^ self error: OOStack stackEmptyErrorDescription! !

!EmptyStackItem methodsFor: 'accessing' stamp: 'GDS 5/7/2017 17:41:42'!
value
	^ self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #FilledStackItem category: #'Stack-Exercise'!
StackItem subclass: #FilledStackItem
	instanceVariableNames: 'value previousItem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledStackItem methodsFor: 'comparing' stamp: 'GDS 5/7/2017 17:52:42'!
= aStackItem
	^ (self isKindOf: (aStackItem class)) and: [ value = aStackItem value ]! !


!FilledStackItem methodsFor: 'initialization' stamp: 'GDS 5/7/2017 17:39:54'!
initializeWithValue: anObject onTopOf: aStackItem.
	value _ anObject.
	previousItem _ aStackItem.! !


!FilledStackItem methodsFor: 'testing' stamp: 'GDS 5/7/2017 17:35:38'!
isEmpty
	^ false! !


!FilledStackItem methodsFor: 'accessing' stamp: 'GDS 5/7/2017 17:44:41'!
previousItem
	^ previousItem! !

!FilledStackItem methodsFor: 'accessing' stamp: 'GDS 5/7/2017 17:42:02'!
value
	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledStackItem class' category: #'Stack-Exercise'!
FilledStackItem class
	instanceVariableNames: ''!

!FilledStackItem class methodsFor: 'instance creation' stamp: 'GDS 5/7/2017 17:39:20'!
newWithValue: anObject onTopOf: aStackItem
	^ super new initializeWithValue: anObject onTopOf: aStackItem.! !
