//
//  WeatherForecastService.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/101/2022.
//

import Foundation
import Combine

protocol WeatherForecastServiceProtocol {
    func fetchWeatherForecastResults(cityName: String) async throws -> WeatherForecastResponse
    func fetchWeatherAutoCompleteSearchResults(cityName: String) async throws -> [WeatherAutoCompleteSearchResponse]
}

struct WeatherForecastService: HTTPClient, WeatherForecastServiceProtocol {
    func fetchWeatherAutoCompleteSearchResults(cityName: String) async throws -> [WeatherAutoCompleteSearchResponse] {
        return try await sendRequest(endpoint: .weatherSearchResults(searchKeyWord: cityName),
                                     responseModel: [WeatherAutoCompleteSearchResponse].self)
    }
    
    func fetchWeatherForecastResults(cityName: String) async throws -> WeatherForecastResponse {
        return try await sendRequest(endpoint: .allWeatherForecast(cityName: cityName),
                                     responseModel: WeatherForecastResponse.self)
    }
}
