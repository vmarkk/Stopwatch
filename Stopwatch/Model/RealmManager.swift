//
//  Realm.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 24/07/21.
//

import Foundation
import RealmSwift

class RealmManager: NSObject {
    
 
    
    public func updateRealmPlayer(player: PlayerRealm) {
        
        let realm = try! Realm()
        
        let obj = realm.objects(PlayerRealm.self)
        
        let playerToUpdate = realm.objects(PlayerRealm.self).filter("fullName == '\(player.fullName)'").first
        
        
        try? realm.write {
         
            if playerToUpdate != nil {
                
                // JUST UPDATE PLAYER LAST SESSION IN CASE THERE'S ALREADY A SAVED SESSION
                playerToUpdate!.totalLaps += player.totalLaps
                playerToUpdate!.numOfSessions += 1
                
            } else {
                
                // ADD NEW PLAYER SESSION TO REALM
                realm.add(player)
            }
           
        }
        
        
    }
}
