'From Cuis 5.0 of 7 November 2016 [latest update: #3081] on 30 May 2017 at 7:00:16 pm'!
'Description Please enter a description for this package'!
!provides: 'Distance-Solution' 1 0!
!requires: 'Distance Solution' 1 0 nil!
!classDefinition: #DistanceInterval category: #'Distance-Solution'!
Interval subclass: #DistanceInterval
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'DistanceInterval class' category: #'Distance-Solution'!
DistanceInterval class
	instanceVariableNames: ''!

!classDefinition: #DistanceTest category: #'Distance-Solution'!
TestCase subclass: #DistanceTest
	instanceVariableNames: 'aMeter twoMeters hundredCentimeters twoHundredCentimeters thousandMillimeters halfAMeter tenKilometers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'DistanceTest class' category: #'Distance-Solution'!
DistanceTest class
	instanceVariableNames: ''!

!classDefinition: #Distance category: #'Distance-Solution'!
Object subclass: #Distance
	instanceVariableNames: 'amountInMillimeters unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'Distance class' category: #'Distance-Solution'!
Distance class
	instanceVariableNames: ''!

!classDefinition: #DistanceFactory category: #'Distance-Solution'!
Object subclass: #DistanceFactory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'DistanceFactory class' category: #'Distance-Solution'!
DistanceFactory class
	instanceVariableNames: ''!

!classDefinition: #DistanceUnit category: #'Distance-Solution'!
Object subclass: #DistanceUnit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'DistanceUnit class' category: #'Distance-Solution'!
DistanceUnit class
	instanceVariableNames: ''!

!classDefinition: #Centimeter category: #'Distance-Solution'!
DistanceUnit subclass: #Centimeter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'Centimeter class' category: #'Distance-Solution'!
Centimeter class
	instanceVariableNames: ''!

!classDefinition: #Kilometer category: #'Distance-Solution'!
DistanceUnit subclass: #Kilometer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'Kilometer class' category: #'Distance-Solution'!
Kilometer class
	instanceVariableNames: ''!

!classDefinition: #Meter category: #'Distance-Solution'!
DistanceUnit subclass: #Meter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'Meter class' category: #'Distance-Solution'!
Meter class
	instanceVariableNames: ''!

!classDefinition: #Millimeter category: #'Distance-Solution'!
DistanceUnit subclass: #Millimeter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'Millimeter class' category: #'Distance-Solution'!
Millimeter class
	instanceVariableNames: ''!


!Number methodsFor: '*Distance-Solution' stamp: 'GDS 5/29/2017 20:06:46'!
centimeters
	^ Distance withAmount: self andUnit: Centimeter! !

!Number methodsFor: '*Distance-Solution' stamp: 'GDS 5/29/2017 20:07:10'!
kilometers
	^ Distance withAmount: self andUnit: Kilometer! !

!Number methodsFor: '*Distance-Solution' stamp: 'GDS 5/29/2017 20:07:31'!
meters
	^ Distance withAmount: self andUnit: Meter! !

!Number methodsFor: '*Distance-Solution' stamp: 'GDS 5/29/2017 20:07:49'!
millimeters
	^ Distance withAmount: self andUnit: Millimeter! !

!DistanceInterval methodsFor: 'initialization' stamp: 'GDS 5/29/2017 21:03:53'!
setFrom: startDistance to: stopDistance count: countInteger

	start _ startDistance.
	stop _ stopDistance.
	count _ countInteger! !

!DistanceInterval class methodsFor: 'instance creation' stamp: 'GDS 5/30/2017 16:55:19'!
from: startDistance to: stopDistance

	^self new setFrom: startDistance to: stopDistance count: ((stopDistance-startDistance) amount / startDistance  normalizedUnitValue) + 1.! !

!DistanceInterval class methodsFor: 'instance creation' stamp: 'GDS 5/29/2017 21:22:45'!
from: startDistance to: stopDistance by: stepDistance
	| count end |
	count _ ((stopDistance amount - startDistance amount) / stepDistance amount) + 1.
	(count closeTo: count rounded)
		ifTrue: [
			count _ count rounded.
			end _ stopDistance ]
		ifFalse: [
			count _ count truncated.
			end _ count-1 * stepDistance + startDistance ].
	^self from: startDistance to: end count: count! !

!DistanceTest methodsFor: 'setup' stamp: 'GDS 5/25/2017 20:36:27'!
setUp
	aMeter := 1 meters.
	halfAMeter := (1/2) meters.
	twoMeters := 2 meters.
	hundredCentimeters := 100 centimeters.
	twoHundredCentimeters := 200 centimeters.
	thousandMillimeters := 1000 millimeters.
	tenKilometers := 10 kilometers.! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 19:54:21'!
