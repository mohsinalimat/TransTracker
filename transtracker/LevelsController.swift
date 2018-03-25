//
//  LevelsController.swift
//  transtracker
//
//  Created by Alice Di Nunno on 25/03/2018.
//  Copyright © 2018 Alice Di Nunno. All rights reserved.
//

import Foundation
import UIKit
import Charts

class LevelsController: UIViewController {
    @IBOutlet weak var chart: LineChartView!

    var visitor: [Int] = [10, 20, 30, 40]
    
    func getVisitorCountsFromDatabase() -> Int
    {
        return visitor.count;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var dataEntries: [ChartDataEntry] = []
        var estradiolMin: [ChartDataEntry] = []
        var estradiolMax: [ChartDataEntry] = []
        let visitorCounts = getVisitorCountsFromDatabase()
        for i in 0..<visitorCounts {
            let estradiolMinEntry = ChartDataEntry(x: Double(i), y: 50)
            estradiolMin.append(estradiolMinEntry)
            
            let dataEntry = ChartDataEntry(x: Double(i), y: Double(visitor[i]))
            dataEntries.append(dataEntry)
            
            let estradiolMaxEntry = ChartDataEntry(x: Double(i), y: 398)
            estradiolMax.append(estradiolMaxEntry)
        }
        
        
        let estradiolMinLine = LineChartDataSet(values: estradiolMin, label: "")
        estradiolMinLine.colors = [UIColor(red:0.89, green:0.42, blue:0.42, alpha:1.0)]
        estradiolMinLine.drawCircleHoleEnabled = false
        estradiolMinLine.drawCirclesEnabled = false
        estradiolMinLine.drawValuesEnabled = false
        
        let estradiolLine = LineChartDataSet(values: dataEntries, label: "Estradiol")
        estradiolLine.colors = [UIColor(red:0.13, green:0.65, blue:0.94, alpha:1.0)]
        estradiolLine.drawCirclesEnabled = false
        estradiolLine.valueFont = UIFont.boldSystemFont(ofSize: 10.0)
        estradiolLine.lineWidth = 2
        
        let estradiolMaxLine = LineChartDataSet(values: estradiolMax, label: "")
        estradiolMaxLine.colors = [UIColor(red:0.89, green:0.42, blue:0.42, alpha:1.0)]
        estradiolMaxLine.drawCircleHoleEnabled = false
        estradiolMaxLine.drawCirclesEnabled = false
        estradiolMaxLine.drawValuesEnabled = false
        
        let chartData = LineChartData()
        chartData.addDataSet(estradiolMinLine)
        chartData.addDataSet(estradiolLine)
        chartData.addDataSet(estradiolMaxLine)
        
        chart.data = chartData
        chart.drawMarkers = false
        chart.drawBordersEnabled = false
        chart.drawGridBackgroundEnabled = false
        chart.rightAxis.enabled = false
        chart.chartDescription?.text = ""
        chart.legend.entries.removeFirst()
        chart.legend.entries.removeLast()
    }
}
