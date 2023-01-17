//
//  AppConstants.swift
//  GitHubRepositoriesApp
//
//  Created by Passant Abdelatif on 07/11/2022.
//

import Foundation
struct Key {

        static let DeviceType = "iOS"
     
        struct Headers {
            static let Authorization = "Authorization"
            static let ContentType = "Content-Type"
            static let key = "key"
            static let weatherApiKey = "WEATHER_API_Key"
            static let searchKey = "q"
            static let aqi = "aqi"
            static let days = "days"
            static let alerts = "alerts"
            static let contentTypeValue = "application/json"
        }

        struct ErrorMessage{
            static let listNotFound = "ERROR_LIST_NOT_FOUND"
            static let validationError = "ERROR_VALIDATION"
        }
    }