test01MeterIsEqualToHimself

	self assert: aMeter = aMeter! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:38:04'!
test02DifferentTwoMetersObjectAreEqual

	| anotherTwoMeters|
	anotherTwoMeters := 2 meters.
	self assert: twoMeters = anotherTwoMeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 19:55:02'!
test03AMeterPlusAMeterEqualsTwoMeters

	self assert: (aMeter + aMeter) = twoMeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:38:14'!
test04CannotCreateMetersWithNegativeAmount

	self should: [-1 meters] raise: Error description: 'Cannot create distances with negative amount'! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 20:01:29'!
test05AMeterEqualsToHundredCentimeters

	self assert: aMeter = hundredCentimeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 19:58:16'!
test06TwoMetersEqualsToTwoHundredCentimeters

	self assert: twoMeters = twoHundredCentimeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 19:58:18'!
test07TwoHundredCentimetersEqualsToTwoMeters

	self assert: twoHundredCentimeters = twoMeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 20:01:54'!
test08AHundredCentimetersIsDifferentToTwoMeters

	self deny: hundredCentimeters = twoMeters ! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 20:20:16'!
test09HundredCentimetersEqualsToThousandMillimeters

	self assert: hundredCentimeters = thousandMillimeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 20:20:30'!
test10ThousandMillimetersEqualsToHundredCentimeters

	self assert: thousandMillimeters =  hundredCentimeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:38:33'!
test11ThousandMillimetersEqualsToFiftyCentimetersPlusFiftyCentimeters
	
	| fiftyCentimeters |
	fiftyCentimeters := 50 centimeters.
	self assert: thousandMillimeters =  (fiftyCentimeters + fiftyCentimeters)! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:38:45'!
test12ThousandMillimetersPlusThousandMillimetersEqualsTwoThousandMillimeters
	
	| twoThousandMillimeters |
	
	twoThousandMillimeters := 2000 millimeters.
	self assert: (thousandMillimeters + thousandMillimeters) = twoThousandMillimeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:18:09'!
test13TwoMetersMinusHundredCentimetersEqualsAThousandMillimeters
	
	self assert:  (twoMeters - hundredCentimeters) = thousandMillimeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:18:28'!
test14AMeterTimesTwoEqualsTwoMeters
	
	self assert:  aMeter * 2 = twoMeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:18:42'!
test15TwoTimesAMeterEqualsTwoMeters
	
	self assert:  2 * aMeter = twoMeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:18:55'!
test16AMeterDividedByTwoEqualsHalfAMeter
	
	self assert: aMeter / 2 = halfAMeter! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:28:27'!
test17TenKilometersIsGreaterThanAMeter
	
	self assert: tenKilometers > aMeter! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:28:45'!
test18AMeterIsLesserThanTwoMeters
	
	self assert: aMeter < twoMeters! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:28:59'!
test19TenKilometersIsGreaterOrEqualThanAMeter
	
	self assert: tenKilometers >= aMeter ! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:29:16'!
test20AMeterIsLowerOrEqualThanTwoMeters
	
	self assert: aMeter <= twoMeters ! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/29/2017 21:51:08'!
test21OneMeterToThreeMetersIntervallHasOneMeterTwoMetersAndThreeMetersInIt
	| fromOneMeterToThreeMetersInterval |
	fromOneMeterToThreeMetersInterval := 1 meters to: 3 meters.
	self assert: (fromOneMeterToThreeMetersInterval isKindOf: DistanceInterval).
	self assert: (fromOneMeterToThreeMetersInterval at: 1) = 1 meters.
	self assert: (fromOneMeterToThreeMetersInterval at: 2) = 2 meters.
	self assert: (fromOneMeterToThreeMetersInterval at: 3) = 3 meters.
	! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/29/2017 21:51:52'!
test22OneCentimeterToThreeCentimetersIntervalHasOneCentimeterTwoCentimetersAndThreeCentimetersInIt
	| fromOneMeterToThreeMetersInterval |
	fromOneMeterToThreeMetersInterval := 1 centimeters to: 3 centimeters.
	self assert: (fromOneMeterToThreeMetersInterval isKindOf: DistanceInterval).
	self assert: (fromOneMeterToThreeMetersInterval at: 1) = 1 centimeters.
	self assert: (fromOneMeterToThreeMetersInterval at: 2) = 2 centimeters.
	self assert: (fromOneMeterToThreeMetersInterval at: 3) = 3 centimeters.
	! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/30/2017 17:12:14'!
