//
//  Player.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 20/07/21.
//

import Foundation



struct Player: Codable {
    var name: Name
    var picture: Picture
    
    enum CodingKeys: CodingKey {
        case name
        case picture
    }
    
}



struct Name: Codable {
    
    var title: String
    var first: String
    var last: String
    
    enum CodingKeys: CodingKey {
        case title
        case first
        case last
    }
}



struct Picture: Codable {
    
    var large: String
    var medium: String
    var thumbnail: String
    
    
    enum CodingKeys: CodingKey {
        case large
        case medium
        case thumbnail
    }
}
