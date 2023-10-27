//
//  ShoppingView.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct ShoppingView: View {
    
    @StateObject var viewModel = ShoppingViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Shopping Plan")
                    .foregroundColor(.black)
                    .font(.system(size: 23, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                if viewModel.shoppings.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("Empty")
                            .foregroundColor(.black)
                            .font(.system(size: 23, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("You have no planned purchases yet")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVStack {
                            
                            ForEach(viewModel.shoppings, id: \.self) { index in
                            
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text(index.room_name ?? "")
                                        .foregroundColor(.black)
                                        .font(.system(size: 15, weight: .medium))
                                    
                                    Button(action: {
                                        
                                        if viewModel.completed_shoppings.contains(index.purchase_name ?? "") {
                                            
                                            if let indexer = viewModel.completed_shoppings.firstIndex(of: index.purchase_name ?? "") {
                                                
                                                viewModel.completed_shoppings.remove(at: indexer)
                                            }
                                            
                                        } else {
                                            
                                            viewModel.completed_shoppings.append(index.purchase_name ?? "")
                                        }
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            Circle()
                                                .stroke(.gray.opacity(0.6))
                                                .frame(width: 25, height: 25)
                                                .overlay (
                                                
                                                    Circle()
                                                        .fill(.black)
                                                        .frame(width: 25, height: 25)
                                                        .overlay (
                                                        
                                                            Image(systemName: "checkmark")
                                                                .foregroundColor(.white)
                                                                .font(.system(size: 13, weight: .bold))
                                                        )
                                                        .opacity(viewModel.completed_shoppings.contains(index.purchase_name ?? "") ? 1 : 0)
                                                )
                                            
                                            Text(index.purchase_name ?? "")
                                                .foregroundColor(.black)
                                                .font(.system(size: 15, weight: .regular))
                                            
                                            Spacer()
                                            
                                            Text("\(index.quantity)")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(6)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                    })
                                })
                            }
                        }
                        .padding()
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.isAdd = true
                    
                }, label: {
                    
                    Text("Add a purchase plan")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            ShoppingAdd(viewModel: viewModel)
        })
        .onAppear {
            
            viewModel.fetchPlans()
        }
    }
}

#Preview {
    ShoppingView()
}
