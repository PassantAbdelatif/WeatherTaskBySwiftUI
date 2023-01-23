//
//  UIDevice+Extension.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 18/01/2023.
//

import UIKit
extension UIDevice {
    /// Returns `true` if the device has a notch
    var hasNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            return bottom > 0
        } else {
            return false
        }
    }
}
