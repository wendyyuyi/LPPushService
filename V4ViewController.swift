//
//  V4ViewController.swift
//  hw_1
//
//  Created by 余宜臻 on 2017/1/24.
//  Copyright © 2017年 余宜臻. All rights reserved.
//

import UIKit

class V4ViewController: UIViewController {
    var w_firstbar:PercentageView = PercentageView()
    var w_secondbar:PercentageView = PercentageView()
   

    @IBOutlet weak var warehouseView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bar_width = 100
        
        self.w_firstbar = PercentageView(frame: CGRect(x: 30, y: 0, width: bar_width , height:50 ))
        self.w_firstbar.addValueBar(inputvalue: 30)
        self.warehouseView.addSubview(self.w_firstbar)
        
        self.w_secondbar = PercentageView(frame: CGRect(x: 30, y: 100 , width: bar_width , height: 50 ))
        self.w_secondbar.addValueBar(inputvalue: -60)
        self.warehouseView.addSubview(self.w_secondbar)
        
       


        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
