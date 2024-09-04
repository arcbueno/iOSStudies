//
//  Double+.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 03/09/24.
//

import Foundation

extension Double{
    func formatPrice() -> String{
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
