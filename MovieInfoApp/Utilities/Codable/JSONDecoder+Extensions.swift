//
//  JSONDecoder+Extensions.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import Foundation

extension JSONDecoder {
    static let standard: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
}
