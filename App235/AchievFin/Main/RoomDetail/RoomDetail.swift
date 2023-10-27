//
//  RoomDetail.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct RoomDetail: View {
    
    @Environment(\.presentationMode) var router
    
    @StateObject var viewModel: MainViewModel
    
    let room_name: String
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
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
                .padding(.top)
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        Image("room_img")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .overlay (
                            
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.black.opacity(0.5))
                            )
                            .overlay (
                            
                                VStack(alignment: .leading, spacing: 7, content: {
                                    
                                    Text(room_name)
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .regular))
                                    
                                    Text("$\(10000)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 23, weight: .bold))
                                })
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                                .padding()
                                .padding(.vertical)
                            )
                        
                        HStack {
                            
                            Text("Shopping List")
                                .foregroundColor(.black)
                                .font(.system(size: 22, weight: .semibold))
                            
                            Spacer()
                            
                            Button(action: {
                                
                                viewModel.isAddPurchase = true
                                
                            }, label: {
                                
                                Image(systemName: "plus")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .medium))
                                    .frame(width: 34, height: 34)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            })
                        }
                        .padding(.top)
                        
                        if viewModel.purchases.isEmpty {
                            
                            VStack(alignment: .center, spacing: 10, content: {
                                
                                Text("Empty")
                                    .foregroundColor(.black)
                                    .font(.system(size: 23, weight: .bold))
                                    .multilineTextAlignment(.center)
                                
                                Text("You have no added renovation costs for this room yet")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .multilineTextAlignment(.center)
                            })
                            .frame(maxHeight: .infinity, alignment: .center)
                            .padding(.vertical, 50)
                            
                        } else {
                            
                            ScrollView(.vertical, showsIndicators: true) {
                                
                                LazyVStack {
                                    
                                    ForEach(viewModel.purchases, id: \.self) { index in
                                    
                                        HStack {
                                            
                                            VStack(alignment: .leading, spacing: 5, content: {
                                                
                                                Text((index.date ?? Date()).convertDate(format: "MMM d HH:mm"))
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.name ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                    .multilineTextAlignment(.leading)
                                            })
                                            
                                            Spacer()
                                            
                                            Text("$\(index.cost)")
                                                .foregroundColor(.black)
                                                .font(.system(size: 13, weight: .regular))
                                                .padding(6)
                                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                    }
                                }
                            }
                        }
                    }
                    .padding([.horizontal, .bottom])
                }
            }
        }
        .onAppear {
            
            viewModel.fetchPurchases(room_name: room_name)
        }
//        .onDisappear {
//            
//            viewModel.purchases.removeAll()
//        }
        .sheet(isPresented: $viewModel.isAddPurchase, content: {
            
            AddPurchase(room_name: room_name, viewModel: viewModel)
        })
    }
}

#Preview {
    RoomDetail(viewModel: MainViewModel(), room_name: "room_name")
}
