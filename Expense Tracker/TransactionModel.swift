//
//  TransactionModel.swift
//  Expense Tracker
//
//  Created by Alex Petrisor on 09.04.2024.
//

import Foundation
import SwiftUIFontIcon

struct Transaction: Identifiable, Decodable, Hashable{
    let id: Int
    let date: String
    let institution: String
    let account: String
    var merchant: String
    let amount: Double
    let type: TransactionType.RawValue
    var categoryId: Int
    var category: String
    let isPending: Bool
    var isTransfer: Bool
    var isExpense: Bool
    var isEdited: Bool
    
    var icon: FontAwesomeCode {
        if let category = Category.all.first(where: {$0.id == categoryId}){
            return category.icon
        }
        return .question
    }
    
    var dateParsed: Date {
        date.dateParsed()
    }
    var signedAmount: Double {
        return type == TransactionType.credit.rawValue ? amount : -amount
    }
    var month: String {
        dateParsed.formatted(.dateTime.year().month(.wide))
    }
}

enum TransactionType: String {
    case debit = "debit"
    case credit = "credit"
}

struct Category {
    let id: Int
    let name: String
    let icon: FontAwesomeCode
    var mainCategoryID: Int?
}

extension Category {
    static let autoAndTransport = Category(id: 1, name: "Auto & Transport", icon: FontAwesomeCode.car_alt)
    static let billsAndUtilities = Category(id: 2, name: "Bills & Utilities", icon: FontAwesomeCode.file_invoice_dollar)
    static let entertainment = Category(id: 3, name: "Entertainment", icon: FontAwesomeCode.film)
    static let feesAndCharges = Category(id: 4, name: "Fees & Charges", icon: FontAwesomeCode.hand_holding_usd)
    static let foodAndDining = Category(id: 5, name: "Food & Dining", icon: FontAwesomeCode.hamburger)
    static let home = Category(id: 6, name: "Home", icon:FontAwesomeCode .home)
    static let income = Category(id: 7, name: "Income", icon: FontAwesomeCode.dollar_sign)
    static let shopping = Category(id: 8, name: "Shopping", icon: FontAwesomeCode.shopping_cart)
    static let transfer = Category(id: 9, name: "Transfer", icon: FontAwesomeCode.exchange_alt)
    static let publicTransportation = Category(id: 101, name: "Public Transportation", icon: FontAwesomeCode.bus, mainCategoryID: 1)
    static let taxi = Category(id: 102, name: "Taxi", icon: FontAwesomeCode.taxi, mainCategoryID: 1)
    static let mobilephone = Category(id: 201, name: "Mobile Phone", icon: FontAwesomeCode.mobile_alt, mainCategoryID: 2)
    static let moviesAndDVDS = Category(id: 301, name: "Movies & DVDs", icon: FontAwesomeCode.film, mainCategoryID: 3)
    static let bankFee = Category(id: 401, name: "Bank Fee", icon:FontAwesomeCode .hand_holding_usd, mainCategoryID: 4)
    static let financeCharge = Category(id: 402, name: "Finance Charge", icon: FontAwesomeCode.hand_holding_usd, mainCategoryID: 4)
    static let groceries = Category(id: 501, name: "Groceries", icon: FontAwesomeCode.shopping_basket, mainCategoryID: 5)
    static let restaurants = Category(id: 502, name: "Restaurants", icon: FontAwesomeCode.utensils, mainCategoryID: 5)
    static let rent = Category(id: 601, name: "Rent", icon: FontAwesomeCode.house_user, mainCategoryID: 6)
    static let homeSupplies = Category(id: 602, name: "Home Supplies", icon: FontAwesomeCode.lightbulb, mainCategoryID: 6)
    static let paycheque = Category(id: 701, name: "Paycheque", icon: FontAwesomeCode.dollar_sign, mainCategoryID: 7)
    static let software = Category(id: 801, name: "Software", icon: FontAwesomeCode.icons, mainCategoryID: 8)
    static let creditCardPayment = Category(id: 901, name: "Credit Card Payment", icon: FontAwesomeCode.exchange_alt, mainCategoryID: 9)
}

extension Category {
    static let categories: [Category] = [
        .autoAndTransport,
        .billsAndUtilities,
        .entertainment,
        .feesAndCharges,
        .foodAndDining,
        .home,
        .income,
        .shopping,
        .transfer
    ]
    static let subCategories: [Category] = [
        .publicTransportation,
        .taxi,
        .mobilephone,
        .moviesAndDVDS,
        .bankFee,
        .financeCharge,
        .groceries,
        .restaurants,
        .rent,
        .homeSupplies,
        .paycheque,
        .software,
        .creditCardPayment,
    ]
    
    static let all: [Category] = categories + subCategories
}
