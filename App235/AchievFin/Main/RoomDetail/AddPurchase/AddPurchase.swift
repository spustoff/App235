//
//  AddPurchase.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct AddPurchase: View {
    
    let room_name: String
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 60, height: 5)
                    .padding(.top)
                
                Text("New Purchase")
                    .foregroundColor(.black)
                    .font(.system(size: 19, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Name")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.name_purchase.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.name_purchase)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                })
                .padding()
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Cost of goods")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("$100.00")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.cost_purchase.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.cost_purchase)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .keyboardType(.decimalPad)
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                })
                .padding()
                
                HStack {
                    
                    Text("Date of purchase")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                    Spacer()
                    
                    DatePicker(selection: $viewModel.date_purchase, displayedComponents: .date, label: {})
                        .labelsHidden()
                }
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.addPurchase(room_name: room_name, completion: {
                        
                        viewModel.fetchPurchases(room_name: room_name)
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.name_purchase = ""
                        viewModel.date_purchase = Date()
                        viewModel.cost_purchase = ""
                    })
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.name_purchase.isEmpty || viewModel.cost_purchase.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name_purchase.isEmpty || viewModel.cost_purchase.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AddPurchase(room_name: "ds", viewModel: MainViewModel())
}