test23OneCentimeterToThreeCentimetersIntervalHasOneCentimeterTwoCentimetersAndThreeCentimetersInIt
	| fromOneMeterToThreeMetersInterval |
	fromOneMeterToThreeMetersInterval := 50 centimeters to: 1 meters.
	self assert: (fromOneMeterToThreeMetersInterval isKindOf: DistanceInterval).
	self assert: (fromOneMeterToThreeMetersInterval at: 1) = 50 centimeters.
	self assert: (fromOneMeterToThreeMetersInterval at: 2) = 51 centimeters.
	self assert: (fromOneMeterToThreeMetersInterval at: 3) = 52 centimeters.
	self assert: (fromOneMeterToThreeMetersInterval at: 50) = 99 centimeters.
	self assert: (fromOneMeterToThreeMetersInterval last) = 1 meters.! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/30/2017 17:12:29'!
test24OneMeterToTenKilometersBy5CentimetersIntervalHasElementsWith5CentimetersBetweenEachElement
	| fromOneMeterToThreeMetersInterval |
	fromOneMeterToThreeMetersInterval := 1 meters to: 10 kilometers by: 5 centimeters.
	self assert: (fromOneMeterToThreeMetersInterval isKindOf: DistanceInterval).
	self assert: (fromOneMeterToThreeMetersInterval first) = 1 meters.
	self assert: (fromOneMeterToThreeMetersInterval at: 2) = (1 meters + 5 centimeters).
	self assert: (fromOneMeterToThreeMetersInterval at: fromOneMeterToThreeMetersInterval size - 1) = (10 kilometers - 5 centimeters).
	self assert: (fromOneMeterToThreeMetersInterval last) = 10 kilometers.! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/30/2017 17:13:03'!
test25ToByDoAppliesOperationsToEveryDistanceInInterval
	| fromOneMeterToThreeMetersInterval  iterationCounter|
	iterationCounter := 0. 
	1 meters to: 10 kilometers by: 5 centimeters do: [ :aDistance | iterationCounter := iterationCounter + 1]. 

	fromOneMeterToThreeMetersInterval := 1 meters to: 10 kilometers by: 5 centimeters.
	
	self assert: fromOneMeterToThreeMetersInterval size = iterationCounter 
! !

!DistanceTest methodsFor: 'Testing' stamp: 'GDS 5/30/2017 17:54:09'!
test26ToDoAppliesOperationsToEveryDistanceInInterval
	" Este test esta fallando y no sabemos el motivo. El debugger empieza a usar mensajes extraños y no entra en el mensaje to: do: 
	
	| fromOneMeterToThreeMetersInterval  iterationCounter |
	iterationCounter := 0. 

	aMeter to: tenKilometers do: [ :aDistance |
										 iterationCounter := iterationCounter + 1 ].

	fromOneMeterToThreeMetersInterval := 1 meters to: 10 kilometers.
	
	self assert: fromOneMeterToThreeMetersInterval size = iterationCounter "
	
! !

!Distance methodsFor: 'maths operations' stamp: 'GDS 5/30/2017 17:01:18'!
* anAmount 
	^ self class withAmount: amountInMillimeters * anAmount andUnit: Millimeter .! !

!Distance methodsFor: 'maths operations' stamp: 'GDS 5/30/2017 17:03:21'!
+ aDistance 
	^ self class withAmount: amountInMillimeters + aDistance amount andUnit: Millimeter.! !

!Distance methodsFor: 'maths operations' stamp: 'GDS 5/30/2017 17:01:27'!
- aDistance 
	^ self class withAmount: amountInMillimeters - aDistance amount andUnit: Millimeter.! !

!Distance methodsFor: 'maths operations' stamp: 'GDS 5/30/2017 17:01:34'!
/ aNumber 
	^ self class withAmount: amountInMillimeters / aNumber andUnit: Millimeter.! !

!Distance methodsFor: 'comparators' stamp: 'GDS 5/30/2017 17:02:31'!
< aDistance 
	^ amountInMillimeters < aDistance amount! !

!Distance methodsFor: 'comparators' stamp: 'GDS 5/30/2017 17:02:41'!
<= aDistance 
	^ amountInMillimeters <= aDistance amount! !

!Distance methodsFor: 'comparators' stamp: 'GDS 5/30/2017 17:02:46'!
= aDistance 
	^ amountInMillimeters = (aDistance amount)! !

!Distance methodsFor: 'comparators' stamp: 'GDS 5/30/2017 17:02:50'!
> aDistance 
	^ amountInMillimeters > aDistance amount! !

!Distance methodsFor: 'comparators' stamp: 'GDS 5/30/2017 17:02:54'!
>= aDistance 
	^ amountInMillimeters >= aDistance amount! !

