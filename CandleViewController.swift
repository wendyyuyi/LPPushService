//
//  CandleViewController.swift
//  hw_1
//
//  Created by 余宜臻 on 2017/1/24.
//  Copyright © 2017年 余宜臻. All rights reserved.
//

import UIKit
import Charts
import RealmSwift

class CandleViewController: UIViewController {

    @IBOutlet weak var candlestickView: CandleStickChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is Candle View!")

        let values = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0,21.0,22.0,23.0,24.0,25.0,26.0,27.0,28.0,29.0,30.0,31.0,32.0,33.0,34.0,35.0,36.0,37.0,38.0,39.0,40.0,41.0,42.0,43.0,44.0,45.0,46.0,47.0,48.0,49.0,50.0]
        let shadowH = [20.0, 20.0, 20.0, 30.0, 40.0, 50.0,20.0, 20.0, 20.0, 30.0, 40.0, 50.0,20.0, 20.0, 20.0, 30.0, 40.0, 50.0,20.0, 20.0, 20.0, 30.0, 40.0, 50.0,20.0, 20.0, 20.0, 30.0, 40.0, 50.0,20.0, 20.0, 20.0, 30.0, 40.0, 50.0,20.0, 20.0, 20.0, 30.0, 40.0, 50.0,20.0, 20.0, 20.0, 30.0, 40.0, 50.0,50.0,50.0]
        let shadowL = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0,0.0]
        let close = [1.0, 3.0, 5.0, 6.0, 7.0, 8.0,1.0, 3.0, 5.0, 6.0, 7.0, 8.0,1.0, 3.0, 5.0, 6.0, 7.0, 8.0,1.0, 3.0, 5.0, 6.0, 7.0, 8.0,1.0, 3.0, 5.0, 6.0, 7.0, 8.0,1.0, 3.0, 5.0, 6.0, 7.0, 8.0,1.0, 3.0, 5.0, 6.0, 7.0, 8.0,1.0, 3.0, 5.0, 6.0, 7.0, 8.0,9.0,10.0]
        let open = [6.0, 6.0, 6.0, 18.0, 10.0, 12.0,14.0,33.0,17.0,20.0,6.0, 6.0, 6.0, 18.0, 10.0, 12.0,14.0,33.0,17.0,20.0,6.0, 6.0, 6.0, 18.0, 10.0, 12.0,14.0,33.0,17.0,20.0,6.0, 6.0, 6.0, 18.0, 10.0, 12.0,14.0,33.0,17.0,20.0,6.0, 6.0, 6.0, 18.0, 10.0, 12.0,14.0,33.0,17.0,20.0]
        setChart(x: values,shadowH: shadowH,shadowL: shadowL,open: open,close: close)

    }
    func setChart(x:[Double],shadowH:[Double],shadowL:[Double],open:[Double],close:[Double]) {
        
        var dataEntries: [CandleChartDataEntry] = []
       
        for i in 0..<x.count{
           
            let dataEntry = CandleChartDataEntry(x: x[i],shadowH: shadowH[i],shadowL: shadowL[i], open: open[i] ,close:close[i])
            dataEntries.append(dataEntry)
            
        }
        
        let candleDataSet = CandleChartDataSet(values:dataEntries, label: "CandleChart")
        
        let candleChartData = CandleChartData(dataSet: candleDataSet)
        candlestickView.data = candleChartData
        candleDataSet.colors = [UIColor.green,UIColor.red]
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func return_btn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
  
    
}
