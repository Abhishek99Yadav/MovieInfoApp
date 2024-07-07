//
//  NetworkManager.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func request(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        AF.request(url).responseJSON { response in
            switch response.result {
            case .success(let value):
//                print("JSON Response: \(value)")
                completion(.success(response.data ?? Data()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
