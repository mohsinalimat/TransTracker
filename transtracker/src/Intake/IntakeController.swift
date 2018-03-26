//
//  IntakeController.swift
//  transtracker
//
//  Created by Alice Di Nunno on 26/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import UIKit

class IntakeController: UIViewController {
    @IBOutlet weak var intakeStockSelector: UISegmentedControl!
    @IBOutlet weak var intakeTableView: UITableView!
    var currentPage: IntakeCurrentPage = .ICP_CurrentIntake
    var stockItems: [StockItem] = []
    
    override func viewDidLoad() {
        intakeTableView.delegate = self
        intakeTableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        stockItems = DatabaseManager().readStockItem()
    }
    
    @IBAction func IntakeStockSelectorChanged(_ sender: Any) {
        currentPage = IntakeCurrentPage(rawValue: intakeStockSelector.selectedSegmentIndex) ?? .ICP_CurrentIntake

    }
    
    @IBAction func AddItemToCurrentView(_ sender: Any) {
        if (currentPage == IntakeCurrentPage.ICP_CurrentIntake) {
            //Detail: add intake item
            self.performSegue(withIdentifier: "IntakeToDetail", sender: view)
        }
        else if (currentPage == IntakeCurrentPage.ICP_Stock) {
            //Detail: add stock item
            self.performSegue(withIdentifier: "StockToNewItem", sender: view)
        }
    }
}

extension IntakeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (currentPage == IntakeCurrentPage.ICP_CurrentIntake) {
            //Detail: view current intake item
            self.performSegue(withIdentifier: "IntakeToDetail", sender: view)
        }
        else if (currentPage == IntakeCurrentPage.ICP_Stock) {
            //Detail: view current stock item
            self.performSegue(withIdentifier: "IntakeToDetail", sender: view)
        }

    }
}

extension IntakeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (currentPage == .ICP_Stock) {
            return stockItems.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
