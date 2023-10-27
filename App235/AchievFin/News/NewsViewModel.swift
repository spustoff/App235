//
//  NewsViewModel.swift
//  App235
//
//  Created by Вячеслав on 10/27/23.
//

import SwiftUI
import Alamofire

final class NewsViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var news: [NewsItem] = []
    
    @Published var selected_news: NewsItem?
    @Published var isDetail: Bool = false
    
    func getNews() {
        
        isLoading = true
        
        self.fetchNews { result in
            
            switch result {
                
            case .success(let success):
                
                self.news = success.results
                
            case .failure(let failure):
                
                debugPrint("Parse error - \(failure)")
                
                self.isLoading = false
            }
        }
    }
    
    func fetchNews(completion: @escaping (Result<NewsModel, Error>) -> Void ) {
        
        isLoading = true
        
        let params: Parameters = [
            
            "token": "131c24ee-ccfe-4e6b-93a3-77d6c7456665",
        ]
        
        let request = AF.request("https://bibasar.space/api/v2/news", method: .get, parameters: params)
        
        request.responseDecodable(of: NewsModel.self) { response in
            
            guard let value = response.value else {
                
                self.isLoading = false
                return
            }
                           
            switch response.result{
                
            case .success(_):
                
                completion(.success(value))
                self.isLoading = false
                
            case .failure(_):
                
                completion(.failure(response.error.debugDescription as! Error))
                self.isLoading = false
            }
        }
    }
}
