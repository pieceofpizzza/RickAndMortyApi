//
//  Model.swift
//  tryRickandmortyAgain
//
//  Created by Дарина Лисанова on 19.06.2023.
//

import Foundation


struct Post: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

struct Origin: Decodable {
    let name: String
    let url: String
}

struct Location: Decodable {
    let name: String
    let url: String
}

struct EarthPost: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}


