//
//  DataFetcherService.swift
//  SOLIDprincip
//
//  Created by Ivan Nikitin on 18.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import Foundation


class DataFetcherService {
    
    
    var networkDatataFetcher: DataFetcher
    var localDataFetcher: DataFetcher
    
    init(networkDatataFetcher: DataFetcher = NetworkDataFetcher(), localDataFetcher: DataFetcher = LocalDataFetcher()) {
        self.networkDatataFetcher = networkDatataFetcher
        self.localDataFetcher = localDataFetcher
    }
    
    func fetchGames(completion: @escaping (Model?) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/ru/books/top-free/all/10/non-explicit.json"
        networkDatataFetcher.fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSolid(completion: @escaping (Sumple?) -> Void) {
        networkDatataFetcher.fetchGenericJSONData(urlString: "", completion: completion)
    }
    
    func fetchLocalData (completion: @escaping (Model?) -> Void) {
        let urlString = "non-explicit.json"
        localDataFetcher.fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
}

struct Sumple: Decodable {
    var name: String
}

