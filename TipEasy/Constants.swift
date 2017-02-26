//
//  Constants.swift
//  TipEasy
//
//  Created by Joseph Pecoraro on 2/25/17.
//  Copyright © 2017 Joseph Pecoraro. All rights reserved.
//

import Foundation

let currencyFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.generatesDecimalNumbers = true
    formatter.locale = Locale.current
    
    return formatter
}()

let percentFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    formatter.minimumFractionDigits = 1
    
    return formatter
}()
