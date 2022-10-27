//
//  Extension + Formater.swift
//  CountryAPP
//
//  Created by Юрий Демидов on 27.10.2022.
//

import Foundation

extension Formatter {
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
