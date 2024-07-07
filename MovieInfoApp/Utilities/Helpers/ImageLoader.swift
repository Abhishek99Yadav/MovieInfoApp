//
//  ImageLoader.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import UIKit
import SDWebImage

class ImageLoader {
    static func loadImage(urlString: String, into imageView: UIImageView) {
        if let url = URL(string: urlString) {
            imageView.sd_setImage(with: url, completed: nil)
        }
    }
}
