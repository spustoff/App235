//
//  ShoppingAdd.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct ShoppingAdd: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: ShoppingViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 60, height: 5)
                    .padding(.top)
                
                Text("Schedule a purchase")
                    .foregroundColor(.black)
                    .font(.system(size: 19, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Room name")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.room_name.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.room_name)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                })
                .padding()
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Name of purchase")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.purchase_name.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.purchase_name)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                })
                .padding()
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Quantity")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.quantity.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.quantity)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .keyboardType(.decimalPad)
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addPlan {
                        
                        viewModel.fetchPlans()
                        
                        router.wrappedValue.dismiss()
                    }
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.room_name.isEmpty || viewModel.purchase_name.isEmpty || viewModel.quantity.isEmpty ? 0.5 : 1)
                .disabled(viewModel.room_name.isEmpty || viewModel.purchase_name.isEmpty || viewModel.quantity.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    ShoppingAdd(viewModel: ShoppingViewModel())
}
