//
//  TipRounder.swift
//  TipEasy
//
//  Created by Joseph Pecoraro on 8/17/16.
//  Copyright © 2016 Joseph Pecoraro. All rights reserved.
//

import Foundation

class TipRounder: NSObject {
    
    static func roundUp(value: NSDecimalNumber, roundAmount: NSDecimalNumber) -> NSDecimalNumber {
        let roundedValue = round(value, roundAmount: roundAmount);
        if roundedValue > value {
            return roundedValue
        }
        
        return roundedValue + roundAmount;
    }
    
    static func roundDown(value: NSDecimalNumber, roundAmount: NSDecimalNumber) -> NSDecimalNumber  {
        let roundedValue = round(value, roundAmount: roundAmount);
        if roundedValue < value {
            return roundedValue
        }
        
        return roundedValue - roundAmount;
    }
    
    static func round(value: NSDecimalNumber, roundAmount: NSDecimalNumber) -> NSDecimalNumber {
        return (value / roundAmount).decimalNumberByRoundingAccordingToBehavior(nil) * roundAmount;
    }
    
}
