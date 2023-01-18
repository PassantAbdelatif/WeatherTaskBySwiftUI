//
//  SearchViewModel.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 18/01/2023.
//

import Foundation
import Combine
import Moya
import SwiftUI

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
    
    func getWeatherForecastSearchResults(searchKeyWord: String) {
        fetchweatherForecastSearchResults(with: searchKeyWord)
    }
    
}

extension SearchViewModel {
    func fetchweatherForecastSearchResults(with searchKeyWord: String) {
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
        
        let valueHandler: ([WeatherAutoCompleteSearchResponse]?) -> Void = { [weak self] weatherForecastSearchResults in
            if let weatherForecastSearchResults = weatherForecastSearchResults,
               !weatherForecastSearchResults.isEmpty {
                self?.showAutoCompleteView = true
                self?.weatherForecastSearchResults = weatherForecastSearchResults
            } else {
                self?.showAutoCompleteView = false
            }
            
        }
        
        networkService
            .fetchWeatherAutoCompleteSearchResults(cityName: searchKeyWord)
            .sink(receiveCompletion: receiveCompletionHandler, receiveValue: valueHandler)
            .store(in: &bindings)
    }
    
}
