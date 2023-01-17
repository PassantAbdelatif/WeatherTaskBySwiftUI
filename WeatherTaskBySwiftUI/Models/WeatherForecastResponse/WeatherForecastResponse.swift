//
//  WeatherForecastResponse.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct WeatherForecastResponse: Codable, Equatable {
    static func == (lhs: WeatherForecastResponse,
                    rhs: WeatherForecastResponse) -> Bool {
        return true
    }
    

  enum CodingKeys: String, CodingKey {
    case current
    case location
    case forecast
  }

  var current: Current?
  var location: Location?
  var forecast: Forecast?

}
