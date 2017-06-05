'From Cuis 5.0 of 7 November 2016 [latest update: #3086] on 4 June 2017 at 9:11:57 pm'!
'Description Please enter a description for this package'!
!provides: 'Distance-Solution' 1 0!
!classDefinition: #Measure category: #'Distance-Solution'!
Magnitude subclass: #Measure
	instanceVariableNames: 'amount unit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'Measure class' category: #'Distance-Solution'!
Measure class
	instanceVariableNames: ''!

!classDefinition: #MeasureTest category: #'Distance-Solution'!
TestCase subclass: #MeasureTest
	instanceVariableNames: 'aMeter twoMeters hundredCentimeters twoHundredCentimeters thousandMillimeters halfAMeter tenKilometers zeroKilograms aKilogram twoKilograms hundredGrams oneThousandOneHundredGrams tenPesos meterUnit'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'MeasureTest class' category: #'Distance-Solution'!
MeasureTest class
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

!classDefinition: #MeasureUnit category: #'Distance-Solution'!
Object subclass: #MeasureUnit
	instanceVariableNames: 'name defaultName category amountThatRepresentsNothing conversionMethod inverseConversionMethod'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'MeasureUnit class' category: #'Distance-Solution'!
MeasureUnit class
	instanceVariableNames: ''!

!classDefinition: #XXX category: #'Distance-Solution'!
Object subclass: #XXX
	instanceVariableNames: 'firstMeasure secondMeasure'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Distance-Solution'!
!classDefinition: 'XXX class' category: #'Distance-Solution'!
XXX class
	instanceVariableNames: ''!


!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:52:53'!
celsius
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'celsius' 
				andConversionMethod: [:temperatureAmountIntThisUnit | temperatureAmountIntThisUnit + 273.15] 
				andInverseConversionMethod: [:temperatureAmountInDefaultUnit | temperatureAmountInDefaultUnit - 273.15] 
				andAmountValueThatRepresentsNothing: -273.15
				andDefaultName: 'kelvin' 
				andCategory: 'temperature'
				)! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:52:42'!
centimeters
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'centimeter' 
				andConversionMethod: [:distanceAmountInThisUnit | distanceAmountInThisUnit / 100] 
				andInverseConversionMethod: [:distanceAmountInDefaultUnit | distanceAmountInDefaultUnit * 100] 
				andAmountValueThatRepresentsNothing: 0
				andDefaultName: 'meter' 
				andCategory: 'distance'
				)! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:53:31'!
dolars
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'dolar' 
				andConversionMethod: [:dolarAmountInThisUnit | dolarAmountInThisUnit * 1] 
				andInverseConversionMethod: [:dolarAmountInDefaultUnit | dolarAmountInDefaultUnit / 1] 
				andAmountValueThatRepresentsNothing: 0
				andDefaultName: 'dolar' 
				andCategory: 'dolar'
				)! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:54:15'!
fahrenheit
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'fahrenheit' 
				andConversionMethod: [:temperatureAmountInThisUnit | (temperatureAmountInThisUnit + 459.67) * (5/9)]
				andInverseConversionMethod: [:temperatureAmountInDefaultUnit | (temperatureAmountInDefaultUnit * (9/5)) - 459.67] 
				andAmountValueThatRepresentsNothing: -459.67
				andDefaultName: 'kelvin' 
				andCategory: 'temperature'
				)! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:54:56'!
grams
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'gram' 
				andConversionMethod: [:weightAmountInThisUnit | weightAmountInThisUnit * 1] 
				andInverseConversionMethod: [:weightAmountInDefaultUnit | weightAmountInDefaultUnit / 1] 
				andAmountValueThatRepresentsNothing: 0
				andDefaultName: 'gram' 
				andCategory: 'weight'
				).! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:55:40'!
kelvin

	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'kelvin' 
				andConversionMethod: [:temperatureAmountIntThisUnit | temperatureAmountIntThisUnit] 
				andInverseConversionMethod: [:temperatureAmountInDefaultUnit | temperatureAmountInDefaultUnit] 
				andAmountValueThatRepresentsNothing: 0
				andDefaultName: 'kelvin' 
				andCategory: 'temperature'
				)! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:56:25'!
