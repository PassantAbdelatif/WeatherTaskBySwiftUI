//
//  UITableView+Extension.swift
//  WeatherTaskBySwiftUI
//
//  Created by Passant Abdelatif on 18/01/2023.
//

import SwiftUI
extension View {
    /// Clear tableview and cell color
    func tableClearColor() {
        let tableHeaderView = UIView(frame: .zero)
        tableHeaderView.frame.size.height = 0.5
        UITableView.appearance().tableHeaderView = tableHeaderView
    }
}
