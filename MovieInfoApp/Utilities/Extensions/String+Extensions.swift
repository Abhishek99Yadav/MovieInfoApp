//
//  String+Extensions.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import Foundation

extension String {
    func toDate(format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }
}
