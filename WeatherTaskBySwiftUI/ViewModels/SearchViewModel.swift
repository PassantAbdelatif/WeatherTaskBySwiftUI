//
//  SearchViewModel.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 18/01/2023.
//

import Foundation
import Combine
import SwiftUI
@MainActor
class SearchViewModel: ObservableObject {
    
    @Published private(set) var state: LoadingState = .idle
    @Published private(set) var weatherForecastSearchResults: [WeatherAutoCompleteSearchResponse]?
    
    private var bindings = Set<AnyCancellable>()
    private let networkService: WeatherForecastServiceProtocol
    
    @Published private(set) var showErrorAlert = false
    @Published private(set) var showAutoCompleteView = false
    
    init(weatherForecastService: WeatherForecastServiceProtocol = WeatherForecastService()) {
        self.networkService = weatherForecastService
    }
    
    func getWeatherForecastSearchResults(searchKeyWord: String) async {
        await fetchweatherForecastSearchResults(with: searchKeyWord)
    }
    
}

extension SearchViewModel {
    func fetchweatherForecastSearchResults(with searchKeyWord: String) async {
        state = .loading
        
        do {
           let weatherForecastSearchResults = try await networkService.fetchWeatherAutoCompleteSearchResults(cityName: searchKeyWord)
            if !weatherForecastSearchResults.isEmpty {
                self.weatherForecastSearchResults = weatherForecastSearchResults
                state = .success
                showAutoCompleteView = true
            } else {
                showAutoCompleteView = false
            }
        } catch(let error) {
            showErrorAlert = true
            state = .failed(ErrorViewModel(message: error.localizedDescription))
        }
    }
    
}
