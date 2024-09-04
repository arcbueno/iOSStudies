//
//  StoreItemView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 03/09/24.
//

import SwiftUI

struct StoreItemView: View {
    let order: StoreType
    var body: some View {
        HStack{
            Image(order.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            
            Text(order.name)
                .font(.subheadline)
            Spacer()
        }
    }
}

struct StoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(order: restaurantsMock[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
