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
            
            if let jsonObject = try? JSONSerialization.jsonObject(with: dat!, options: .allowFragments) as? [String:AnyObject] {
                
         
                for _ in jsonObject.keys {
                    if(jsonObject["results"] != nil){
                    
                        for valuee in jsonObject["results"] as! NSArray {
                            
                            let json = try? JSONSerialization.data(withJSONObject: valuee, options: .fragmentsAllowed)
                            
                            let player = try? JSONDecoder().decode(Player.self, from: json!)
                            
                            print(player)
                            
                        }
                        
                    }
                }
                
                let decoder = JSONDecoder()
              //  let event = try? decoder.decode(Player.self, from: jsonObject)
               // let jsonSecondo = []
                
           /*    for key in jsonObject.keys {
                    let jsonTerzo = jsonObject[key]
                    let json = try? JSONSerialization.data(withJSONObject: jsonTerzo!, options: .fragmentsAllowed)
                    let decoder = JSONDecoder()
                    let event = try? decoder.decode(Player.self, from: json!)
                    
                    print(event)
                    
                
                }*/
            }
            
            if let playersDecoded = try? JSONDecoder().decode([Player].self, from: dat!) {
            
                players = playersDecoded
            }
        }.resume()
        
 
    
        return players
        
    }
    
}

