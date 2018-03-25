//
//  SelectHormonePage.swift
//  transtracker
//
//  Created by Alice Di Nunno on 25/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import UIKit

class SelectHormonePage: OnboardingPage {
    @IBOutlet weak var selectHormoneTable: UITableView!
    
    override func viewDidLoad() {
        selectHormoneTable.isScrollEnabled = false
        selectHormoneTable.delegate = self
        selectHormoneTable.dataSource = self
    }
}

extension SelectHormonePage: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentHormoneType = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
        DatabaseManager().writeToSettings(name: "hormoneType", value: "\(currentHormoneType)")
    }
}

extension SelectHormonePage: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = selectHormoneTable.dequeueReusableCell(withIdentifier: "hormoneCell") as! OnboardingHormoneCell
        if indexPath.row == HormoneType.HT_Estradiol.rawValue {
            cell.hormoneName?.text = "Estradiol"
        }
        else {
            cell.hormoneName?.text = "Testosterone"
        }
        return cell
    }
    
    
}
