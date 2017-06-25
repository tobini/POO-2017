!classDefinition: #XXXTest category: #'TusLibros-Solution'!
TestCase subclass: #XXXTest
	instanceVariableNames: 'cart catalog cashier donQuijotePrice donQuijote itemThatDoesNotBelongToEditorial madameBovary madameBovaryPrice anExpiredCreditCard aValidCreditCard salesBook thisMonth today nextMonth lastMonth customer aStolenCreditCard anotherCustomer merchantProcessorClientStub errorMerchantProcessorClientStub'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/18/2017 16:31:54'!
test01NewCartIsEmpty
	self assert: cart isEmpty! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/18/2017 18:21:43'!
test02CartWithAnAddedItemIsNotEmpty
	cart add: donQuijote.
	self deny: cart isEmpty! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/18/2017 19:34:35'!
test03CartWithTwoAddedItemsHasTwoItems
	cart add: donQuijote.
	cart add: donQuijote.
	self assert: cart size equals: 2! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/18/2017 19:34:31'!
test04CartWithOneAddedItemHasOneItems
	cart add: donQuijote.
	self assert: cart size equals: 1! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/18/2017 19:34:21'!
test05CannotAddAnItemThatDoesNotBelongToTheEditorial
	self should: [cart add: itemThatDoesNotBelongToEditorial] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText = cart class errorMessageForCaseItemIsAddedAndItDoesNotBelongToEditorial . 
		self assert: cart size equals: 0.
	].! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:28:20'!
test06DoingCheckoutOfACartWithASingleItemAndAValidCreditCardWorks
	| ticket |
	
	cart add: donQuijote.
	ticket := cashier checkout: cart payingWith: aValidCreditCard on: today through: merchantProcessorClientStub.
	self assert: ticket equals: donQuijotePrice.! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/20/2017 12:38:32'!
test07CannotModifyCartWhenAccessingItsItems
	| oldCart cartItems |
	
	cart add: donQuijote.
	oldCart := cart copy.
	cartItems := cart items.
	cartItems remove: donQuijote.
	self assert: oldCart equals: cart.! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:28:24'!
test08DoingCheckoutOfACartWithMultipleItemsAndWithAValidCreditCardWorks
	| ticket |
	
	cart add: donQuijote.
	cart add: madameBovary.
	ticket := cashier checkout: cart payingWith: aValidCreditCard on: today through: merchantProcessorClientStub.
	self assert: ticket equals: donQuijotePrice + madameBovaryPrice.! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:28:31'!
test09DoingCheckoutWithAnEmptyCartRaisesAnError
	self should: [cashier checkout: cart payingWith: aValidCreditCard on: today through: merchantProcessorClientStub] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText equals: cashier class errorMessageForEmptyCartCheckout. 
		self assert: salesBook amountOfSales equals: 0.
		].! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/18/2017 19:33:44'!
test10CanAddAnItemToTheCartWithMoreThanOneOcurrence
	cart add: donQuijote withOccurrences: 150.
	self assert: cart size equals: 150.! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/18/2017 19:33:34'!
test11AddingACartWithNegativeOccurrencesDoesNotAffectTheCartSize
	cart add: donQuijote.
	cart add: donQuijote withOccurrences: -30.
	self assert: cart size equals: 1.! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/18/2017 19:32:11'!
test12AddingACartWithAFractionalAmountOfOccurrencesRaisesAnError
	self should: [cart add: donQuijote withOccurrences: 25/32] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText equals: cart class errorMessageForFractionalAmountOfOccurrencesForAnItem. 
		self assert: cart size equals: 0.
		].! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/20/2017 11:41:28'!
test13CannotAddMultipleTimesAnItemThatDoesNotBelongToTheEditorial
	self should: [cart add: itemThatDoesNotBelongToEditorial withOccurrences: 5] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText = cart class errorMessageForCaseItemIsAddedAndItDoesNotBelongToEditorial . 
		self assert: cart size equals: 0.
	].! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/20/2017 11:46:56'!
