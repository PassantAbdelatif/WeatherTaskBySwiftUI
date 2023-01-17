//
//  WeatherTaskBySwiftUIApp.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 15/01/2023.
//

import SwiftUI

@main
struct WeatherTaskBySwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            let networkService = WeatherForecastService()
            let viewModel = MainWeatherViewModel(weatherForecastService: networkService)
            WeatherForecastContentView(viewModel: viewModel)
        }
    }
}
