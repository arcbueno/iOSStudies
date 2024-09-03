//
//  CassouselItemView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 03/09/24.
//

import SwiftUI

struct CarrouselItemView: View {
    let order: OrderType
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct CarrouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarrouselItemView(order: OrderType(id: 1, name: "", image: "barbecue-banner"))
            .previewLayout(.sizeThatFits).padding()
    }
}
