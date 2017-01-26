//
//  PagesViewController.swift
//  hw_1
//
//  Created by 余宜臻 on 2017/1/24.
//  Copyright © 2017年 余宜臻. All rights reserved.
//

import UIKit

class PagesViewController: UIViewController {

    @IBOutlet weak var PageContainer: UIView!
    var predictContainer: predict!
    var historyContainer: historyrecord!
    var stockContainer: stockhot!
    
    @IBOutlet weak var predict_tap: UIButton!
    @IBOutlet weak var history_tap: UIButton!
    @IBOutlet weak var stockhot_tap: UIButton!
    
    @IBOutlet weak var tabview: UIView!
    
    
    @IBAction func jumptopredict(_ sender: Any) {
        predict_tap.backgroundColor = UIColor.white
        history_tap.backgroundColor = UIColor.clear
        stockhot_tap.backgroundColor = UIColor.clear
        
        predict_tap.setTitleColor(UIColor.black, for: .normal)
        
        history_tap.setTitleColor(UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1.0), for: .normal)
        stockhot_tap.setTitleColor(UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1.0), for: .normal)


        
        predictContainer.isHidden = false
        historyContainer.isHidden = true
        stockContainer.isHidden = true
    }
    
    
    @IBAction func jumptohistory(_ sender: Any) {
        predict_tap.backgroundColor = UIColor.clear
        history_tap.backgroundColor = UIColor.white
        stockhot_tap.backgroundColor = UIColor.clear
        
        history_tap.setTitleColor(UIColor.black, for: .normal)
        
        predict_tap.setTitleColor(UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1.0), for: .normal)
        stockhot_tap.setTitleColor(UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1.0), for: .normal)
        
        predictContainer.isHidden = true
        historyContainer.isHidden = false
        stockContainer.isHidden = true

    }
    
    @IBAction func jumptostockhot(_ sender: Any) {
        predict_tap.backgroundColor = UIColor.clear
        history_tap.backgroundColor = UIColor.clear
        stockhot_tap.backgroundColor = UIColor.white
        
        stockhot_tap.setTitleColor(UIColor.black, for: .normal)
        
        history_tap.setTitleColor(UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1.0), for: .normal)
        predict_tap.setTitleColor(UIColor(red: 146/255, green: 146/255, blue: 146/255, alpha: 1.0), for: .normal)
        
        predictContainer.isHidden = true
        historyContainer.isHidden = true
        stockContainer.isHidden = false

    }
    //視圖加載時完成執行
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "xx股份"
        
        let predict: predict = Bundle.main.loadNibNamed("predict", owner: self, options: nil)![0] as! predict
        predictContainer = predict
        
        let history: historyrecord = Bundle.main.loadNibNamed("historyrecord", owner: self, options: nil)![0] as! historyrecord
        historyContainer = history
        
        let stock : stockhot = Bundle.main.loadNibNamed("stockhot", owner: self, options: nil)![0] as! stockhot
        stockContainer = stock
        
        predictContainer!.bounds = PageContainer.bounds
        predictContainer!.frame.origin.x = 0
        predictContainer!.frame.origin.y = 0
        
        historyContainer!.bounds = PageContainer.bounds
        historyContainer!.frame.origin.x = 0
        historyContainer!.frame.origin.y = 0
        
        stockContainer!.bounds = PageContainer.bounds
        stockContainer!.frame.origin.x = 0
        stockContainer!.frame.origin.y = 0
        
    
    }
   
    //視圖顯示完成前執行
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        PageContainer.addSubview(predictContainer)
        PageContainer.addSubview(historyContainer)
        PageContainer.addSubview(stockContainer)
        historyContainer.isHidden = true
        stockContainer.isHidden = true
        
    }
    
    //視圖顯示完成執行
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    //視圖消失前執行
    override func viewWillDisappear(_ animated: Bool) {
        predictContainer.removeFromSuperview()
        historyContainer.removeFromSuperview()
        stockContainer.removeFromSuperview()
        

    
    }
    
   
    
    
    
    


}
