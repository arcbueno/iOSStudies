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
    @State private var selectedProduct : ProductType?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
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
                
                Text("Produtos").font(.title2).bold().padding()
                
                
                
                ForEach(store.products){ product in
                    
                    Button(action: {
                        selectedProduct = product
                    }, label: {
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
                    }).sheet(item: $selectedProduct, content: { product in
                        ProductDetailView(product: product)
                        
                    })
                    
                   
                    
                }
                
                
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
