//
//  PercentageView.swift
//  hw_1
//
//  Created by 余宜臻 on 2017/1/23.
//  Copyright © 2017年 余宜臻. All rights reserved.
//

import Foundation

class PercentageView: UIView {
    
    var status_bar:UIView = UIView()
    var middleX:CGFloat = 0.0
    
    
    //整條是灰色底的Bar
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = frame
        self.frame.origin.y += 4
       
        self.backgroundColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1.0)
        middleX = self.frame.width * 90/250
        
        let middle_line = UIView(frame: CGRect(x: middleX - 1.0, y: -1.0, width: 1, height: self.frame.height + 2.0))
        middle_line.backgroundColor = UIColor.black
        
        self.addSubview(middle_line)
    }
    
    //加上比例條
    func addValueBar(inputvalue: Float){
        var inputvalues:Float = 0.0
        inputvalues = inputvalue
        if(inputvalue > 160.0)
        {
            inputvalues = 160.0
        }
        else if(inputvalue < -90.0)
        {
            inputvalues = -90.0
        }
        
        
        let s_height = self.frame.height
        let s_y:CGFloat = 0
        
        if(inputvalue > 0) //紅色
        {
            let s_x = middleX
            let s_width = (self.frame.width * 160/250) * CGFloat((inputvalues/160))
            status_bar = UIView(frame: CGRect(x: s_x, y: s_y, width: s_width, height: s_height))
            status_bar.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1.0)
            
        }
        else{              //綠色
            var s_width = (self.frame.width * 90/250) * CGFloat((inputvalues/90))
            s_width = -s_width
            let s_x = middleX - s_width - 1
            status_bar = UIView(frame: CGRect(x: s_x, y: s_y, width: s_width, height: s_height))
            status_bar.backgroundColor = UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1.0)
            
        }
        
        self.addSubview(status_bar)
    }
    
    func refreshValue(inputvalue:Float)
    {
        let s_height = self.frame.height
        let s_y:CGFloat = 0
        
        if(inputvalue > 0) //紅色
        {
            let s_x = middleX
            let s_width = (self.frame.width * 1/2)*CGFloat((inputvalue/160))
            status_bar = UIView(frame: CGRect(x: s_x, y: s_y, width: 0, height: s_height))
            status_bar.backgroundColor = UIColor(red: 178/255, green: 34/255, blue: 34/255, alpha: 1.0)
            UIView.animate(withDuration: 0.6, animations: {
                self.status_bar.frame =  CGRect(x: s_x, y: s_y, width: s_width, height: s_height)
                
            })
        }
        else{              //綠色
            var s_width = (self.frame.width * 1/2)*CGFloat((inputvalue/90))
            s_width = -s_width
            let s_x = middleX - s_width - 1
            status_bar = UIView(frame: CGRect(x: s_x, y: s_y, width: 0, height: s_height))
            status_bar.backgroundColor = UIColor(red: 34/255, green: 139/255, blue: 34/255, alpha: 1.0)
            UIView.animate(withDuration: 0.6, animations: {
                self.status_bar.bounds.size = CGSize(width: s_height, height: s_width)
            })
            
        }
        self.addSubview(status_bar)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