test14CannotAddAnItemToACatalogWithANegativePrice
	self should: [catalog addItem: itemThatDoesNotBelongToEditorial withPrice: -50] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText = catalog class errorMessageWhenAddingAnItemWithNegativeValue . 
		self deny: (catalog includes: itemThatDoesNotBelongToEditorial).
	].! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/20/2017 11:52:13'!
test15CannotAddAnItemThatIsAlreadyInTheList
	self should: [catalog addItem: donQuijote withPrice: 99] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText = catalog class errorMessageWhenAddingAnItemThatIsAlreadyInTheCatalog . 
		self assert: (catalog includes: donQuijote).
		self assert: (catalog priceFor: donQuijote) equals: donQuijotePrice.
	].! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/20/2017 12:15:23'!
test16CanModifyPriceOfAnItemThatIsAlreadyInTheCatalog
	| oldCatalog newCatalog |
	oldCatalog := catalog copy.
	newCatalog := catalog modifyItem: donQuijote withPrice: 99.
	self assert: (newCatalog priceFor: donQuijote) equals: 99.
	self assert: oldCatalog equals: catalog.
	! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/20/2017 12:32:37'!
test17CannotModifyCatalogWhenAccessingItsItemsAndPrices
	| catalogItemsAndPrices oldCatalog |
	oldCatalog := catalog copy.
	catalogItemsAndPrices := catalog itemsAndPrices.
	catalogItemsAndPrices removeKey: donQuijote.
	self assert: oldCatalog equals: catalog.
	! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/20/2017 12:42:26'!
test18CannotModifyPriceOfAnItemThatDoesNotBelongToTheCatalog
	| oldCatalog |
	oldCatalog := catalog copy.
	self should: [catalog modifyItem: itemThatDoesNotBelongToEditorial withPrice: 99] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
			self assert: anError messageText equals: catalog class errorMessageWhenModifyingAnItemThatDoesNotBelongToTheCatalog.
			self assert: oldCatalog equals: catalog.
		].
	! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:28:37'!
test19CannotCheckoutACartWithAnExpiredCreditCard
	cart add: donQuijote.
	self should: [cashier checkout: cart payingWith: anExpiredCreditCard on: today through: merchantProcessorClientStub] raise: Error - MessageNotUnderstood withExceptionDo: [:anError |
		self assert: anError messageText equals: cashier class errorMessageWhenMakingACheckoutWithAnExpiredCreditCard.
		self assert: salesBook amountOfSales equals: 0.
		].
	! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:28:43'!
test20DoingACorrectCheckoutCreatesASale
	cart add: donQuijote.
	cart add: madameBovary.
	cashier checkout: cart payingWith: aValidCreditCard on: today through: merchantProcessorClientStub.
	
	self assert: salesBook amountOfSales equals: 1.
	! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:28:55'!
test21CannotCheckoutACartInTwoMonthsFromNowWithAValidCreditCardTodayButThatExpiresNextMonth
	| twoMonthsFromNow twoMonthsFromNowDate |
	twoMonthsFromNow := GregorianMonthOfYear current next next.
	twoMonthsFromNowDate := Date year: twoMonthsFromNow year number month: twoMonthsFromNow month number day: 1 .

	cart add: donQuijote.
	cart add: madameBovary.
	self should: [ cashier checkout: cart payingWith: aValidCreditCard on: twoMonthsFromNowDate through: merchantProcessorClientStub] raise: Error - MessageNotUnderstood withExceptionDo: [:anError |
		self assert: anError messageText equals: cashier class errorMessageWhenMakingACheckoutWithAnExpiredCreditCard.
		self assert: salesBook amountOfSales equals: 0.
		].
	! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:29:00'!
test22CheckoutCreatesASaleThatIsRelatedToTheCashiersCustomerAndTheCreditCardAndDateUsedInTheTransaction
	cart add: donQuijote.
	cashier checkout: cart payingWith: aValidCreditCard on: today through: merchantProcessorClientStub.
	self shouldnt: [salesBook detect: [:aSale | aSale wasMadeBy: customer payingWith: aValidCreditCard on: today]] raise: Error description: 'Object is not in the collection.'.
	! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:29:04'!
