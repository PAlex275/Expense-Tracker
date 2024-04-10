//
//  TransactionList.swift
//  Expense Tracker
//
//  Created by Alex Petrisor on 11.04.2024.
//

import SwiftUI

struct TransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListVM
    
    var body: some View {
        VStack{
            List {
                ForEach(Array(transactionListVM.groupTransactionsByMonth()),id: \.key){ month, transactions in
                    Section{
                        ForEach(transactions){transaction in
                            TransactionRow(transaction: transaction)
                        }
                    } header: {
                        Text(month)
                    }
                    .listSectionSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }.navigationTitle("Transactions")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let transactionListVM: TransactionListVM = {
        let transactionListVM = TransactionListVM()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    return TransactionList()
        .environmentObject(transactionListVM)
    
}
