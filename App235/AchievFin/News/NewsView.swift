//
//  NewsView.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct NewsView: View {
    
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("News")
                    .foregroundColor(.black)
                    .font(.system(size: 23, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                if viewModel.isLoading {
                    
                    ProgressView()
                        .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    if viewModel.news.isEmpty {
                        
                        VStack(alignment: .center, spacing: 10, content: {
                            
                            Text("Empty")
                                .foregroundColor(.black)
                                .font(.system(size: 23, weight: .bold))
                                .multilineTextAlignment(.center)
                            
                            Text("Any news is empty")
                                .foregroundColor(.gray)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.center)
                        })
                        .frame(maxHeight: .infinity, alignment: .center)
                        
                    } else {
                        
                        ScrollView(.vertical, showsIndicators: true) {
                            
                            LazyVStack {
                                
                                ForEach(viewModel.news, id: \.self) { index in
                                    
                                    Button(action: {
                                        
                                        viewModel.selected_news = index
                                        viewModel.isDetail = true
                                        
                                    }, label: {
                                        
                                        HStack {
                                            
                                            WebPic(urlString: index.resultImage ?? "", width: 90, height: 75, cornerRadius: 15, isPlaceholder: true)
                                            
                                            VStack(alignment: .leading, content: {
                                                
                                                Text(index.resultDateTime ?? "")
                                                    .foregroundColor(.gray)
                                                    .font(.system(size: 13, weight: .regular))
                                                
                                                Text(index.resultTitle ?? "")
                                                    .foregroundColor(.black)
                                                    .font(.system(size: 15, weight: .medium))
                                                    .lineLimit(2)
                                                    .multilineTextAlignment(.leading)
                                            })
                                            
                                            Spacer()
                                        }
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                                    })
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
        }
        .onAppear {
            
            viewModel.getNews()
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selected_news {
                
                NewsDetail(index: index)
            }
        })
    }
}

#Preview {
    NewsView()
}
