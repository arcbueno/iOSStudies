//
//  ContentView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 02/09/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar()
                .padding(.horizontal, 15)
            ScrollView(.vertical, showsIndicators: false){
                VStack (spacing: 20){
                    OrderTypeGridView()
                    CarrouselTabView()
                    StoresContainerView()
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
