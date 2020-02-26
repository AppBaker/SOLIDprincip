//
//  LocalDataFetcher.swift
//  SOLIDprincip
//
//  Created by Ivan Nikitin on 19.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import Foundation

class LocalDataFetcher: NetworkDataFetcher {
    
    override func fetchGenericJSONData<T>(urlString: String, completion: @escaping (T?) -> Void) where T : Decodable {
         
        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            print("Couldn't finde \(urlString) in main bundle")
            completion(nil)
            return
        }
        
        let data = try? Data(contentsOf: file)
        
        let decoded = self.decodeJSON(type: T.self, from: data)
        
        completion(decoded)
    }
    
}
