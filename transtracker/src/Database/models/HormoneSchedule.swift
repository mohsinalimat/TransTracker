//
//  HormoneSchedule.swift
//  transtracker
//
//  Created by Alice Di Nunno on 26/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import RealmSwift

class HormoneSchedule: Object {
    @objc dynamic var id = ""
    
    @objc dynamic var _scheduleType = -1
    @objc dynamic var _scheduleDaily = -1
    @objc dynamic var _scheduleWeekly = -1
    @objc dynamic var scheduleFrequency = -1
    @objc dynamic var timestamp: Date = Date()
    
    override public class func primaryKey() -> String? {
        return "id"
    }
}

extension DatabaseManager {
    func readHormoneSchedule(usingId: String) -> HormoneSchedule? {
        let database = getRealm()
        if (database == nil) {
            return (nil)
        }
        let result = database!.objects(HormoneSchedule.self)
        for r in result {
            if r.id == usingId {
                return r
            }
        }
        return nil
    }
    
    func readHormoneSchedule(usingRealm realm: Realm? = nil) -> [HormoneSchedule] {
        let database: Realm?
        if (realm == nil) {
            database = getRealm()
        } else {
            database = realm
        }
        let result = database!.objects(HormoneSchedule.self)
        return (Array(result))
    }
    
    func writeHormoneSchedule(obj: HormoneSchedule) {
        guard (obj.id != "") else {
            return
        }
        let database = getRealm()
        if (database == nil) {
            return
        }
        database!.beginWrite()
        database!.create(HormoneSchedule.self, value: obj, update: (self.readHormoneSchedule(usingId: obj.id) != nil))
        do {
            try database!.commitWrite()
        }
        catch {
            
        }
    }
    
    func removeHormoneSchedules(objs: [HormoneSchedule], realm: Realm? = nil) {
        for obj in objs {
            removeHormoneSchedule(obj: obj, realm: realm)
        }
    }
    
    func removeHormoneSchedule(obj: HormoneSchedule, realm: Realm? = nil) {
        removeRealmObject(object: obj, realm: realm)
    }
}
