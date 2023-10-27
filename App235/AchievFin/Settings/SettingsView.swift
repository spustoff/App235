//
//  SettingsView.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @AppStorage("completed_shoppings") var completed_shoppings: [String] = []
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 23, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                NavigationLink(destination: {
                    
                    SettingsBudget()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .bold))
                        
                        Text("Edit budget")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding(.horizontal)
                    .padding(.bottom)
                })
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1FLb6ZBGv3OGXc5UriksGX7e_GmKr1l1I9EX6_6RuQUE/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .bold))
                        
                        Text("Usage Policy")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .bold))
                        
                        Text("Rate Us")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding(.horizontal)
                })
                
                Button(action: {
                    
                    completed_shoppings.removeAll()
                    
                }, label: {
                    
                    HStack {
                        
                        Image(systemName: "trash.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .bold))
                        
                        Text("Reset Progress (Completed Plans)")
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .medium))
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                    .padding(.horizontal)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
