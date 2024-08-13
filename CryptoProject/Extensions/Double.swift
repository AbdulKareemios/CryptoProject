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
    
    /// Convert a Double to a String with K, M, Bn, Tr abbreviations.
        /// ```
        /// Convert 12 to 12.00
        /// Convert 1234 to 1.23K
        /// Convert 123456 to 123.45K
        /// Convert 12345678 to 12.34M
        /// Convert 1234567890 to 1.23Bn
        /// Convert 123456789012 to 123.45Bn
        /// Convert 12345678901234 to 12.34Tr
        /// ```
        func formattedWithAbbreviations() -> String {
            let num = abs(Double(self))
            let sign = (self < 0) ? "-" : ""

            switch num {
            case 1_000_000_000_000...:
                let formatted = num / 1_000_000_000_000
                let stringFormatted = formatted.asNumberString()
                return "\(sign)\(stringFormatted)Tr"
            case 1_000_000_000...:
                let formatted = num / 1_000_000_000
                let stringFormatted = formatted.asNumberString()
                return "\(sign)\(stringFormatted)Bn"
            case 1_000_000...:
                let formatted = num / 1_000_000
                let stringFormatted = formatted.asNumberString()
                return "\(sign)\(stringFormatted)M"
            case 1_000...:
                let formatted = num / 1_000
                let stringFormatted = formatted.asNumberString()
                return "\(sign)\(stringFormatted)K"
            case 0...:
                return self.asNumberString()

            default:
                return "\(sign)\(self)"
            }
        }
    
    /// Converts a Double into string representation with percent symbol
        /// ```
        /// Convert 1.2345 to "1.23%"
        /// ```
        func asPercentString() -> String {
            return asNumberString() + "%"
        }

}
