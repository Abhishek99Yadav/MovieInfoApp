//
//  Constants.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import UIKit

struct Constants {
    struct API {
        static let baseURL = "https://jsonfakery.com/movies/paginated"
    }
    
    struct UI {
        static let cornerRadius: CGFloat = 8.0
        static let padding: CGFloat = 16.0
        static let shadowRadius: CGFloat = 4.0
        static let shadowOpacity: Float = 0.25
        static let backgroundColor = UIColor.systemBackground
        static let primaryTextColor = UIColor.label
        static let secondaryTextColor = UIColor.secondaryLabel
    }
}
