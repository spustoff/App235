//
//  SettingsBudget.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct SettingsBudget: View {
    
    @Environment(\.presentationMode) var router
    
    @AppStorage("budget") var budget: Int = 0
    
    @State var budget_field: String = ""
    @State var isChart: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Edit Budget")
                        .foregroundColor(.black)
                        .font(.system(size: 17, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding(.top)
                .padding()
                
                VStack(alignment: .leading, content: {
                    
                    Text("Budget for renovations")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .regular))
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("$\(budget)")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(budget_field.isEmpty ? 1 : 0)
                        
                        TextField("", text: $budget_field)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                            .keyboardType(.decimalPad)
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                    
                    Rectangle()
                        .fill(.gray.opacity(0.15))
                        .frame(height: 1)
                        .padding(.vertical, 10)
                    
                    VStack(alignment: .leading, spacing: 10, content: {
                        
                        Text("Currency")
                            .foregroundColor(.gray)
                            .font(.system(size: 13, weight: .regular))
                        
                        Button(action: {
                            
                            isChart = true
                            
                        }, label: {
                            
                            HStack {
                                
                                Text("EUR/USD")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12, weight: .regular))
                            }
                        })
                    })
                    
                    Button(action: {
                        
                        budget = Int(budget_field) ?? 0
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Text("Save")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            .padding(.top)
                    })
                })
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                .padding()
                
                Spacer()
            }
        }
        .sheet(isPresented: $isChart, content: {
            
            Chart()
        })
    }
}

#Preview {
    SettingsBudget()
}
