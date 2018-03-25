//
//  Settings.swift
//  transtracker
//
//  Created by Alice Di Nunno on 25/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import RealmSwift

internal class Settings: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var value: String = ""
    override class func primaryKey() -> String? {
        return "name"
    }
}

extension DatabaseManager {
    public func writeToSettings(name: String, value: String) {
        let database = getRealm()
        if (database == nil) {
            return
        }
        database!.beginWrite()
        database!.create(Settings.self, value: ["name": name, "value": value], update: (self.readSettings(name: name) != nil));
        try? database!.commitWrite()
    }
    
    public func readSettings(name: String) -> String? {
        let database = getRealm()
        if (database == nil) {
            return nil
        }
        let result = database!.objects(Settings.self).filter("name == '\(name)'")
        if (result.count > 0) {
            let settingsResult: Settings? = result.first
            if (settingsResult != nil) {
                let result: Settings = settingsResult!
                return result.value
            }
            return nil
        }
        return nil
    }
    
    public func readSettings(name: String, defaultValue: String) -> String {
        let value = self.readSettings(name: name)
        if (value == nil) {
            return defaultValue
        }
        return value!
    }
}
