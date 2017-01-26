//
//  ViewController.swift
//  hw_1
//
//  Created by 余宜臻 on 2016/12/1.
//  Copyright © 2016年 余宜臻. All rights reserved.
//

import UIKit
import Charts
import RealmSwift



class ViewController: UIViewController {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    @IBOutlet weak var tfValue: UITextField!
    
    @IBOutlet weak var barView: BarChartView!
    
    var flag=true
    
    weak var axisFormatDelegate: IAxisValueFormatter?
    var dataEntries: [BarChartDataEntry] = []

    @IBAction func btnAddTapped(_ sender: Any) {
        
        if let value = tfValue.text , value != "" {
            let visitorCount = VisitorCount()
            //NumberFormatter().number(from: value)是型態轉型 轉乘int value
            visitorCount.count = (NumberFormatter().number(from: value)?.intValue)!
            visitorCount.save()
            tfValue.text = ""
        }
        updateChartWithData()
    }

    
    @IBAction func afterclick(_ sender: Any) {
       
        cleanVisitorCountsFromDatabase()
        while(dataEntries.count > 0){
            dataEntries.remove(at: 0)
        }
        print("did the entries clean? \(dataEntries.count)")
    }
    //update the data that is seen on chart.
    func updateChartWithData() {
        let visitorCounts = getVisitorCountsFromDatabase()
        for i in 0..<visitorCounts.count {
            
            let dataEntry = BarChartDataEntry(x: Double(i), y: Double(visitorCounts[i].count))
            dataEntries.append(dataEntry)
        }
        print("dataEntry: \(dataEntries.count)")
        print("visitor number: \(visitorCounts.count)")

        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Visitor count")
        let chartData = BarChartData(dataSet: chartDataSet)
     
        barView.data = chartData
        chartDataSet.colors = ChartColorTemplates.colorful()
        
        let xaxis = barView.xAxis
        xaxis.valueFormatter = axisFormatDelegate
        
    }
      // fetches the database records
    func getVisitorCountsFromDatabase() -> Results<VisitorCount> {
        do {
            let realm = try Realm()
            return realm.objects(VisitorCount.self)
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    //Add ability to remove data
    func cleanVisitorCountsFromDatabase() {
        do{
            let realm = try Realm()
            try realm.write{
                realm.deleteAll()
            }
        }catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
  
       
    override func viewDidLoad() {
        super.viewDidLoad()
       
        axisFormatDelegate = self
        updateChartWithData()
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    
    
    }


}
extension ViewController: IAxisValueFormatter {
    // convert from double to string
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "MMMMM dd"
        //NSDate取得當前時間，保存到數據庫，然後取出來用
        return dateFormatter.string(from: Date(timeIntervalSince1970: value))
    }
}