test23WhenModifyingTheCatalogASaleHasBeenCreatedWithTheSaleCatalogIsNotModified
	| aSale oldCatalog |
	cart add: donQuijote.
	cashier checkout: cart payingWith: aValidCreditCard on: today through: merchantProcessorClientStub.
	aSale := salesBook first.
	oldCatalog := catalog copy.
	catalog addItem: itemThatDoesNotBelongToEditorial withPrice: 20.
	self assert: aSale catalog equals: oldCatalog.! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:29:08'!
test24SalesBookCanListPurchasesForACustomer
	| purchases |
	cart add: donQuijote.
	cashier checkout: cart payingWith: aValidCreditCard on: today through: merchantProcessorClientStub.
	purchases := salesBook listPurchasesFor: customer.
	self assert: purchases size equals: 1.
	self assert: purchases first equals: (Sale forProducts: cart items andCatalog: catalog andCustomer: customer payingWith: aValidCreditCard on: today).! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:29:12'!
test25CannotCheckoutIfTheCreditCardHasBeenStolen
	cart add: donQuijote.
	self should: [cashier checkout: cart payingWith: aStolenCreditCard on: today through: merchantProcessorClientStub] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText equals: cashier class errorMessageForCheckoutWithStolenCreditCard.
		self assert: salesBook amountOfSales equals: 0.
		]! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:08:05'!
test26ACorrectDebitFromCardsThroughTheMerchantProcessorRespondsASuccessMessage
	self assert: (merchantProcessorClientStub debitFrom: aValidCreditCard forTransactionAmount: 100) equals: merchantProcessorClientStub class genericSuccessMessage.! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:17:07'!
test27AnIncorrectDebitFromCreditCardThroughTheMerchantProcessorRaisesAnError
	self should: [errorMerchantProcessorClientStub debitFrom: aValidCreditCard forTransactionAmount: 100] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
			self assert: anError messageText equals: errorMerchantProcessorClientStub class genericErrorDescription
			].! !

!XXXTest methodsFor: 'testing' stamp: 'TVC 6/25/2017 20:29:27'!
test28DoingACheckoutWithAMerchantProcessorThatRaisesAnErrorDoesNotCompleteTheCheckout
	cart add: donQuijote.
	self should: [cashier checkout: cart payingWith: aValidCreditCard on: today through: errorMerchantProcessorClientStub] raise: Error - MessageNotUnderstood withExceptionDo: [:anError | 
		self assert: anError messageText equals: (cashier class errorMessageWhenDebitCouldNotBeProcessed: errorMerchantProcessorClientStub class genericErrorDescription). 
		self assert: salesBook amountOfSales equals: 0.
		].! !


!XXXTest methodsFor: 'setUp' stamp: 'TVC 6/25/2017 20:19:56'!
setUp
	today := Date today.
	thisMonth := GregorianMonthOfYear current.
	nextMonth := thisMonth next.
	lastMonth := thisMonth previous.
	
	donQuijote := 'Don Quijote'.
	donQuijotePrice := 10.
	madameBovary := 'Madame Bovary'.
	madameBovaryPrice := 7.5.
	itemThatDoesNotBelongToEditorial := 'OOP for Dummies'.
	
	catalog := Catalog newXXX.
	catalog addItem: donQuijote withPrice: donQuijotePrice.
	catalog addItem: madameBovary withPrice: madameBovaryPrice.
	salesBook := SalesBook newXXX.
	
	cart := Cart newWithCatalog: catalog.
	customer := 'Pepe'.	
	anotherCustomer := 'Madre Teresa'.
	cashier := Cashier withCatalog: catalog andSalesBook: salesBook forCustomer: customer.
	aValidCreditCard := CreditCard newFor: '123456' andExpires: nextMonth forOwner: customer.
	anExpiredCreditCard := CreditCard newFor: '234567' andExpires: lastMonth forOwner: customer.
	aStolenCreditCard := CreditCard newFor: '345678' andExpires: nextMonth forOwner: anotherCustomer.
	
	merchantProcessorClientStub := MerchantProcessorClientStub newWithStubbedResponse: [MerchantProcessorClientStub genericSuccessMessage].
	errorMerchantProcessorClientStub := MerchantProcessorClientStub newWithStubbedResponse: [self error: MerchantProcessorClientStub genericErrorDescription]
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
	instanceVariableNames: 'catalog salesBook date customer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Cashier methodsFor: 'initialization' stamp: 'TVC 6/25/2017 16:27:06'!
