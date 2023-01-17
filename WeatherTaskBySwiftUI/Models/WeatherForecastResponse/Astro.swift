//
//  Astro.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Astro: Codable {

  enum CodingKeys: String, CodingKey {
    case moonIllumination = "moon_illumination"
    case sunset
    case sunrise
    case moonrise
    case moonset
    case moonPhase = "moon_phase"
  }

  var moonIllumination: String?
  var sunset: String?
  var sunrise: String?
  var moonrise: String?
  var moonset: String?
  var moonPhase: String?



}
