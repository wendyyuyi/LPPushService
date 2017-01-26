//
//  Item1ViewController.swift
//  hw_1
//
//  Created by 余宜臻 on 2016/12/1.
//  Copyright © 2016年 余宜臻. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class Item1ViewControoler:UIViewController{
    @IBOutlet weak var PieChartView: PieChartView!
   
    @IBAction func afterbtn(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

    }
   
    override func viewDidLoad() {
        print("yes I load it!")
        
        let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"]
        let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0]
        
        setChart(dataPoints: months, values: unitsSold)
  
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [PieChartDataEntry] = []
        for i in 0..<dataPoints.count{
            let dataEntry = PieChartDataEntry(value: values[i] ,label: dataPoints[i] , data: self )
            dataEntries.append(dataEntry)
        
        }
        
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label: "Pie Chart")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        PieChartView.data = pieChartData
        
        var colors: [UIColor] = []
        
        for _ in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
    }

}