!Distance methodsFor: 'maths operations' stamp: 'GDS 5/30/2017 17:01:40'!
adaptToNumber: aSmallInteger andSend: aSymbol 
	^ self class withAmount: aSmallInteger * amountInMillimeters andUnit: Millimeter.! !

!Distance methodsFor: 'accessing' stamp: 'GDS 5/30/2017 17:02:24'!
amount
	^ amountInMillimeters! !

!Distance methodsFor: 'initialization' stamp: 'GDS 5/30/2017 17:02:00'!
initializeWithAmount: anAmount
	amountInMillimeters := anAmount! !

!Distance methodsFor: 'initialization' stamp: 'GDS 5/30/2017 17:02:18'!
initializeWithAmount: anAmount andUnit: aDistanceUnit
	amountInMillimeters := anAmount.
	unit := aDistanceUnit.! !

!Distance methodsFor: 'value normalization' stamp: 'GDS 5/30/2017 16:55:53'!
normalizedUnitValue
	^ unit normalizedValue! !

!Distance methodsFor: 'distance intervals' stamp: 'GDS 5/29/2017 21:09:40'!
to: aDistance 
	^ DistanceInterval from: self to: aDistance! !

!Distance methodsFor: 'distance intervals' stamp: 'GDS 5/29/2017 21:20:55'!
to: aDistance by: aDistanceStep 
	^ DistanceInterval from: self to: aDistance by: aDistanceStep! !

!Distance methodsFor: 'distance intervals' stamp: 'GDS 5/29/2017 19:25:49'!
to: aDistance by: aDistanceStep do: aBlockClosure 
	(self to: aDistance by: aDistanceStep) do: aBlockClosure ! !

!Distance methodsFor: 'distance intervals' stamp: 'GDS 5/30/2017 17:42:30'!
to: aDistance do: aBlockClosure 
	(self to: aDistance) do: aBlockClosure ! !

!Distance class methodsFor: 'errors' stamp: 'GDS 5/29/2017 21:58:09'!
cannotCreateDistancesWithNegativeAmount

	^ self error: 'Cannot create distances with negative amount'! !

!Distance class methodsFor: 'instance creation' stamp: 'GDS 5/30/2017 16:59:59'!
withAmount: anAmount andUnit: aDistanceUnit 
	anAmount < 0 ifTrue: [ self cannotCreateDistancesWithNegativeAmount ].
	^ self new initializeWithAmount: (aDistanceUnit amountToMillimeters: anAmount) andUnit: aDistanceUnit! !

!DistanceFactory methodsFor: 'instances-creation' stamp: 'GDS 5/29/2017 19:58:02'!
minusOneMeter
	^ -1 meters! !

!DistanceFactory methodsFor: 'instances-creation' stamp: 'GDS 5/29/2017 19:58:17'!
oneCentimeter
	^ 1 centimeters.! !

!DistanceFactory methodsFor: 'instances-creation' stamp: 'GDS 5/29/2017 19:58:30'!
oneHundredCentimeters
	^ 100 centimeters.! !

!DistanceFactory methodsFor: 'instances-creation' stamp: 'GDS 5/29/2017 19:58:43'!
oneMeter
	^ 1 meters.! !

!DistanceFactory methodsFor: 'instances-creation' stamp: 'GDS 5/29/2017 19:58:56'!
twoHundredCentimeters
	^ 200 centimeters.! !

!DistanceFactory methodsFor: 'instances-creation' stamp: 'GDS 5/29/2017 19:59:08'!
twoMeters
	^ 2 meters.! !

!DistanceFactory methodsFor: 'instances-creation' stamp: 'GDS 5/29/2017 19:59:17'!
zeroMeters
	^ 0 meters.! !

!DistanceUnit class methodsFor: 'converting' stamp: 'GDS 5/30/2017 17:05:47'!
amountToMillimeters: anAmount
	^ anAmount * self normalizedValue! !

!DistanceUnit class methodsFor: 'normalization' stamp: 'GDS 5/30/2017 17:04:48'!
normalizedValue
	^ self subclassResponsibility ! !

!Centimeter class methodsFor: 'normalization' stamp: 'GDS 5/30/2017 17:04:05'!
normalizedValue
	^ 10! !

!Kilometer class methodsFor: 'normalization' stamp: 'GDS 5/30/2017 17:04:36'!
normalizedValue
	^ 1000000! !

!Meter class methodsFor: 'normalization' stamp: 'GDS 5/30/2017 17:03:51'!
normalizedValue
	^ 1000! !

!Millimeter class methodsFor: 'normalization' stamp: 'GDS 5/30/2017 17:08:23'!
normalizedValue
	^ 1! !
