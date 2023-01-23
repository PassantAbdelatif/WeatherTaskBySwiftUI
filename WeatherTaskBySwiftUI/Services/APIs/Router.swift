//
//  Router.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/101/2022.
//

import Foundation
import CryptoKit

enum Router: Equatable {
    case allWeatherForecast(cityName: String)
    case weatherSearchResults(searchKeyWord: String)

    var url: String {API.schemeURL + path}

    var path: String {
        switch self {
        case .allWeatherForecast:
            return "/forecast.json"
            
        case .weatherSearchResults:
            return "/search.json"
        }
    }

    var parameters: [URLQueryItem]? {
        switch self {
        case .allWeatherForecast(let cityName):
            return [URLQueryItem(name: Key.Headers.searchKey, value: cityName),
                    URLQueryItem(name: Key.Headers.days, value: "7"),
                    URLQueryItem(name: Key.Headers.key, value: API.privateKey )]
            
        case .weatherSearchResults(let searchKeyWord):
            return [URLQueryItem(name: Key.Headers.searchKey, value: searchKeyWord),
                    URLQueryItem(name: Key.Headers.key, value: API.privateKey )]
        }
    }

    var method: String {
        switch self {
        case .allWeatherForecast:
            return "GET"
        case .weatherSearchResults:
            return "GET"
        }
    }

}

struct API {
    static var publicKey: String { "Enter your PUBLIC KEY" }
    static var privateKey: String {
        if let weatherKey = Bundle.main.infoDictionary?[Key.Headers.weatherApiKey] as? String {
            return weatherKey
        }
        return ""
    }
    static var schemeURL: String {scheme + "://" + URL + version}
    static var scheme: String {
        return "http"
    }
    static var URL: String {
        "api.weatherapi.com"
    }
    static var version: String {
        "/v1"
    }
}
