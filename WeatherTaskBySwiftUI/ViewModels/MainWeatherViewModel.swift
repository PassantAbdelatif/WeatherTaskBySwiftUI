//
//  MainWeatherViewModel.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 16/01/2023.
//

import Foundation
import Combine
import Moya
import SwiftUI

class MainWeatherViewModel: ObservableObject {
    
    @Published private(set) var state: LoadingState = .idle
    @Published private(set) var weatherForecast: WeatherForecastResponse?
    @Published private(set) var todayWeatherForecast: Forecastday?
    @Published private(set) var tomorrowweatherForecast: Forecastday?
    @Published private(set) var fridayWeatherForecast: Forecastday?
    @Published var city = "Alexandria"
    
    private var bindings = Set<AnyCancellable>()
    private let networkService: WeatherForecastServiceProtocol
    
    @State var showErrorAlert = false
    @State var showForecastView = false
    
    init(weatherForecastService: WeatherForecastServiceProtocol = WeatherForecastService()) {
        self.networkService = weatherForecastService
    }
    
    func getCurrentWeatherForecast() {
        fetchweatherForecast(with: self.city)
    }
    
}

extension MainWeatherViewModel {
    func fetchweatherForecast(with cityName: String) {
        state = .loading
        
        let receiveCompletionHandler: (Subscribers.Completion<Error>) -> Void = { [weak self] completion in
            switch completion {
            case .failure(let error):
                self?.showErrorAlert = true
                self?.state = .failed(ErrorViewModel(message: error.localizedDescription))
            case .finished:
                self?.state = .success
            }
        }
        
        let valueHandler: (WeatherForecastResponse?) -> Void = { [weak self] weatherForecast in
            self?.weatherForecast = weatherForecast
            self?.setForecastDays()
        }
        
        networkService
            .fetchWeatherForecastResults(cityName: cityName)
            .sink(receiveCompletion: receiveCompletionHandler, receiveValue: valueHandler)
            .store(in: &bindings)
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