initializeWithCatalog: aCatalog andSalesBook: aSalesBook forCustomer: aCustomer
	catalog := aCatalog .
	salesBook := aSalesBook.
	customer := aCustomer.! !


!Cashier methodsFor: 'checkout' stamp: 'TVC 6/20/2017 17:47:57'!
checkThatCartIsNotEmpty: aCart 
	aCart isEmpty ifTrue: [self error: self class errorMessageForEmptyCartCheckout ].! !

!Cashier methodsFor: 'checkout' stamp: 'TVC 6/25/2017 19:16:05'!
checkThatCreditCard: aCreditCard IsNotExpiredOn: aDate
	| monthAndYearDate |
	monthAndYearDate := GregorianMonthOfYear yearNumber: aDate year yearNumber monthNumber: aDate month monthIndex.
	(aCreditCard isExpiredOn: monthAndYearDate ) ifTrue: [self error: self class errorMessageWhenMakingACheckoutWithAnExpiredCreditCard ].! !

!Cashier methodsFor: 'checkout' stamp: 'TVC 6/25/2017 19:18:15'!
checkThatCreditCardIsNotStolen: aCreditCard
	(aCreditCard isOwnedBy: customer) ifFalse: [self error: self class errorMessageForCheckoutWithStolenCreditCard].! !

!Cashier methodsFor: 'checkout' stamp: 'TVC 6/25/2017 19:17:20'!
checkThatCreditCardIsValid: aCreditCard on: aDate
	self checkThatCreditCard: aCreditCard IsNotExpiredOn: aDate.
	self checkThatCreditCardIsNotStolen: aCreditCard.! !

!Cashier methodsFor: 'checkout' stamp: 'TVC 6/25/2017 20:31:49'!
checkout: aCart payingWith: aCreditCard on: aDate through: aMerchantProcessorClient
	| totalCost |
	
	self checkThatCartIsNotEmpty: aCart.
	self checkThatCreditCardIsValid: aCreditCard on: aDate.
	
	totalCost := 0.
	aCart items do: [:anItem | totalCost := totalCost + (catalog priceFor: anItem)].

	[aMerchantProcessorClient debitFrom: aCreditCard forTransactionAmount: totalCost.]
		on: Error
		do: [:anError | self error: (self class errorMessageWhenDebitCouldNotBeProcessed: anError messageText)].
	
	self writeInSalesBookASaleForCart: aCart payingWith: aCreditCard on: aDate.
	
	^ totalCost.! !



!Cashier methodsFor: 'as yet unclassified' stamp: 'TVC 6/25/2017 16:55:58'!
writeInSalesBookASaleForCart: aCart payingWith: aCreditCard on: aDate
	salesBook add: (Sale forProducts: aCart items andCatalog: catalog andCustomer: customer payingWith: aCreditCard on: aDate).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #'TusLibros-Solution'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error messages' stamp: 'TVC 6/25/2017 19:07:23'!
errorMessageForCheckoutWithStolenCreditCard
	^ 'Cannot checkout with a stolen credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'TVC 6/18/2017 19:13:10'!
errorMessageForEmptyCartCheckout
	^ 'Cannot checkout an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'TVC 6/25/2017 20:25:32'!
errorMessageWhenDebitCouldNotBeProcessed: aMerchantProcessorDebitErrorDescription
	^ 'Cannot checkout because debit could not be processed at the moment. Detailed error: ' , aMerchantProcessorDebitErrorDescription! !

