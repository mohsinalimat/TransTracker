//
//  TabBarController.swift
//  transtracker
//
//  Created by Alice Di Nunno on 25/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    func with(color: UIColor) -> UIImage {
        guard let cgImage = self.cgImage else {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        let imageRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context.clip(to: imageRect, mask: cgImage)
        color.setFill()
        context.fill(imageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return newImage
    }
}

class TabBarController: UITabBarController {
    let unselectedColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)
    let selectedColor = UIColor(red:0.36, green:0.59, blue:0.75, alpha:1.0)
    var onboardingShown = false

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Unselected state colors
        for item in self.tabBar.items! {
            item.image = item.selectedImage!.with(color: unselectedColor).withRenderingMode(.alwaysOriginal)
        }
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : unselectedColor], for: .normal)
        
        // Selected state colors
        tabBar.tintColor = selectedColor
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor : selectedColor], for: .selected)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.popViewController(animated: true)
        super.viewDidAppear(animated)
        onboardingShown = DatabaseManager().readSettings(name: "onboardingDone")?.bool() ?? false
        guard onboardingShown else {
            performSegue(withIdentifier: "onboarding", sender: nil)
            onboardingShown = true
            return
        }
    }
}
