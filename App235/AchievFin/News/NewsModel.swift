//
//  NewsModel.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI

struct NewsModel: Codable, Hashable {

    var results: [NewsItem]
}

struct NewsItem: Codable, Hashable {
        
    var resultId: Int?
    
    var resultTitle: String?
    var resultImage: String?
    
    var resultMark: String?
    var resultDateTime: String?
    
    var resultText: String?
    
    var resultTotalLikes: Int?
    var resultTotalComments: Int?
}
