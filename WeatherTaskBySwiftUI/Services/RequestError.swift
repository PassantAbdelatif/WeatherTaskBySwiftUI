//
//  RequestError.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/101/2022.
//

import Foundation

enum RequestError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorised
    case offline
    case unknown

    var customMessage: String {
        switch self {
        case .decode:
            return "Decode error"
        case .unauthorised:
            return "Session expired"
        default:
            return "Unknown error"
        }
    }
}
