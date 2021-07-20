//
//  Network.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 20/07/21.
//

import Foundation
import UIKit


class Network: NSObject {
    
    static func fetchPlayers(completion: @escaping (Player) -> Void) {
       
        let urlString = "https://randomuser.me/api/?seed=empatica&inc=name,picture&gender=male&results=10&noinfo"
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            return
        }
        
        
        URLSession.shared.dataTask(with: url!) { dat, res, err in
            
            if err != nil {
                print(err!)
                return
            }
            
            guard dat != nil else {return}
            
            if let jsonObject = try? JSONSerialization.jsonObject(with: dat!, options: .allowFragments) as? [String:AnyObject] {
                
                
                if jsonObject["results"] != nil {
        
                    for value in jsonObject["results"] as! NSArray {
                        
                        let json = try? JSONSerialization.data(withJSONObject: value, options: .fragmentsAllowed)
                        
                        let player = try? JSONDecoder().decode(Player.self, from: json!)
                        
                        DispatchQueue.main.async {
                            completion(player!)
                        }
                        
                    }
                }
            }
            
        }.resume()
    }
    
    
    
}

