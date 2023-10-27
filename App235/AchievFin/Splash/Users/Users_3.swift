//
//  Users_3.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct Users_3: View {
    
    let telegram: URL
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("users_3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("Join and earn")
                        .foregroundColor(.black)
                        .font(.system(size: 25 ,weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Join our Telegram group trade with our team")
                        .foregroundColor(.gray)
                        .font(.system(size: 15 ,weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                HStack {
                    
                    NavigationLink(destination: {
                        
                        Users_4()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                            .frame(width: 50, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                    })
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color(red: 12/255, green: 132/255, blue: 228/255)))
                    })
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(Color.white)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    Users_3(telegram: URL(string: "h")!)
}
