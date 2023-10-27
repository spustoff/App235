//
//  NewsDetail.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct NewsDetail: View {
    
    let index: NewsItem
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        WebPic(urlString: index.resultImage ?? "", width: .infinity, height: 250, cornerRadius: 0, isPlaceholder: true)
                        
                        VStack(alignment: .leading, content: {
                            
                            Text(index.resultDateTime ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 12, weight: .regular))
                                .padding(.bottom, 1)
                            
                            Text(index.resultTitle ?? "")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text(index.resultText ?? "")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    
    NewsDetail(index: NewsItem(resultId: 0, resultTitle: "dfaospkfds", resultImage: "dfpsok", resultMark: "fdpsokf", resultDateTime: "fdspok", resultText: "fpdosj", resultTotalLikes: 0, resultTotalComments: 0))
}
