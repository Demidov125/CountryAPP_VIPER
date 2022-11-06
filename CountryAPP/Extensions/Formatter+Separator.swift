//
//  Formatter+Separator.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 27.10.2022.
//


import UIKit

extension Formatter {
    /// Формат для для разделения числовых значений 
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter
    }()
}

extension Numeric {
    var formattedWithSeparator: String {Formatter.withSeparator.string(for: self) ?? ""}
}