kilograms
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'kilogram' 
				andConversionMethod: [:weightAmountInThisUnit | weightAmountInThisUnit * 1000] 
				andInverseConversionMethod: [:weightAmountInDefaultUnit | weightAmountInDefaultUnit / 1000] 
				andAmountValueThatRepresentsNothing: 0
				andDefaultName: 'gram' 
				andCategory: 'weight'
				).! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:57:11'!
kilometers
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'kilometer' 
				andConversionMethod: [:distanceAmountInThisUnit | distanceAmountInThisUnit * 1000] 
				andInverseConversionMethod: [:distanceAmountInDefaultUnit | distanceAmountInDefaultUnit / 1000] 
				andAmountValueThatRepresentsNothing: 0
				andDefaultName: 'meter' 
				andCategory: 'distance'
				)! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:58:19'!
meters
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'meter' 
				andConversionMethod: [:distanceAmountInThisUnit | distanceAmountInThisUnit * 1]  
				andInverseConversionMethod: [:distanceAmountInDefaultUnit | distanceAmountInDefaultUnit / 1] 
				andAmountValueThatRepresentsNothing: 0
				andDefaultName: 'meter' 
				andCategory: 'distance'
				)! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:58:45'!
millimeters
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'millimeter' 
				andConversionMethod: [:distanceAmountInThisUnit | distanceAmountInThisUnit / 1000]  
				andInverseConversionMethod: [:distanceAmountInDefaultUnit | distanceAmountInDefaultUnit * 1000] 
				andAmountValueThatRepresentsNothing: 0
				andDefaultName: 'meter' 
				andCategory: 'distance'
				)! !

!Number methodsFor: '*Distance-Solution' stamp: 'TVC 6/4/2017 20:59:08'!
pesos
	^ Measure 
		withAmount: self 
		andUnit: (
			MeasureUnit 
				withName: 'peso' 
				andConversionMethod: [:pesosAmountInThisUnit | pesosAmountInThisUnit * 1] 
				andInverseConversionMethod: [:pesosAmountInDefaultUnit | pesosAmountInDefaultUnit * 1] 
				andAmountValueThatRepresentsNothing: 0
				andDefaultName: 'peso' 
				andCategory: 'peso')! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:32:59'!
* anAmount 
	^ self class withAmount: amount * anAmount andUnit: unit.! !

!Measure methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 20:46:20'!
+ aMeasure

	(self canAdd: aMeasure) ifFalse: [ ^ XXX with: self andOther: aMeasure ] .
	^ self class 
		withAmount: (self convertToDefaultUnit amount) + (aMeasure convertToDefaultUnit amount) 
		andUnit: (
			unit class withName: unit defaultName 
			andConversionMethod: [:distanceAmountInThisUnit | distanceAmountInThisUnit * 1] 
			andInverseConversionMethod: [:distanceAmountInDefaultUnit | distanceAmountInDefaultUnit / 1] 
			andAmountValueThatRepresentsNothing: unit amountThatRepresentsNothing 
			andDefaultName: unit defaultName 
			andCategory: unit category
			).! !

!Measure methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 20:46:46'!
- aMeasure

	(self canAdd: aMeasure) ifFalse: [ ^ XXX with: self andOther: aMeasure ] .
	^ self class 
		withAmount: (self convertToDefaultUnit amount) - (aMeasure convertToDefaultUnit amount) 
		andUnit: (
			unit class withName: unit defaultName 
			andConversionMethod: [:distanceAmountInThisUnit | distanceAmountInThisUnit * 1] 
			andInverseConversionMethod: [:distanceAmountInDefaultUnit | distanceAmountInDefaultUnit / 1] 
			andAmountValueThatRepresentsNothing: unit amountThatRepresentsNothing 
			andDefaultName: unit defaultName 
			andCategory: unit category
			).! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:35:12'!
/ aNumber 
	^ self class withAmount: amount / aNumber andUnit: unit.! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 14:13:23'!
< aMeasure

	^ self convertToDefaultUnit amount < aMeasure convertToDefaultUnit amount! !

!Measure methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 20:38:00'!
= aMeasure
	
	^ (aMeasure isKindOf: self class) and: [
		(self isNothing and: [aMeasure isNothing]) or: [(unit category = aMeasure unit category) and: [amount = (aMeasure convertTo: unit) amount]]
	].! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:35:44'!
