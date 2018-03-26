//
//  StockItem.swift
//  transtracker
//
//  Created by Alice Di Nunno on 26/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import RealmSwift

class StockItem: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var dosage: Double = -1
    @objc dynamic var _dosageUnit = -1
    @objc dynamic var _applicationMethod = -1
    var gelPressionDosage: RealmOptional<Double> = RealmOptional<Double>(nil)
    var _gelPressionDosageUnit = RealmOptional<Int>(nil)
    var _hormoneType = RealmOptional<Int>(nil)
    @objc dynamic var laboratory: String? = nil
    @objc dynamic var manual: String? = nil
    
    override public class func primaryKey() -> String? {
        return "id"
    }
}

extension DatabaseManager {
    func readStockItem(usingId: String) -> StockItem? {
        let database = getRealm()
        if (database == nil) {
            return (nil)
        }
        let result = database!.objects(StockItem.self)
        for r in result {
            if r.id == usingId {
                return r
            }
        }
        return nil
    }
    
    func readStockItem(usingRealm realm: Realm? = nil) -> [StockItem] {
        let database: Realm?
        if (realm == nil) {
            database = getRealm()
        } else {
            database = realm
        }
        let result = database!.objects(StockItem.self)
        return (Array(result))
    }
    
    func writeStockItem(obj: StockItem) {
        guard (obj.id != "") else {
            return
        }
        let database = getRealm()
        if (database == nil) {
            return
        }
        database!.beginWrite()
        database!.create(StockItem.self, value: obj, update: (self.readStockItem(usingId: obj.id) != nil))
        do {
            try database!.commitWrite()
        }
        catch {
            
        }
    }
    
    func removeStockItems(objs: [StockItem], realm: Realm? = nil) {
        for obj in objs {
            removeStockItem(obj: obj, realm: realm)
        }
    }
    
    func removeStockItem(obj: StockItem, realm: Realm? = nil) {
        removeRealmObject(object: obj, realm: realm)
    }
}
