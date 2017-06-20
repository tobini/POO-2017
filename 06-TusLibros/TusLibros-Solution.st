!classDefinition: #XXXTest category: #'TusLibros-Solution'!
TestCase subclass: #XXXTest
	instanceVariableNames: 'cart catalog cashier donQuijotePrice donQuijote itemThatDoesNotBelongToEditorial madameBovary madameBovaryPrice'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 16:31:54'!
test01NewCartIsEmpty
	self assert: cart isEmpty! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 18:21:43'!
test02CartWithAnAddedItemIsNotEmpty
	cart add: donQuijote.
	self deny: cart isEmpty! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 19:34:35'!
test03CartWithTwoAddedItemsHasTwoItems
	cart add: donQuijote.
	cart add: donQuijote.
	self assert: cart size equals: 2! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 19:34:31'!
test04CartWithOneAddedItemHasOneItems
	cart add: donQuijote.
	self assert: cart size equals: 1! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 19:34:21'!
test05CannotAddAnItemThatDoesNotBelongToTheEditorial
	self should: [cart add: itemThatDoesNotBelongToEditorial] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText = cart class errorMessageForCaseItemIsAddedAndItDoesNotBelongToEditorial . 
		self assert: cart size equals: 0.
	].! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 19:34:26'!
test06DoingCheckoutWithACartWithASingleItemWorks
	| ticket |
	
	cart add: donQuijote.
	ticket := cashier checkout: cart.
	self assert: ticket equals: donQuijotePrice.! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/20/2017 12:38:32'!
test07CannotModifyCartWhenAccessingItsItems
	| oldCart cartItems |
	
	cart add: donQuijote.
	oldCart := cart copy.
	cartItems := cart items.
	cartItems remove: donQuijote.
	self assert: oldCart equals: cart.! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 19:34:08'!
test08DoingCheckoutWithACartWithMultipleItemsWorks
	| ticket |
	
	cart add: donQuijote.
	cart add: madameBovary.
	ticket := cashier checkout: cart.
	self assert: ticket equals: donQuijotePrice + madameBovaryPrice.! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 19:33:51'!
test09DoingCheckoutWithAnEmptyCartRaisesAnError
	self should: [cashier checkout: cart] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText equals: cashier class errorMessageForEmptyCartCheckout. 
		].! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 19:33:44'!
test10CanAddAnItemToTheCartWithMoreThanOneOcurrence
	cart add: donQuijote withOccurrences: 150.
	self assert: cart size equals: 150.! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 19:33:34'!
test11AddingACartWithNegativeOccurrencesDoesNotAffectTheCartSize
	cart add: donQuijote.
	cart add: donQuijote withOccurrences: -30.
	self assert: cart size equals: 1.! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 19:32:11'!
test12AddingACartWithAFractionalAmountOfOccurrencesRaisesAnError
	self should: [cart add: donQuijote withOccurrences: 25/32] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText equals: cart class errorMessageForFractionalAmountOfOccurrencesForAnItem. 
		self assert: cart size equals: 0.
		].! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/20/2017 11:41:28'!
test13CannotAddMultipleTimesAnItemThatDoesNotBelongToTheEditorial
	self should: [cart add: itemThatDoesNotBelongToEditorial withOccurrences: 5] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText = cart class errorMessageForCaseItemIsAddedAndItDoesNotBelongToEditorial . 
		self assert: cart size equals: 0.
	].! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/20/2017 11:46:56'!
test14CannotAddAnItemToACatalogWithANegativePrice
	self should: [catalog addItem: itemThatDoesNotBelongToEditorial withPrice: -50] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText = catalog class errorMessageWhenAddingAnItemWithNegativeValue . 
		self deny: (catalog includes: itemThatDoesNotBelongToEditorial).
	].! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/20/2017 11:52:13'!
test15CannotAddAnItemThatIsAlreadyInTheList
	self should: [catalog addItem: donQuijote withPrice: 99] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText = catalog class errorMessageWhenAddingAnItemThatIsAlreadyInTheCatalog . 
		self assert: (catalog includes: donQuijote).
		self assert: (catalog priceFor: donQuijote) equals: donQuijotePrice.
	].! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/20/2017 12:15:23'!
test16CanModifyPriceOfAnItemThatIsAlreadyInTheCatalog
	| oldCatalog newCatalog |
	oldCatalog := catalog copy.
	newCatalog := catalog modifyItem: donQuijote withPrice: 99.
	self assert: (newCatalog priceFor: donQuijote) equals: 99.
	self assert: oldCatalog equals: catalog.
	! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/20/2017 12:32:37'!
test17CannotModifyCatalogWhenAccessingItsItemsAndPrices
	| catalogItemsAndPrices oldCatalog |
	oldCatalog := catalog copy.
	catalogItemsAndPrices := catalog itemsAndPrices.
	catalogItemsAndPrices removeKey: donQuijote.
	self assert: oldCatalog equals: catalog.
	! !

