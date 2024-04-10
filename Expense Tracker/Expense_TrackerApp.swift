//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Alex Petrisor on 09.04.2024.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject var transactionListVM = TransactionListVM()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
