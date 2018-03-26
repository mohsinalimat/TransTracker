//
//  HormoneIntakeItem.swift
//  transtracker
//
//  Created by Alice Di Nunno on 26/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import RealmSwift

class HormoneIntakeItem: Object {
    @objc dynamic var id = ""
    @objc dynamic var fromStockItem: StockItem? = nil
    @objc dynamic var quantity: Int = 0
    
    override public class func primaryKey() -> String? {
        return "id"
    }
}

extension DatabaseManager {
    func readHormoneIntakeItem(usingId: String) -> HormoneIntakeItem? {
        let database = getRealm()
        if (database == nil) {
            return (nil)
        }
        let result = database!.objects(HormoneIntakeItem.self)
        for r in result {
            if r.id == usingId {
                return r
            }
        }
        return nil
    }
    
    func readHormoneIntakeItem(usingRealm realm: Realm? = nil) -> [HormoneIntakeItem] {
        let database: Realm?
        if (realm == nil) {
            database = getRealm()
        } else {
            database = realm
        }
        let result = database!.objects(HormoneIntakeItem.self)
        return (Array(result))
    }
    
    func writeHormoneIntakeItem(obj: HormoneIntakeItem) {
        guard (obj.id != "") else {
            return
        }
        let database = getRealm()
        if (database == nil) {
            return
        }
        database!.beginWrite()
        database!.create(HormoneIntakeItem.self, value: obj, update: (self.readHormoneIntakeItem(usingId: obj.id) != nil))
        do {
            try database!.commitWrite()
        }
        catch {
            
        }
    }
    
    func removeHormoneIntakeItems(objs: [HormoneIntakeItem], realm: Realm? = nil) {
        for obj in objs {
            removeHormoneIntakeItem(obj: obj, realm: realm)
        }
    }
    
    func removeHormoneIntakeItem(obj: HormoneIntakeItem, realm: Realm? = nil) {
        removeRealmObject(object: obj, realm: realm)
    }
}
