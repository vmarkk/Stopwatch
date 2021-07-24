//
//  PlayerRealm.swift
//  Stopwatch
//
//  Created by Marco Vastolo on 24/07/21.
//

import Foundation
import RealmSwift

class PlayerRealm: Object {
    
    @objc dynamic var fullName: String = ""
    @objc dynamic var pictureUrl: String = ""
    @objc dynamic var totalLaps: Int32 = 0
    @objc dynamic var peakSpeed: Float = 0.0
    @objc dynamic var numOfSessions: Int32 = 0
    

    override class func primaryKey() -> String? {
        return "fullName"
    }
    
}

