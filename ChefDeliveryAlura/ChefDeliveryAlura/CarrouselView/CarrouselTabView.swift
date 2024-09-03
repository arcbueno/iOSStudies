//
//  CarrouselTabView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 03/09/24.
//

import SwiftUI

struct CarrouselTabView: View {
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "burguer", image: "barbecue-banner"),
        OrderType(id: 2, name: "brazil", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "poke", image: "pokes-banner"),
    ]
    var body: some View {
        TabView{
            ForEach(ordersMock){ mock in
                CarrouselItemView(order: mock)
                
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct CarrouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarrouselTabView()
    }
}
