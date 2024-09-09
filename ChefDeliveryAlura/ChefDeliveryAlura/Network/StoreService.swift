//
//  StoreService.swift
//  ChefDeliveryAlura
//
//  Created by pedro.bueno on 08/09/24.
//

import Foundation
import Alamofire

enum RequestError: Error {
    case invalidURL
    case errorRequest(error: String)
    
}

struct StoreService {
    let baseUrl = "https://private-5d0f558-stores19.apiary-mock.com/api/"
    func fetchData() async throws -> Result<[StoreType], RequestError> {
       guard let url = URL(string: "\(baseUrl)stores")
        else{
           return .failure(RequestError.invalidURL)
       } 
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
        
        
        
        return .success(storesObjects)
        
    }
    
    func confirmOrder(product: ProductType) async throws -> Result<[String: Any]?, RequestError> {
        guard let url = URL(string: "\(baseUrl)stores") else {
            return .failure(.invalidURL)
        }
        
        let encodedObject = try JSONEncoder().encode(product)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = encodedObject
        
        let (data, _) = try await URLSession.shared.data(for: request)
        let message = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        return .success(message)
    }
    
    func fetchDataV2(completion: @escaping (([StoreType]?, Error?) -> Void) ){
        AF.request("\(baseUrl)stores").responseDecodable(of: [StoreType].self){ response in
            switch response.result {
            case .success(let stores):
                completion(stores, nil)
            default: break
            }
        }
        
    }
}
