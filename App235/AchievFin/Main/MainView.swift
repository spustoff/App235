//
//  MainView.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .leading, spacing: 9, content: {
                    
                    Text("Budget for renovations")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                    Text("$32000")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .bold))
                        .multilineTextAlignment(.leading)
                    
                    Text("/100,000.00")
                        .foregroundColor(.gray)
                        .font(.system(size: 12, weight: .regular))
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 50)
                })
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(LinearGradient(colors: [Color.black, Color("primary")], startPoint: .leading, endPoint: .trailing).cornerRadius(15))
                .padding()
                
                Text("Rooms")
                    .foregroundColor(.black)
                    .font(.system(size: 19, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                if viewModel.rooms.isEmpty {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Text("No added rooms")
                            .foregroundColor(.black)
                            .font(.system(size: 23, weight: .bold))
                            .multilineTextAlignment(.center)
                        
                        Text("You don't have any added rooms that are being renovated yet. But it's time to add")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.rooms, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selected_room = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Image("room_img")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                        
                                        Text(index)
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                            .multilineTextAlignment(.leading)
                                    }
                                })
                            }
                        })
                        .padding()
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.isAddRoom = true
                    
                }, label: {
                    
                    Text("Add a room")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
        }
        .sheet(isPresented: $viewModel.isAddRoom, content: {
            
            AddRoom(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            RoomDetail(viewModel: viewModel, room_name: viewModel.selected_room)
        })
    }
}

#Preview {
    MainView()
}
