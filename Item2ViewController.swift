//
//  Item2ViewController.swift
//  hw_1
//
//  Created by 余宜臻 on 2016/12/1.
//  Copyright © 2016年 余宜臻. All rights reserved.
//

import UIKit

class Item2ViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var array:[String] = [String]()
    var flag=0
    @IBAction func afterbtnA(_ sender: Any) {
        flag=1
        
        for i in 1..<100{
            array.append("\(i)")
        }
        tableView.reloadData()
        array.removeAll()
        
        print("array's number \(array.count)")
        
    }
    
    @IBAction func afterbtn2(_ sender: Any) {
        flag=2
       
        for i in 100..<150{
            array.append("\(i)")
        }
        tableView.reloadData()
        print("array's number \(array[0])")
        array.removeAll()
       // print("array's number \(array[0])")
        
        
        
        
    }
    override func viewDidLoad() {
        print("number2!")
        tableView.delegate=self
        tableView.dataSource=self
       
        

    }
    //delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //tableView.reloadData()
        print()
        let index=indexPath.row
        
        print("\(index)")
    }
    //dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var index = indexPath.row
        //print("row\(index+100)")
        let identifer:String = "democell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifer, for: indexPath) as! tableviewCell
        if flag==2{
            index=index+100
        }
        cell.title.text = "row\(index)"
    
        
               return cell
    }

    
    


}
