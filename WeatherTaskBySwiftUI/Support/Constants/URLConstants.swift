//
//  URLConstants.swift
//  CurrencyConverterApp
//
//  Created by Passant Abdelatif on 10/12/2022.
//

import Foundation
struct APPURL {
    
    private struct Domains {
        static let Dev = "http://api.weatherapi.com"
        static let UAT = ""
        static let Local = ""
        static let QA = ""
    }
    
    private  struct Routes {
        static let Api = "/v1"
    }
    
    private  static let Domain = Domains.Dev
    private  static let Route = Routes.Api
    static let BaseURL = Domain + Route
    
    struct Paths {
        static let getAllWeatherForecast = "/forecast.json"
        static let getAutoCompleteSearchResults = "/search.json"
    }
}
