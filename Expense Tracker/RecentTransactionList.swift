//
//  RecentTransactionList.swift
//  Expense Tracker
//
//  Created by Alex Petrisor on 09.04.2024.
//

import SwiftUI

struct RecentTransactionList: View {
    @EnvironmentObject var transactionListVM: TransactionListVM
    var body: some View {
        VStack{
            HStack {
                //Header title
                Text("Recent Transactions")
                    .bold()
                Spacer()
                NavigationLink {
                    TransactionList()
                } label: {
                    HStack(spacing:4){
                        Text("See All")
                        Image(systemName: "chevron.right")
                    }
                    .foregroundStyle(Color.customText)
                }
            }.padding(.top)
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id: \.element){ index, transaction in
                TransactionRow(transaction: transaction)
                
                Divider().opacity(index == 4 ? 0:1)
            }
        }
        .padding()
        .background(Color.system)
        .clipShape(RoundedRectangle(cornerRadius:20, style: .continuous))
        .shadow(color: .primary.opacity(0.2), radius: 10, x: 0, y: 5)
    }
    
}

#Preview {
    let transactionListVM: TransactionListVM = {
        let transactionListVM = TransactionListVM()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    return RecentTransactionList()
        .environmentObject(transactionListVM)
        
}