!Cashier class methodsFor: 'error messages' stamp: 'TVC 6/20/2017 16:22:44'!
errorMessageWhenMakingACheckoutWithAnExpiredCreditCard
	^ 'Cannot checkout with an expired credit card'! !


!Cashier class methodsFor: 'initialization' stamp: 'TVC 6/25/2017 16:32:05'!
withCatalog: aCatalog andSalesBook: aSalesBook forCustomer: aCustomer
	^ self new initializeWithCatalog: aCatalog andSalesBook: aSalesBook forCustomer: aCustomer! !


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


!classDefinition: #CreditCard category: #'TusLibros-Solution'!
Object subclass: #CreditCard
	instanceVariableNames: 'creditCardNumber expirationDate owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!CreditCard methodsFor: 'testing' stamp: 'TVC 6/25/2017 15:49:39'!
isExpiredOn: aDate
	^ expirationDate < aDate.! !

!CreditCard methodsFor: 'testing' stamp: 'TVC 6/25/2017 19:31:30'!
isOwnedBy: anOwner
	^ owner = anOwner ! !


!CreditCard methodsFor: 'initialization' stamp: 'TVC 6/25/2017 19:30:04'!
initializeWith: aCreditCardNumber andExpirationDate: anExpirationDate forOwner: anOwner
	creditCardNumber := aCreditCardNumber.
	expirationDate := anExpirationDate.
	owner := anOwner.! !


!CreditCard methodsFor: 'comparing' stamp: 'TVC 6/25/2017 19:31:15'!
= anObject
	^ (anObject isKindOf: self class) and: [creditCardNumber = anObject creditCardNumber and: [expirationDate = anObject expirationDate and: [owner = anObject owner]]].
	! !


!CreditCard methodsFor: 'accessing' stamp: 'TVC 6/25/2017 18:26:32'!
creditCardNumber
	^ creditCardNumber! !

!CreditCard methodsFor: 'accessing' stamp: 'TVC 6/25/2017 18:26:58'!
expirationDate
	^ expirationDate ! !

!CreditCard methodsFor: 'accessing' stamp: 'TVC 6/25/2017 19:31:02'!
owner
	^ owner! !


!CreditCard methodsFor: 'copying' stamp: 'TVC 6/25/2017 19:29:21'!
copy
	^ self class newFor: creditCardNumber andExpires: expirationDate forOwner: owner.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #'TusLibros-Solution'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'initialization' stamp: 'TVC 6/25/2017 19:29:03'!
newFor: aCreditCardNumber andExpires: anExpirationDate forOwner: anOwner
	^ self new initializeWith: aCreditCardNumber andExpirationDate: anExpirationDate forOwner: anOwner.! !


!classDefinition: #MerchantProcessorClientStub category: #'TusLibros-Solution'!
Object subclass: #MerchantProcessorClientStub
	instanceVariableNames: 'stubbedResponse'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!MerchantProcessorClientStub methodsFor: 'as yet unclassified' stamp: 'TVC 6/25/2017 20:07:30'!
debitFrom: aValidCreditCard forTransactionAmount: aTransactionAmount
	^ stubbedResponse value! !

!MerchantProcessorClientStub methodsFor: 'as yet unclassified' stamp: 'TVC 6/25/2017 20:07:18'!
initializeWithStubbedResponse: aBlockClosure
	stubbedResponse := aBlockClosure.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessorClientStub class' category: #'TusLibros-Solution'!
MerchantProcessorClientStub class
	instanceVariableNames: ''!

!MerchantProcessorClientStub class methodsFor: 'messages' stamp: 'TVC 6/25/2017 20:18:51'!
genericErrorDescription
	^ 'Error description'! !

!MerchantProcessorClientStub class methodsFor: 'messages' stamp: 'TVC 6/25/2017 20:18:58'!
genericSuccessMessage
	^ 'OK'! !


!MerchantProcessorClientStub class methodsFor: 'instance creation' stamp: 'TVC 6/25/2017 20:06:40'!
newWithStubbedResponse: aBlockClosure
	^ self new initializeWithStubbedResponse: aBlockClosure! !


