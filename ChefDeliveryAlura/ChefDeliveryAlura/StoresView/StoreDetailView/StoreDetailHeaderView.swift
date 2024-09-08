//
//  StoreDetailHeaderView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 04/09/24.
//

import SwiftUI

struct StoreDetailHeaderView: View {
    let store: StoreType
    
    var body: some View {
        VStack(alignment: .leading){
            Image(store.headerImage).resizable().scaledToFit()
            HStack(spacing: 8) {
                Text(store.name)
                    .font(.title)
                    .bold()
                Spacer()
                Image(store.logoImage)
            }
            .padding(.vertical,8)
                .padding(.horizontal)
            
            HStack{
                Text(store.location)
                ForEach(1...store.stars, id: \.self){ _ in
                    Image(systemName: "star.fill").foregroundColor(.yellow).font(.caption)
                    
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
            
        }
    }
}

struct StoreDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailHeaderView(store: restaurantsMock[0])
    }
}
