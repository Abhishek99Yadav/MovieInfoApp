//
//  Movie.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import Foundation

struct Movie: Decodable {
    let id: String
    let originalTitle: String
    let releaseDate: String
    let posterPath: String
    let overview: String
    let casts: [Cast]
    
    enum CodingKeys: String, CodingKey {
        case id
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case overview
        case casts
    }
}

struct Cast: Decodable {
    let character: String
    let name: String
    let profilePath: String
    
    enum CodingKeys: String, CodingKey {
        case character
        case name
        case profilePath = "profile_path"
    }
}

struct MoviesResponse: Decodable {
    let data: [Movie]
}