adaptToNumber: aSmallInteger andSend: aSymbol 
	^ self class withAmount: aSmallInteger * amount andUnit: unit.! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:36:43'!
amount
	^ amount! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 12:54:19'!
canAdd: aMeasure 
	^ unit category = aMeasure unit category! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 13:20:53'!
canConvert: aMeasureUnit 
	^ unit category = aMeasureUnit category! !

!Measure methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 19:05:42'!
convertTo: aUnit
	
	(self canConvert: aUnit) ifFalse: [ self error: 'Cannot convert to unit'].
	^ self class withAmount:  (aUnit applyInverseConversionMethodTo: self convertToDefaultUnit amount) andUnit: aUnit! !

!Measure methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 20:48:40'!
convertToDefaultUnit

	^ self class new 
		initializeWithAmount: (unit applyConversionMethodTo: amount) 
		andUnit: (
			MeasureUnit 
				withName: unit defaultName 
				andConversionMethod: [:distanceAmountInThisUnit | distanceAmountInThisUnit * 1] 
				andInverseConversionMethod: [:distanceAmountInDefaultUnit | distanceAmountInDefaultUnit / 1] 
				andAmountValueThatRepresentsNothing: unit amountThatRepresentsNothing
				andDefaultName: unit defaultName 
				andCategory: unit category
			)! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:43:50'!
hash

	^ unit name hash + amount hash ! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:38:58'!
initializeWithAmount: anAmount andUnit: aWeightUnit 
	amount := anAmount .
	unit := aWeightUnit .! !

!Measure methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 20:39:32'!
isNothing

	^ amount = unit amountThatRepresentsNothing! !

!Measure methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 19:26:01'!
negated

	^ self class withAmount: amount negated andUnit: unit.! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:48:32'!
printOn: aStream 
	| amountAsString unitAsString |
	
	amountAsString := amount printString.
	unitAsString := unit printString.
	
	(amount > 1) ifTrue: [ unitAsString := unitAsString , 's' ].
	
	aStream nextPutAll: ' amount ', amountAsString.
	aStream nextPutAll: ' unit ', unitAsString.
	^ aStream ! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:47:03'!
printString

	| amountAsString unitAsString |
	
	amountAsString := amount printString.
	unitAsString := unit printString.
	
	(amount > 1) ifTrue: [ unitAsString := unitAsString , 's' ].
	
	^ amountAsString , ' ' , unitAsString ! !

!Measure methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:36:07'!
unit
	^ unit! !

!Measure class methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 11:32:23'!
withAmount: anAmount andUnit: aDistanceUnit 

	^ self new initializeWithAmount: anAmount andUnit: aDistanceUnit! !

!MeasureTest methodsFor: 'setup' stamp: 'TVC 6/4/2017 20:49:03'!
setUp
	aMeter := 1 meters.
	halfAMeter := (1/2) meters.
	twoMeters := 2 meters.
	hundredCentimeters := 100 centimeters.
	twoHundredCentimeters := 200 centimeters.
	thousandMillimeters := 1000 millimeters.
	tenKilometers := 10 kilometers.
	zeroKilograms := 0 kilograms.
	aKilogram := 1 kilograms.
	twoKilograms := 2 kilograms.
	hundredGrams := 100 grams.
	oneThousandOneHundredGrams := 1100 grams.
	tenPesos := 10 pesos.
	meterUnit := MeasureUnit withName: 'meter' andConversionMethod: [:distanceAmountInThisUnit | distanceAmountInThisUnit * 1] andInverseConversionMethod: [:distanceAmountInDefaultUnit | distanceAmountInDefaultUnit / 1] andAmountValueThatRepresentsNothing: 0 andDefaultName: 'meter' andCategory: 'distance'! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 19:54:21'!
test01MeterIsEqualToHimself

	self assert: aMeter = aMeter! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:38:04'!
test02DifferentTwoMetersObjectAreEqual

	| anotherTwoMeters|
	anotherTwoMeters := 2 meters.
	self assert: twoMeters = anotherTwoMeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 19:55:02'!
test03AMeterPlusAMeterEqualsTwoMeters

	self assert: (aMeter + aMeter) = twoMeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 20:01:29'!
