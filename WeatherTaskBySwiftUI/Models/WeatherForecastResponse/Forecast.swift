//
//  Forecast.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Forecast: Codable {

  enum CodingKeys: String, CodingKey {
    case forecastday
  }

  var forecastday: [Forecastday]?


}
