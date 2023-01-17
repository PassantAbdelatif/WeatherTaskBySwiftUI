//
//  OptionalExtension.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 05/01/2023.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String {
        self ?? ""
    }
}
