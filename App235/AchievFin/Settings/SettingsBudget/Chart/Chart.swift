//
//  Chart.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct Chart: View {
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Rectangle()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 60, height: 5)
                    .padding(.vertical)
                
                Text("EUR/USD")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .medium))
                
                HStack {
                    
                    Text("\(Int.random(in: 1...25555))")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold))
                    
                    Text("%\(Int.random(in: 1...25))")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .regular))
                        .padding(6)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                    
                    Spacer()
                }
                .padding()
                
                TradeChart(pair: "EURUSD")
                    .disabled(true)
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Done")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
    }
}

#Preview {
    Chart()
}
