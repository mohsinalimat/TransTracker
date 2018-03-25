//
//  DatabaseManager.swift
//  transtracker
//
//  Created by Alice Di Nunno on 25/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import RealmSwift

public class DatabaseManager {
    public init() {
        let config = Realm.Configuration(
            // Set the new schema version. This must be greater than the previously used
            // version (if you've never set a schema version before, the version is 0).
            schemaVersion: 1,
            // Set the block which will be called automatically when opening a Realm with
            // a schema version lower than the one set above
            migrationBlock: { migration, oldSchemaVersion in
       
        })
        Realm.Configuration.defaultConfiguration = config
    }
    
    public func getRealm() -> Realm? {
        var database: Realm?
        if (try? database = Realm()) == nil {
            print("failed to initialize realm")
            print("It may happen if you modified the DB Schema")
            print("Don't forget to run a database upgrade")
            database = nil
        }
        return (database)
    }
}
