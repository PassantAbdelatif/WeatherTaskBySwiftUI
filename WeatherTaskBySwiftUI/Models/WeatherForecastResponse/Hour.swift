//
//  Hour.swift
//
//  Created by Passant Abdelatif on 03/01/2023
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Hour: Codable {
    
    enum CodingKeys: String, CodingKey {
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case gustMph = "gust_mph"
        case timeEpoch = "time_epoch"
        case uv
        case feelslikeC = "feelslike_c"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case pressureIn = "pressure_in"
        case humidity
        case chanceOfSnow = "chance_of_snow"
        case windMph = "wind_mph"
        case visMiles = "vis_miles"
        case windchillC = "windchill_c"
        case precipIn = "precip_in"
        case condition
        case visKm = "vis_km"
        case pressureMb = "pressure_mb"
        case windchillF = "windchill_f"
        case precipMm = "precip_mm"
        case windDir = "wind_dir"
        case heatindexF = "heatindex_f"
        case windKph = "wind_kph"
        case isDay = "is_day"
        case tempC = "temp_c"
        case cloud
        case gustKph = "gust_kph"
        case feelslikeF = "feelslike_f"
        case windDegree = "wind_degree"
        case tempF = "temp_f"
        case time
        case heatindexC = "heatindex_c"
        case willItRain = "will_it_rain"
    }
    
    var chanceOfRain: Int?
    var willItSnow: Int?
    var gustMph: Float?
    var timeEpoch: Int?
    var uv: Int?
    var feelslikeC: Float?
    var dewpointC: Float?
    var dewpointF: Float?
    var pressureIn: Float?
    var humidity: Int?
    var chanceOfSnow: Int?
    var windMph: Float?
    var visMiles: Int?
    var windchillC: Float?
    var precipIn: Float?
    var condition: Condition?
    var visKm: Int?
    var pressureMb: Int?
    var windchillF: Float?
    var precipMm: Float?
    var windDir: String?
    var heatindexF: Float?
    var windKph: Float?
    var isDay: Int?
    var tempC: Float?
    var cloud: Int?
    var gustKph: Float?
    var feelslikeF: Float?
    var windDegree: Int?
    var tempF: Float?
    var time: String?
    var heatindexC: Float?
    var willItRain: Int?
}
