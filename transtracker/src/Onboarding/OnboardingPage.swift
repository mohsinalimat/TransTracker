//
//  OnboardingPage.swift
//  transtracker
//
//  Created by Alice Di Nunno on 25/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import UIKit

class OnboardingPage: UIViewController {
    var didDisappear = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        didDisappear = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (didDisappear) {
            self.dismiss(animated: false, completion: nil)
        }
    }
}
