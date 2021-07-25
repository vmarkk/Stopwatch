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
        
        let playerToUpdate = realm.objects(PlayerRealm.self).filter("fullName == '\(player.fullName)'").first
        
        
        try? realm.write {
            if playerToUpdate != nil {
                playerToUpdate?.fullName = player.fullName
                playerToUpdate?.totalLaps += player.totalLaps
                playerToUpdate?.numOfSessions += 1
            } else {
                realm.add(player)
            }
           
        }
        
        
    }
}
