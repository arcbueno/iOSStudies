//
//  StoresContainerView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 03/09/24.
//

import SwiftUI

struct StoresContainerView: View {
    let title = "Lojas"
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline).padding(.bottom, 20)
            
            VStack(alignment: .leading,spacing: 30){
                ForEach(restaurantsMock){ item in
                    StoreItemView(order: item)
                }
            }
        }.padding(20)
    }
}

struct StoresContainerView_Previews: PreviewProvider {
    static var previews: some View {
        StoresContainerView()
    }
}
