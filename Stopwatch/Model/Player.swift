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

}



struct Name: Codable {
    
    var title: String
    var first: String
    var last: String
}



struct Picture: Codable {
    
    var large: String
    var medium: String
    var thumbnail: String
}
