//
//  AnalyticsManager.swift
//  TipEasy
//
//  Created by Joseph Pecoraro on 2/25/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//


import Foundation
import Crashlytics

class AnalyticsManager: NSObject {
    
    static let sharedInstance = AnalyticsManager()
    
    func tipRounded(roundAmount: NSNumber) {
        Answers.logCustomEvent(withName: "TipRounded", customAttributes: [ "Round Amount": roundAmount ])
    }
    
    func tipPercentChanged(tipPercent: Double) {
        Answers.logCustomEvent(withName: "ModifiedTipPercentage", customAttributes: [ "Updated Percent": tipPercent ])
    }
}