test05AMeterEqualsToHundredCentimeters

	self assert: aMeter = hundredCentimeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 19:58:16'!
test06TwoMetersEqualsToTwoHundredCentimeters

	self assert: twoMeters = twoHundredCentimeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 19:58:18'!
test07TwoHundredCentimetersEqualsToTwoMeters

	self assert: twoHundredCentimeters = twoMeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 20:01:54'!
test08AHundredCentimetersIsDifferentToTwoMeters

	self deny: hundredCentimeters = twoMeters ! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 20:20:16'!
test09HundredCentimetersEqualsToThousandMillimeters

	self assert: hundredCentimeters = thousandMillimeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/23/2017 20:20:30'!
test10ThousandMillimetersEqualsToHundredCentimeters

	self assert: thousandMillimeters =  hundredCentimeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:38:33'!
test11ThousandMillimetersEqualsToFiftyCentimetersPlusFiftyCentimeters
	
	| fiftyCentimeters |
	fiftyCentimeters := 50 centimeters.
	self assert: thousandMillimeters =  (fiftyCentimeters + fiftyCentimeters)! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:38:45'!
test12ThousandMillimetersPlusThousandMillimetersEqualsTwoThousandMillimeters
	
	| twoThousandMillimeters |
	
	twoThousandMillimeters := 2000 millimeters.
	self assert: (thousandMillimeters + thousandMillimeters) = twoThousandMillimeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:18:09'!
test13TwoMetersMinusHundredCentimetersEqualsAThousandMillimeters
	
	self assert:  (twoMeters - hundredCentimeters) = thousandMillimeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:18:28'!
test14AMeterTimesTwoEqualsTwoMeters
	
	self assert:  aMeter * 2 = twoMeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:18:42'!
test15TwoTimesAMeterEqualsTwoMeters
	
	self assert:  2 * aMeter = twoMeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:18:55'!
test16AMeterDividedByTwoEqualsHalfAMeter
	
	self assert: aMeter / 2 = halfAMeter! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:28:27'!
test17TenKilometersIsGreaterThanAMeter
	
	self assert: tenKilometers > aMeter! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:28:45'!
test18AMeterIsLesserThanTwoMeters
	
	self assert: aMeter < twoMeters! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:28:59'!
test19TenKilometersIsGreaterOrEqualThanAMeter
	
	self assert: tenKilometers >= aMeter ! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 5/25/2017 20:29:16'!
test20AMeterIsLowerOrEqualThanTwoMeters
	
	self assert: aMeter <= twoMeters ! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:28:22'!
test21TheSumOfTwoMeasuresThatCanBeAddedWorks
	
	self assert: (aKilogram + hundredGrams) = oneThousandOneHundredGrams ! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:28:17'!
test22TheSumOfSameMeasureWorks
	
	self assert: (aKilogram + aKilogram) = twoKilograms! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:28:58'!
test23TheDifferenceBetweenSameMeasureWorks
	
	self assert: (aKilogram - aKilogram) = zeroKilograms! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:29:23'!
test24TheMultiplicationOfAMeasureWithAScalarWorks
	
	self assert: aKilogram * 2 = twoKilograms.! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:39:24'!
test25TheMultiplicationOfAScalarWithAMeasureIsCommutative	

	self assert: 2 * aKilogram = twoKilograms.
	self assert: aKilogram * 2 = twoKilograms.! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:29:53'!
test26DividingAMeasureByAScalarWorks
	
	self assert: twoKilograms / 2 = aKilogram .! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:36:15'!
test27TheSumOfTwoMeasuresWithDifferentTypeIsNotEqualsToASumOfMeasuresWithSameType
	
	self deny: 10 pesos + 50 dolars = (10 pesos + 50 pesos).! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:37:38'!
test28TheSumOfTwoMeasuresWithDifferentIsCommutative
	
	self assert: 10 pesos + 50 dolars = (50 dolars + 10 pesos).
	self assert: 50 dolars + 10 pesos  = (50 dolars + 10 pesos).! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:40:37'!
test29CannotConvertAMeasureToAUnitThatHasDifferentType

	self should: [tenPesos convertTo: meterUnit ] raise: (Error - MessageNotUnderstood) description: 'Cannot convert to unit'.! !

