//
//  WeatherForecastService.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 04/101/2022.
//

import Moya
import Foundation
import Combine

protocol WeatherForecastServiceProtocol {
    func fetchWeatherForecastResults(cityName: String)
    -> AnyPublisher<WeatherForecastResponse?, Error>
    func fetchWeatherAutoCompleteSearchResults(cityName: String)
    -> AnyPublisher<[WeatherAutoCompleteSearchResponse]?, Error>
}

final class WeatherForecastService: WeatherForecastServiceProtocol {
    
    let provider = MoyaProvider<WeatherApi>()
    
    func fetchWeatherForecastResults(cityName: String) -> AnyPublisher<WeatherForecastResponse?, Error> {
        
        provider.requestPublisher(.getAllWeatherForecast(cityName: cityName),
                                  callbackQueue: .main)
        .map(WeatherForecastResponse.self)
        .print()
        .map({ response in
            do {
                
                return response
            }
        })
        .mapError({$0 as Error})
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    func fetchWeatherAutoCompleteSearchResults(cityName: String) -> AnyPublisher<[WeatherAutoCompleteSearchResponse]?, Error> {
        provider.requestPublisher(.getAutoCompleteSearchResults(cityName: cityName),
                                  callbackQueue: .main)
        .map([WeatherAutoCompleteSearchResponse].self)
        .map({ response in
            let weatherDays = response
            if !weatherDays.isEmpty {
                
                return weatherDays
            } else {
                
            }
            return []
        })
        .mapError({$0 as Error})
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}


