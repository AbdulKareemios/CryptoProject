//
//  Double.swift
//  CryptoProject
//
//  Created by AK on 5/9/24.
//

import Foundation


extension Double {
    
    ///Convert a Double currency 2  decimal places
    ///```
    ///convert 1234.56 to $1,234.56
    ///```
    private var currencyFormatter2: NumberFormatter {
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    func asCurrecnyWith2Decimals() -> String {
        
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    ///Convert a Double currency 2 to 6 decimal places
    ///```
    ///convert 1234.56 to $1,234.56
    ///```
    private var currencyFormatter6: NumberFormatter {
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    func asCurrecnyWith6Decimals() -> String {
        
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    func asNumberString() -> String {
        
        return String(format: "%0.2f", self)
    }
    
    func asPercentageString() -> String {
        
        return asNumberString() + "%"
    }
}
