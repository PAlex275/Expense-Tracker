//
//  Extensions.swift
//  Expense Tracker
//
//  Created by Alex Petrisor on 09.04.2024.
//

import Foundation
import SwiftUI

extension Color {
    static let customBackground = Color("Background")
    static let customText = Color("Text")
    static let customIcon = Color("Icon")
    static let system = Color(uiColor:  .systemBackground)
}

extension DateFormatter {
    static let allNumericUSA: DateFormatter = {
        print("Initializing DateFormatter")
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter
    }()
}
extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericUSA.date(from: self) else {
            return Date()
        }
        return parsedDate
    }
}

extension Date: Strideable {
    func formatted() -> String{
        return self.formatted(.dateTime.year().month().day())
    }
}

extension Double {
    func roundedTo2Digits() -> Double{
        return(self * 100).rounded() / 100
    }
}
 
