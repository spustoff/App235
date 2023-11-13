//
//  Users_4.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI
import OneSignalFramework

struct Users_4: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            Image("users_4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center, spacing: 5, content: {
                    
                    Text("Don’t miss anything")
                        .foregroundColor(.black)
                        .font(.system(size: 25 ,weight: .bold))
                        .multilineTextAlignment(.center)
                    
                    Text("Don’t miss the most userful information")
                        .foregroundColor(.gray)
                        .font(.system(size: 15 ,weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding()
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular))
                            .frame(width: 50, height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.black))
                    })
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable Notification")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("primary")))
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
    Users_4()
}
