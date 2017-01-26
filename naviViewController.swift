//
//  naviViewController.swift
//  hw_1
//
//  Created by 余宜臻 on 2017/1/24.
//  Copyright © 2017年 余宜臻. All rights reserved.
//

import UIKit

class naviViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotopages(_ sender: Any) {
        let vc = PagesViewController(nibName:"PagesViewController",bundle:nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }

   }
