//
//  Network.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 20/07/21.
//

import Foundation
import UIKit


class Network: NSObject {
    
    static func fetchPlayers() -> [Player] {
        var players = [Player]()
        
        let urlString = "https://randomuser.me/api/?seed=empatica&inc=name,picture&gender=male&results=10&noinfo"
        
        let url = URL(string: urlString)
      
        guard url != nil else {
            return []
        }
     
        
        URLSession.shared.dataTask(with: url!) { dat, res, err in
            
            if err != nil {
                print(err!)
                return
            }
            

            guard dat != nil else {return}
            
            if let playersDecoded = try? JSONDecoder().decode([Player].self, from: dat!) {
            
                players = playersDecoded
            }
        }.resume()
        
 
    
        return players
        
    }
    
}

