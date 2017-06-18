!classDefinition: #XXXTest category: #'TusLibros-Solution'!
TestCase subclass: #XXXTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!XXXTest methodsFor: 'as yet unclassified' stamp: 'GDS 6/15/2017 20:17:09'!
test01NewCartIsEmpty
	| cart |
	cart := Cart newXXX.
	self assert: cart isEmpty! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'GDS 6/15/2017 20:17:18'!
test02ACartWithAnAddedItemIsNotEmpty
	| cart item |
	cart := Cart newXXX.
	item := '123-0001'.
	cart add: item.
	self deny: cart isEmpty! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'GDS 6/15/2017 20:19:34'!
test03CartWithTwoAddedItemsHasTwoItems
	| cart item |
	cart := Cart newXXX.
	item := '123-0001'.
	cart add: item.
	cart add: item.
	self assert: cart size = 2! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'GDS 6/15/2017 20:17:27'!
test04CartWithOneAddedItemHasOneItems
	| cart item |
	cart := Cart newXXX.
	item := '123-0001'.
	cart add: item.
	self assert: cart size = 1! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'GDS 6/15/2017 20:17:32'!
test05CannotAddAnItemThatDoesNotBelongToTheEditorial
	| cart itemThatDoesNotBelongToEditorial |
	cart := Cart newXXX.
	itemThatDoesNotBelongToEditorial := '123-0001'.
	self should: [cart add: itemThatDoesNotBelongToEditorial] raise: Error - MessageNotUnderstood withExceptionDo: [
		:anError | anError message = 'Cannot add an Item that does not belong to the editorial'. 
		self assert: cart size = 0.
		].! !


!classDefinition: #Cart category: #'TusLibros-Solution'!
Object subclass: #Cart
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cart methodsFor: 'as yet unclassified' stamp: 'GDS 6/15/2017 20:30:50'!
add: anItem 
	self checkIfItemBelongsToTheEditorial: anItem.
	items add: anItem! !

!Cart methodsFor: 'as yet unclassified' stamp: 'GDS 6/13/2017 19:45:52'!
addItem: anObject 
	items add: anObject ! !

!Cart methodsFor: 'as yet unclassified' stamp: 'GDS 6/15/2017 20:31:12'!
checkIfItemBelongsToTheEditorial: anItem
	^ true! !

!Cart methodsFor: 'as yet unclassified' stamp: 'GDS 6/13/2017 20:06:02'!
initializeCart
	items := Bag new.! !

!Cart methodsFor: 'as yet unclassified' stamp: 'GDS 6/13/2017 19:53:49'!
isEmpty
	^ items isEmpty! !

!Cart methodsFor: 'as yet unclassified' stamp: 'GDS 6/13/2017 20:12:30'!
listItems
	^ items! !

!Cart methodsFor: 'as yet unclassified' stamp: 'GDS 6/15/2017 20:19:41'!
size
	^ items size! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Solution'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'GDS 6/13/2017 19:48:34'!
newXXX
	^ self new initializeCart! !
