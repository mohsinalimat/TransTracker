//
//  HormoneScheduleType.swift
//  transtracker
//
//  Created by Alice Di Nunno on 26/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation

enum HormoneScheduleType: Int
{
    case HST_Invalid = -1
    case HST_Daily = 1 //Once or multiple time a day
    case HST_Weekly = 2 //Once or multiple time a week
    case HST_Frequency = 3 //Every x Day
}
