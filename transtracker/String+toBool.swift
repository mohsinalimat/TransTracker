//
//  String+toBool.swift
//  transtracker
//
//  Created by Alice Di Nunno on 25/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation


extension String {
    func bool() -> Bool {
        switch self {
        case "True", "true", "yes", "1":
            return true
        default:
            return false
        }
    }
    
    init(bool: Bool) {
        self = "\(bool)"
    }
}