!MeasureTest methodsFor: 'Testing' stamp: 'GDS 6/4/2017 13:41:19'!
test30TheDifferenceOfTwoMeasuresWithDifferentTypeIsNotEqualsToASumOfMeasuresWithSameType
	
	self deny: 10 pesos - 50 dolars = (10 pesos - 50 pesos).! !

!MeasureTest methodsFor: 'Testing' stamp: 'TVC 6/4/2017 19:58:11'!
test31NothingIsEqualToNothing
	
	self assert: 0 pesos = 0 meters.! !

!MeasureTest methodsFor: 'Testing' stamp: 'TVC 6/4/2017 20:20:10'!
test32MeasuresCanRepresentNothingWithOtherValueThan0
	
	self deny: 0 celsius = 0 fahrenheit.! !

!MeasureTest methodsFor: 'Testing' stamp: 'TVC 6/4/2017 21:05:15'!
test33NothingForTemperaturesIsRepresentedByItsCorrectPhysicsEstimatedValue
	
	self assert: 0 kelvin = -273.15 celsius.
	self assert: 0 kelvin = -459.67 fahrenheit.! !

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

!MeasureUnit methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 15:10:52'!
= aWeightUnit 

	^ (aWeightUnit isKindOf: self class) and: [name = aWeightUnit name and: [ category = aWeightUnit category ]].! !

!MeasureUnit methodsFor: 'accessing' stamp: 'TVC 6/4/2017 20:43:25'!
amountThatRepresentsNothing

	^ amountThatRepresentsNothing ! !

!MeasureUnit methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 14:09:45'!
applyConversionMethodTo: aNumber

	^ conversionMethod value: aNumber! !

!MeasureUnit methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 19:12:23'!
applyInverseConversionMethodTo: aNumber 
	
	^ inverseConversionMethod value: aNumber! !

!MeasureUnit methodsFor: 'accessing' stamp: 'GDS 6/4/2017 12:46:44'!
category
	^ category ! !

!MeasureUnit methodsFor: 'accessing' stamp: 'GDS 6/4/2017 15:09:53'!
conversionMethod
	
		^ conversionMethod! !

!MeasureUnit methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 12:08:12'!
defaultName
	
		^ defaultName ! !

!MeasureUnit methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 12:08:22'!
name
	
		^ name! !

!MeasureUnit methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 21:00:08'!
withName: aName andConversionMethod: aConversionMethod andInverseConversionMethod: anInverseConversionMethod andAmountValueThatRepresentsNothing: anAmount andDefaultName: aDefaultName andCategory: aCategory
	name := aName.
	conversionMethod := aConversionMethod.
	inverseConversionMethod := anInverseConversionMethod.
	amountThatRepresentsNothing := anAmount.
	defaultName := aDefaultName.
	category  := aCategory.! !

!MeasureUnit class methodsFor: 'as yet unclassified' stamp: 'TVC 6/4/2017 20:40:43'!
withName: aName andConversionMethod: aConversionMethod andInverseConversionMethod: anInverseConversionMethod andAmountValueThatRepresentsNothing: anAmount andDefaultName: aDefaultName andCategory: aCategory
	^ self new withName: aName andConversionMethod: aConversionMethod andInverseConversionMethod: anInverseConversionMethod andAmountValueThatRepresentsNothing: anAmount andDefaultName: aDefaultName andCategory: aCategory ! !

!XXX methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 13:10:26'!
= anotherXXX

	^ (anotherXXX isKindOf: self class) and: [((firstMeasure = anotherXXX firstMeasure and: [ secondMeasure = anotherXXX secondMeasure]) or: ([firstMeasure = anotherXXX secondMeasure and: [ secondMeasure = anotherXXX firstMeasure]]))].! !

!XXX methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 12:51:06'!
firstMeasure

	^ firstMeasure ! !

!XXX methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 12:49:27'!
initializeWith: aMeasure and: anotherMeasure
	
	firstMeasure := aMeasure.
	secondMeasure := anotherMeasure .! !

!XXX methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 12:51:13'!
secondMeasure

	^ secondMeasure ! !

!XXX class methodsFor: 'as yet unclassified' stamp: 'GDS 6/4/2017 12:48:33'!
with: aMeasure andOther: anotherMeasure
	
	^ self new initializeWith: aMeasure and: anotherMeasure ! !
