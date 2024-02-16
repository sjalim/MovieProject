//
//  MovieViewModel.swift
//  MovieProject
//
//  Created by Saruar Jahan on 16/2/24.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
       @Published var movies: [Result] = []
       @Published var error: APIError?
       
       private var cancellables = Set<AnyCancellable>()
       private let apiManager = APIManager.shared
       
       func getAllMoviesData() {
           apiManager.fetchData { result in
                   DispatchQueue.main.async {
                       switch result {
                       case .success(let response):
                           debugPrint("Recent movies data fetched")
                           self.movies = response.results
                           dump(response.results)
                       case .failure(let error):
                           debugPrint("Error: in getAllMoviesData() \(error.localizedDescription)")
                           self.error = error
                       }
                   }
               }
       }
}
