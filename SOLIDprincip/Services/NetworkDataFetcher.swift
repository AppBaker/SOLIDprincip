//
//  NetworkDataFetcher.swift
//  SOLIDprincip
//
//  Created by Ivan Nikitin on 17.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import Foundation


protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    var networking : Networking
    
    init(networking: Networking = NetworkService()) {
        self.networking = networking
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?) -> Void){
        print(T.self)
        networking.request(urlString: urlString) { (data, error) in
            
            if let error = error {
                print("Error received requesting data: \(error.localizedDescription)")
                completion(nil)
            } else {
                let decoded = self.decodeJSON(type: T.self, from: data)
                completion(decoded)
            }
        }
    }
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON: ", jsonError)
            return nil
        }
    }
 
}
