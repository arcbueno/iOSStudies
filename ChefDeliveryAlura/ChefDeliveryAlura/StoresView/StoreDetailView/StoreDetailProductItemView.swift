//
//  StoreDetailProductItemView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 04/09/24.
//

import SwiftUI

struct StoreDetailProductItemView: View {
    let product : ProductType
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 8){
                Text(product.name)
                    .bold()
                Text(product.description).multilineTextAlignment(.leading)
                    .foregroundColor(.black.opacity(0.5))
                
                Text(product.formattedPrice)
            }
            Spacer()
            Image(product.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(12)
                .frame(width: 120, height: 120)
                .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
            
            
        }.padding().foregroundColor(.black)
    }
}

struct StoreDetailProductItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailProductItemView(product: restaurantsMock[0].products[0])
    }
}
