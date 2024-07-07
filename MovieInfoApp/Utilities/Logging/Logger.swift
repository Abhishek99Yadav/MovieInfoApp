//
//  Logger.swift
//  MovieInfoApp
//
//  Created by Abhishek Yadav on 08/07/24.
//

import Foundation

class Logger {
    static func log(_ message: String, level: LogLevel = .info) {
#if DEBUG
        print("\(level.rawValue): \(message)")
#endif
    }
    
    enum LogLevel: String {
        case info = "INFO"
        case warning = "WARNING"
        case error = "ERROR"
    }
}
