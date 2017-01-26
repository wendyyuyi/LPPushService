//
//  V3ViewController.swift
//  hw_1
//
//  Created by 余宜臻 on 2017/1/21.
//  Copyright © 2017年 余宜臻. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class V3ViewController: UIViewController {

    
    let months : [Double] = [1,3,5,7,12]
    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]

    
    @IBOutlet weak var linechartview: LineChartView!
  

    func setChart(dataPoints:[Double],values:[Double]){
        var dataEntries : [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count{
           
            let dataEntry = ChartDataEntry(x: months[i], y: values[i])
            dataEntries.append(dataEntry)
            
        }
        print("dataPoints number: \(dataPoints.count)")
        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "Units Sold")
        
        let lineChartData = LineChartData(dataSet: lineChartDataSet)
        linechartview.data = lineChartData
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setChart(dataPoints: months, values: unitsSold)
        linechartview.animate(xAxisDuration: 2.0, easingOption: .easeInCubic)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

}

