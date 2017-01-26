//
//  VisitorCount.swift
//  hw_1
//
//  Created by 余宜臻 on 2017/1/18.
//  Copyright © 2017年 余宜臻. All rights reserved.
//

import Foundation
import RealmSwift

//Object is a class used to define Realm model objects.
class VisitorCount : Object{
    dynamic var date: Date = Date()
    dynamic var count: Int = Int(0)
    
    //save it to database
    func save() {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(self)
            }
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
    


}