!XXXTest methodsFor: 'as yet unclassified' stamp: 'TVC 6/20/2017 12:42:26'!
test18CannotModifyPriceOfAnItemThatDoesNotBelongToTheCatalog
	| oldCatalog |
	oldCatalog := catalog copy.
	self should: [catalog modifyItem: itemThatDoesNotBelongToEditorial withPrice: 99] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
			self assert: anError messageText equals: catalog class errorMessageWhenModifyingAnItemThatDoesNotBelongToTheCatalog.
			self assert: oldCatalog equals: catalog.
		].
	! !


!XXXTest methodsFor: 'setUp' stamp: 'TVC 6/18/2017 19:08:35'!
setUp
	donQuijote := 'Don Quijote'.
	donQuijotePrice := 10.
	madameBovary := 'Madame Bovary'.
	madameBovaryPrice := 7.5.
	itemThatDoesNotBelongToEditorial := 'OOP for Dummies'.
	
	catalog := Catalog newXXX.
	catalog addItem: donQuijote withPrice: donQuijotePrice.
	catalog addItem: madameBovary withPrice: madameBovaryPrice.
	cart := Cart newWithCatalog: catalog.
	cashier := Cashier newWithCatalog: catalog.
! !


!classDefinition: #Cart category: #'TusLibros-Solution'!
Object subclass: #Cart
	instanceVariableNames: 'items catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cart methodsFor: 'initialization' stamp: 'TVC 6/18/2017 18:25:15'!
initializeWithCatalog: aCatalog
	items := Bag new.
	catalog := aCatalog! !


!Cart methodsFor: 'accessing' stamp: 'TVC 6/18/2017 19:01:35'!
items
	^ items copy! !

!Cart methodsFor: 'accessing' stamp: 'GDS 6/15/2017 20:19:41'!
size
	^ items size! !


!Cart methodsFor: 'testing' stamp: 'GDS 6/13/2017 19:53:49'!
isEmpty
	^ items isEmpty! !


!Cart methodsFor: 'adding' stamp: 'GDS 6/15/2017 20:30:50'!
add: anItem 
	self checkIfItemBelongsToTheEditorial: anItem.
	items add: anItem! !

!Cart methodsFor: 'adding' stamp: 'TVC 6/20/2017 11:41:52'!
add: anItem withOccurrences: anAmountOfOccurrences 
	(anAmountOfOccurrences > 0) ifTrue: [
		anAmountOfOccurrences isInteger ifFalse: [self error: self class errorMessageForFractionalAmountOfOccurrencesForAnItem].
		self checkIfItemBelongsToTheEditorial: anItem.
		items add: anItem withOccurrences: anAmountOfOccurrences
	]! !


!Cart methodsFor: 'validations' stamp: 'TVC 6/18/2017 18:54:25'!
checkIfItemBelongsToTheEditorial: anItem
	^ (catalog includes: anItem) ifFalse: [self error: self class errorMessageForCaseItemIsAddedAndItDoesNotBelongToEditorial]! !


!Cart methodsFor: 'comparing' stamp: 'TVC 6/20/2017 12:38:12'!
= anObject
	^ (anObject isKindOf: self class) and: [anObject items = items].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TusLibros-Solution'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'TVC 6/18/2017 18:25:26'!
newWithCatalog: aCatalog
	^ self new initializeWithCatalog: aCatalog! !


!Cart class methodsFor: 'error messages' stamp: 'TVC 6/18/2017 17:26:37'!
errorMessageForCaseItemIsAddedAndItDoesNotBelongToEditorial
	^ 'Cannot add an Item that does not belong to the editorial'! !

!Cart class methodsFor: 'error messages' stamp: 'TVC 6/18/2017 19:32:01'!
errorMessageForFractionalAmountOfOccurrencesForAnItem
	^ 'Cannot add a fractional amount of occurrences for an item'! !


!classDefinition: #Cashier category: #'TusLibros-Solution'!
Object subclass: #Cashier
	instanceVariableNames: 'catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'initialization' stamp: 'TVC 6/18/2017 19:15:02'!
checkThatCartIsNotEmpty: aCart
	aCart isEmpty ifTrue: [self error: self class errorMessageForEmptyCartCheckout].! !

!Cashier methodsFor: 'initialization' stamp: 'TVC 6/18/2017 19:14:41'!
checkout: aCart
	| totalCost |
	
	self checkThatCartIsNotEmpty: aCart.
	
	totalCost := 0.
	aCart items do: [:anItem | totalCost := totalCost + (catalog priceFor: anItem)].
	^ totalCost.! !

!Cashier methodsFor: 'initialization' stamp: 'TVC 6/18/2017 18:24:43'!
initializeWithCatalog: aCatalog
	catalog := aCatalog! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Solution'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'instance creation' stamp: 'TVC 6/18/2017 18:51:40'!
