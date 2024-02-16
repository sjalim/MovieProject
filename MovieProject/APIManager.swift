//
//  APIManager.swift
//  MovieProject
//
//  Created by Saruar Jahan on 16/2/24.
//

import Foundation
enum APIError: Error {
    case invalidUrl
    case errorDecode
    case failed(error: Error)
    case unknownError
}

class APIManager {
    
    
    static let shared = APIManager()
    private init() { }
    
    let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=3f3bc846aefb002ac1a48d96b0a8b75b&query=marvel")
    
    func fetchData(completion: @escaping (Swift.Result<MoviesModel, APIError>) -> Void) {
        let urlRequest = URLRequest(url: url!)
        URLSession.shared.dataTask(with: urlRequest) { data, response, error  in
            if error != nil {
                print("dataTask error: \(error!.localizedDescription)")
                completion(.failure(.failed(error: error!)))
            } else if let data = data {
                // Success request
                do {
                    // 4. Decode json into array of User
                    let getRespose = try JSONDecoder().decode(MoviesModel.self, from: data)
                    print("success")
                    
                    completion(.success(getRespose))
                } catch {
                    // Send error when decoding
                    print("decoding error")
                    completion(.failure(.errorDecode))
                }
            } else {
                print("unknown dataTask error")
                completion(.failure(.unknownError))
            }
        }
        .resume()
    }
    
}
