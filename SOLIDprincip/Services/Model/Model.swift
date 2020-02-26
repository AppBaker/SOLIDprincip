//
//  Model.swift
//  SOLIDprincip
//
//  Created by Ivan Nikitin on 17.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import Foundation

struct Model: Decodable {
    var feed: Feed
}

struct Feed: Decodable {
    var results: [Results]
}

struct Results: Decodable {
    var id : String
    var artistName : String
    var name: String
}
