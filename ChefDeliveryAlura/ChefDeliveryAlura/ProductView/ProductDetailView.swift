//
//  ProductDetailView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 03/09/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    @State private var productQuantity = 1
    
    var service = StoreService()
    
    var body: some View {
        VStack{
            Image(product.image).resizable().scaledToFit()
            VStack(alignment: .leading, spacing: 16){
                Text(product.name).font(.title).bold()
                    .padding(.horizontal)
                    .padding(.top)
                Text(product.description)
                Text(product.formattedPrice).font(.title3).bold()
            }.padding()
            Spacer()
            VStack(spacing: 16){
                Text("Quantidade").bold().font(.title3)
                HStack{
                    Button(action: {
                        if(productQuantity > 1 ){
                            productQuantity -= 1
                        }
                    }, label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.title).bold()
                    })
                    Text("\(productQuantity)")
                    Button(action: {
                        productQuantity += 1
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title).bold()
                    })
                }
            }
            Spacer()
            
            ProductDetailViewButton(onButtonPressed: {
                Task {
                    await confirmOrder()
                }
            })
        }
    }
    
    func confirmOrder() async {
        do{
            let result = try await service.confirmOrder(product: product)
            switch result {
            case .success(let message):
                print(message?.keys)
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        catch{
            print(error.localizedDescription)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: restaurantsMock[0].products[0])
    }
}

struct ProductDetailViewButton: View {
    var onButtonPressed: ()-> Void
    
    var body: some View {
        
        Button(action: {
            onButtonPressed()
        }, label: {
            HStack{
                Image(systemName: "cart").foregroundColor(.white)
                Text("Enviar pedido").foregroundColor(.white)
            }.padding(.horizontal, 32)
                .padding(.vertical, 16)
                .font(.title3).bold()
                .background(Color("ColorRed"))
                .cornerRadius(32)
                .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y: 8)
        })
    }
}
