//
//  StoreDetailView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 03/09/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading){
                StoreDetailHeaderView(store: store)
                
                StoreDetailProductsView(products: store.products)
                
            }.navigationTitle(store.name)
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading){
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack(spacing: 4){
                                Image(systemName: "cart")
                                Text("Lojas")
                            }.foregroundColor(Color("ColorRed"))
                        }
                    }
                }
        }
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: restaurantsMock[0])
    }
}
