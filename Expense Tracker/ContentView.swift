//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Alex Petrisor on 09.04.2024.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    @EnvironmentObject var transactionListVM: TransactionListVM
    var demoData: [Double] = [8,2,4,6,12,9,2]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 24){
                    Text("Overview")
                        .font(.title2)
                        .bold()
                    let data = transactionListVM.accumulateTransactions()
                    if !data.isEmpty{
                        let totalExpenses = data.last?.1 ?? 0
                        
                        CardView {
                            VStack(alignment:.leading){
                                ChartLabel(totalExpenses.formatted(.currency(code: "USD")), type: .title,format: "%.02f US$")
                                    
                                LineChart()
                                    
                            }.background(Color.system)
                           
                        }.data(data)
                            .chartStyle(ChartStyle(backgroundColor: Color.system, foregroundColor: ColorGradient(Color.customIcon.opacity(0.4), Color.customIcon)))
                            .frame(height: 300)
                            .background(Color.system)
                    }
                    
                    
                    RecentTransactionList()
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
            .background(Color.customBackground)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                //Mark: Notification Icon
                ToolbarItem{
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.customIcon, .primary)
                }
                
            }
        }
        .accentColor(.primary)
    }
}

#Preview {
    let transactionListVM: TransactionListVM = {
        let transactionListVM = TransactionListVM()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    return ContentView()
        .environmentObject(transactionListVM)
}
