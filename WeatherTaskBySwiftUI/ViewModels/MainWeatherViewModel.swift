//
//  MainWeatherViewModel.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 16/01/2023.
//

import Foundation
import Combine
import SwiftUI

@MainActor
class MainWeatherViewModel: ObservableObject {
    
    @Published private(set) var state: LoadingState = .idle
    @Published private(set) var weatherForecast: WeatherForecastResponse?
    @Published private(set) var todayWeatherForecast: Forecastday?
    @Published private(set) var tomorrowweatherForecast: Forecastday?
    @Published private(set) var fridayWeatherForecast: Forecastday?
    
    private var bindings = Set<AnyCancellable>()
    private let networkService: WeatherForecastServiceProtocol
    
    @State var showErrorAlert = false
    @State var showForecastView = false
    
    init(weatherForecastService: WeatherForecastServiceProtocol = WeatherForecastService()) {
        self.networkService = weatherForecastService
    }
    
    func getCurrentWeatherForecast(city: String) async {
      
        await fetchweatherForecast(with: city)
   
    }
    
}

extension MainWeatherViewModel {
    func fetchweatherForecast(with cityName: String) async {
        state = .loading
        
        do {
           weatherForecast = try await networkService.fetchWeatherForecastResults(cityName: cityName)
           setForecastDays()
           state = .success
        } catch(let error) {
            showErrorAlert = true
            state = .failed(ErrorViewModel(message: error.localizedDescription))
        }
    }
    
    func setForecastDays() {
        if let forecastDays = weatherForecast?.forecast?.forecastday,
           !forecastDays.isEmpty {
            
            showForecastView = true
            
            if let todayForecast = forecastDays.first(where: {$0.isToday == true}) {
                self.todayWeatherForecast = todayForecast
            }
            
            if let tomorrowForecast = forecastDays.first(where: {$0.isTomorrow == true}) {
                self.tomorrowweatherForecast = tomorrowForecast
            }
            
            if let fridayForecast = forecastDays.first(where: {$0.isFriday == true}) {
                self.fridayWeatherForecast = fridayForecast
            }
        }
    }
}
