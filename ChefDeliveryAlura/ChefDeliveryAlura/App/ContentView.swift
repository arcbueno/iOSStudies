//
//  ContentView.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 02/09/24.
//

import SwiftUI

struct ContentView: View {
    private var service = StoreService()
    @State private var storeList: [StoreType] = []
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            VStack {
                if(isLoading) {
                    ProgressView()
                }else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                    ScrollView(.vertical, showsIndicators: false){
                        VStack (spacing: 20){
                            OrderTypeGridView()
                            CarrouselTabView()
                            StoresContainerView(stores: storeList)
                        }
                    }
                }
            }
            .padding()
        }.onAppear{
            getStoresV2()
        }
    }
    
    func getStoresV2() {
        service.fetchDataV2(){ stores, error in
            if let stores = stores {
                self.storeList = stores
                self.isLoading = false
            }
            
            if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }
    
    
    func getStores() async{
        do{
            let result = try await service.fetchData()
            
            switch result {
            case .success(let stores):
                self.storeList = stores
                self.isLoading = false
                break
            case .failure(let error):
                print(error.localizedDescription)
                self.isLoading = false
            }
        }catch{
            self.isLoading = false
            print(error.localizedDescription)
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
