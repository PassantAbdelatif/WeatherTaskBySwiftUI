//
//  CurrencyService.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/01/2022.
//

import Foundation
import Moya

enum WeatherApi {
    case getAllWeatherForecast(cityName: String)
    case getAutoCompleteSearchResults(cityName: String)
}

extension WeatherApi: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: APPURL.BaseURL) else { fatalError() }
            return url
      
    }
    
    var path: String {
        switch self {
        case .getAllWeatherForecast:
            return APPURL.Paths.getAllWeatherForecast
        case .getAutoCompleteSearchResults:
            return APPURL.Paths.getAutoCompleteSearchResults
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllWeatherForecast:
            return .get
        case .getAutoCompleteSearchResults:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getAllWeatherForecast(let cityName):
            
            return .requestParameters(parameters: [Key.Headers.searchKey: cityName,
                                                   Key.Headers.days: 7,
                                                   Key.Headers.key: Bundle.main.infoDictionary?[Key.Headers.weatherApiKey] ?? ""],
                                      encoding: URLEncoding.queryString)
        case .getAutoCompleteSearchResults(let cityName):
            return .requestParameters(parameters: [Key.Headers.searchKey: cityName,
                                                   Key.Headers.key: Bundle.main.infoDictionary?[Key.Headers.weatherApiKey] ?? ""],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [Key.Headers.ContentType: Key.Headers.contentTypeValue]
    }
    
}
