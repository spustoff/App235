//
//  AddRoom.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct AddRoom: View {
    
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
                
                Text("New Room")
                    .foregroundColor(.black)
                    .font(.system(size: 19, weight: .medium))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Image("room_img")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    
                    Text("Room name")
                        .foregroundColor(.black)
                        .font(.system(size: 14, weight: .regular))
                        .multilineTextAlignment(.leading)
                    
                    ZStack(alignment: .leading, content: {
                        
                        Text("Enter")
                            .foregroundColor(.gray)
                            .font(.system(size: 15, weight: .regular))
                            .opacity(viewModel.name_room.isEmpty ? 1 : 0)
                        
                        TextField("", text: $viewModel.name_room)
                            .foregroundColor(.black)
                            .font(.system(size: 15, weight: .regular))
                    })
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.1)))
                })
                .padding()
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                    viewModel.rooms.append(viewModel.name_room)
                    
                }, label: {
                    
                    Text("Create")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.name_room.isEmpty ? 0.5 : 1)
                .disabled(viewModel.name_room.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    AddRoom(viewModel: MainViewModel())
}
