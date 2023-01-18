//
//  Bindings+Extension.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 18/01/2023.
//

import SwiftUI
extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
