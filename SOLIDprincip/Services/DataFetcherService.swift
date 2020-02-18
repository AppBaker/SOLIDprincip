//
//  DataFetcherService.swift
//  SOLIDprincip
//
//  Created by Ivan Nikitin on 18.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import Foundation

class DataFetcherService {
    
    var datataFetcher: DataFetcher
    
    init(datataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.datataFetcher = datataFetcher
    }
    
    func fetchGames(completion: @escaping (Model?) -> Void) {
        let urlString = "https://rss.itunes.apple.com/api/v1/ru/books/top-free/all/10/non-explicit.json"
        datataFetcher.fetchGenericJSONData(urlString: urlString, completion: completion)
    }
}

