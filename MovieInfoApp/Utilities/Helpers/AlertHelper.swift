//
//  AlertHelper.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import UIKit

class AlertHelper {
    static func showAlert(on viewController: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
