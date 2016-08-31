//
//  NSDecimalNumber+ArithmeticOperations.swift
//  TipEasy
//
//  Created by Joseph Pecoraro on 8/17/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import Foundation

// MARK: - Comparable

extension NSDecimalNumber: Comparable {}

public func ==(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
    return lhs.compare(rhs) == .OrderedSame
}

public func <(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

// MARK: - Arithmetic Operators

public prefix func -(value: NSDecimalNumber) -> NSDecimalNumber {
    return value.decimalNumberByMultiplyingBy(NSDecimalNumber(mantissa: 1, exponent: 0, isNegative: true))
}

public func +(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.decimalNumberByAdding(rhs)
}

public func -(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.decimalNumberBySubtracting(rhs)
}

public func *(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.decimalNumberByMultiplyingBy(rhs)
}

public func /(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.decimalNumberByDividingBy(rhs)
}

public func ^(lhs: NSDecimalNumber, rhs: Int) -> NSDecimalNumber {
    return lhs.decimalNumberByRaisingToPower(rhs)
}