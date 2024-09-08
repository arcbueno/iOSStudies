//
//  StoreDetailProductsView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 04/09/24.
//

import SwiftUI

struct StoreDetailProductsView: View {
    
    let products: [ProductType]
    @State private var selectedProduct : ProductType?
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Produtos").font(.title2).bold().padding()
            
            ForEach(products){ product in
                
                Button(action: {
                    selectedProduct = product
                }, label: {
                    StoreDetailProductItemView(product: product)
                }).sheet(item: $selectedProduct, content: { product in
                    ProductDetailView(product: product)
                    
                })
            }
        }
    }
    
    struct StoreDetailProductsView_Previews: PreviewProvider {
        static var previews: some View {
            StoreDetailProductsView(products: restaurantsMock[0].products)
        }
    }
    
}