newWithCatalog: aCatalog
	^ self new initializeWithCatalog: aCatalog! !


!Cashier class methodsFor: 'error messages' stamp: 'TVC 6/18/2017 19:13:10'!
errorMessageForEmptyCartCheckout
	^ 'Cannot checkout an empty cart'! !


!classDefinition: #Catalog category: #'TusLibros-Solution'!
Object subclass: #Catalog
	instanceVariableNames: 'itemsAndPrices'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Catalog methodsFor: 'initialization' stamp: 'TVC 6/18/2017 18:45:20'!
initialize
	itemsAndPrices := Dictionary new.! !

!Catalog methodsFor: 'initialization' stamp: 'TVC 6/20/2017 12:06:36'!
initializeWithItemsAndPrices: someItemsAndPrices 
	itemsAndPrices := someItemsAndPrices.! !


!Catalog methodsFor: 'adding' stamp: 'TVC 6/20/2017 12:45:21'!
addItem: anItem withPrice: aPrice
	| itemAndPrice |
	
	self checkThatAnItem: anItem isValidToBeAddedWithPrice: aPrice.
	
	itemAndPrice := Association key: anItem value: aPrice.
	itemsAndPrices add: itemAndPrice.! !


!Catalog methodsFor: 'accessing' stamp: 'TVC 6/20/2017 12:32:18'!
itemsAndPrices
	^ itemsAndPrices copy! !

!Catalog methodsFor: 'accessing' stamp: 'TVC 6/18/2017 18:49:30'!
priceFor: anItem
	^ itemsAndPrices at: anItem! !


!Catalog methodsFor: 'testing' stamp: 'TVC 6/18/2017 18:53:57'!
includes: anItem 
	^ itemsAndPrices includesKey: anItem! !


!Catalog methodsFor: 'modifying' stamp: 'TVC 6/20/2017 12:52:50'!
modifyItem: anItem withPrice: aPrice
	| newItemsAndPrices newCatalog |
	
	newItemsAndPrices := itemsAndPrices copy.
	newItemsAndPrices removeKey: anItem ifAbsent: [self error: self class errorMessageWhenModifyingAnItemThatDoesNotBelongToTheCatalog ].
	newCatalog := self class newWithItemsAndPrices: newItemsAndPrices.
	newCatalog addItem: anItem withPrice: aPrice.

	^ newCatalog! !


!Catalog methodsFor: 'comparing' stamp: 'TVC 6/20/2017 12:36:34'!
= anObject
	^ (anObject isKindOf: self class) and: [anObject itemsAndPrices = itemsAndPrices].! !


!Catalog methodsFor: 'copying' stamp: 'TVC 6/20/2017 12:32:57'!
copy
	^ self veryDeepCopy! !


!Catalog methodsFor: 'validations' stamp: 'TVC 6/20/2017 12:48:37'!
checkItemIsNotAlreadyInTheCatalog: anItem
	(self includes: anItem) ifTrue: [self error: self class errorMessageWhenAddingAnItemThatIsAlreadyInTheCatalog ].! !

!Catalog methodsFor: 'validations' stamp: 'TVC 6/20/2017 12:48:10'!
checkPriceIsNotNegative: aPrice 
	(aPrice < 0) ifTrue: [self error: self class errorMessageWhenAddingAnItemWithNegativeValue ].! !

!Catalog methodsFor: 'validations' stamp: 'TVC 6/20/2017 12:47:29'!
checkThatAnItem: anItem isValidToBeAddedWithPrice: aPrice
	self checkPriceIsNotNegative: aPrice.
	self checkItemIsNotAlreadyInTheCatalog: anItem.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Catalog class' category: #'TusLibros-Solution'!
Catalog class
	instanceVariableNames: ''!

!Catalog class methodsFor: 'as yet unclassified' stamp: 'TVC 6/18/2017 18:47:06'!
newXXX
	^ self new initialize.! !


!Catalog class methodsFor: 'error messages' stamp: 'TVC 6/20/2017 11:53:15'!
errorMessageWhenAddingAnItemThatIsAlreadyInTheCatalog
	^ 'Cannot add an Item that is already in the catalog'! !

!Catalog class methodsFor: 'error messages' stamp: 'TVC 6/20/2017 11:47:28'!
errorMessageWhenAddingAnItemWithNegativeValue
	^ 'Cannot add an item with negative value to the list'! !

!Catalog class methodsFor: 'error messages' stamp: 'TVC 6/20/2017 12:42:57'!
errorMessageWhenModifyingAnItemThatDoesNotBelongToTheCatalog
	^ 'Cannot modify an item that does not belong to the catalog'! !


!Catalog class methodsFor: 'initialization' stamp: 'TVC 6/20/2017 12:05:49'!
newWithItemsAndPrices: someItemsAndPrices 
	^ self new initializeWithItemsAndPrices: someItemsAndPrices! !