!classDefinition: #Sale category: #'TusLibros-Solution'!
Object subclass: #Sale
	instanceVariableNames: 'products catalog customer creditCard date'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!Sale methodsFor: 'initialization' stamp: 'TVC 6/25/2017 16:54:54'!
initializeForProducts: someProducts andCatalog: aCatalog andCustomer: aCustomer payingWith: aCreditCard on: aDate
	products := someProducts.
	catalog := aCatalog copy.
	customer := aCustomer.
	creditCard := aCreditCard.
	date := aDate.! !


!Sale methodsFor: 'testing' stamp: 'TVC 6/25/2017 18:46:29'!
wasMadeBy: aCustomer
	^ customer = aCustomer! !

!Sale methodsFor: 'testing' stamp: 'TVC 6/25/2017 16:53:37'!
wasMadeBy: aCustomer payingWith: aCreditCard on: aDate
	^ customer = aCustomer and: [creditCard = aCreditCard and: [date = aDate]]! !


!Sale methodsFor: 'accessing' stamp: 'TVC 6/25/2017 16:49:02'!
catalog
	^ catalog copy.! !

!Sale methodsFor: 'accessing' stamp: 'TVC 6/25/2017 18:52:04'!
creditCard
	^ creditCard copy! !

!Sale methodsFor: 'accessing' stamp: 'TVC 6/25/2017 18:51:42'!
customer
	^ customer! !

!Sale methodsFor: 'accessing' stamp: 'TVC 6/25/2017 18:51:23'!
date
	^ date! !

!Sale methodsFor: 'accessing' stamp: 'TVC 6/25/2017 18:51:09'!
products
	^ products copy! !


!Sale methodsFor: 'comparing' stamp: 'TVC 6/25/2017 18:50:35'!
= anObject
	^ (anObject isKindOf: self class) and: [customer = anObject customer and: [creditCard = anObject creditCard and: [catalog = anObject catalog and: [date = anObject date and: [products = anObject products]]]]].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: #'TusLibros-Solution'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'initialization' stamp: 'TVC 6/25/2017 16:55:10'!
forProducts: someProducts andCatalog: aCatalog andCustomer: aCustomer payingWith: aCreditCard on: aDate
	^ self new initializeForProducts: someProducts andCatalog: aCatalog andCustomer: aCustomer payingWith: aCreditCard on: aDate.! !


!classDefinition: #SalesBook category: #'TusLibros-Solution'!
Object subclass: #SalesBook
	instanceVariableNames: 'sales'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros-Solution'!

!SalesBook methodsFor: 'initialization' stamp: 'TVC 6/25/2017 18:06:23'!
initialize
	sales := OrderedCollection new.! !


!SalesBook methodsFor: 'adding' stamp: 'TVC 6/25/2017 18:08:37'!
add: aSale 
	sales add: aSale! !


!SalesBook methodsFor: 'accessing' stamp: 'TVC 6/25/2017 18:09:46'!
amountOfSales
	^ sales size! !

!SalesBook methodsFor: 'accessing' stamp: 'TVC 6/25/2017 18:15:38'!
first
	^ sales first! !

!SalesBook methodsFor: 'accessing' stamp: 'TVC 6/25/2017 18:46:42'!
listPurchasesFor: aCustomer 
	^ sales select: [:aSale | aSale wasMadeBy: aCustomer]! !


!SalesBook methodsFor: 'testing' stamp: 'TVC 6/25/2017 18:10:50'!
isEmpty
	^ sales isEmpty! !


!SalesBook methodsFor: 'as yet unclassified' stamp: 'TVC 6/25/2017 18:12:23'!
detect: aBlockClosure
	^ sales detect: aBlockClosure! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SalesBook class' category: #'TusLibros-Solution'!
SalesBook class
	instanceVariableNames: ''!

!SalesBook class methodsFor: 'initialization' stamp: 'TVC 6/25/2017 18:05:50'!
newXXX
	^ self new initialize! !
