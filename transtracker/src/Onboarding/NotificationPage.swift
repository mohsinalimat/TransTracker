//
//  NotificationPage.swift
//  transtracker
//
//  Created by Alice Di Nunno on 25/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications

class NotificationPage: OnboardingPage {    
    @IBAction func onboardingDone(_ sender: Any) {
        UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil))
        UIApplication.shared.registerForRemoteNotifications()

        //Will dismiss every Onboarding page recursively
        self.dismiss(animated: false, completion: nil)
        DatabaseManager().writeToSettings(name: "onboardingDone", value: String(bool: true))
        
        //As we need to register for 3D touch quick actions on the springboard we don't want to be registered before the end of the onboarding because otherwise we would be able to checkin before the initial start, so we're registering at the very end of the onboarding
        
        //TODO: implement
        //let shortcutItem = UIApplicationShortcutItem(type: "checkin", localizedTitle: NSLocalizedString("applicationShortcutCheckin", comment: ""))
        //UIApplication.shared.shortcutItems = [shortcutItem]
    }
}
