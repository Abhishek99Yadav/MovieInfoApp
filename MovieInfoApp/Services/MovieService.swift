//
//  MovieService.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import Alamofire

class MovieService {
    static let shared = MovieService()
    private let baseURL = "https://jsonfakery.com/movies/paginated"
    
    func fetchMovies(page: Int, completion: @escaping (Result<[Movie], Error>) -> Void) {
        let url = "\(baseURL)?page=\(page)"
        AF.request(url).responseDecodable(of: [Movie].self) { response in
            switch response.result {
            case .success(let movies):
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
