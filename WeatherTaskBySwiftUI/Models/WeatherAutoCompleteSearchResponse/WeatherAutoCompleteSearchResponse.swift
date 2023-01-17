//
//  WeatherAutoCompleteSearchResponse.swift
//
//  Created by Passant Abdelatif on 04/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct WeatherAutoCompleteSearchResponse: Codable {

  enum CodingKeys: String, CodingKey {
    case country
    case lon
    case url
    case lat
    case region
    case name
    case id
  }

  var country: String?
  var lon: Float?
  var url: String?
  var lat: Float?
  var region: String?
  var name: String?
  var id: Int?


}
