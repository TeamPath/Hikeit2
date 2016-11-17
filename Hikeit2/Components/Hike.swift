//
//  Hike.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import Foundation
import UIKit

// Inserted by Andrew. 

// Use this file to encode information, so we can store it on the phone. 


class Hike: NSObject, NSCoding {
    
//    var title = ""
   
    
//    let titleKey = "title"
   
    
    
    override init() {
        super.init()
    }
    
    init(title: String, text: String, dueDate: String) {
//        self.title = title
        
    }
    required init?(coder aDecoder: NSCoder) {
//        self.title = aDecoder.decodeObject(forKey: titleKey) as! String
        
    }
    func encode(with aCoder: NSCoder) {
//        aCoder.encode(title, forKey:titleKey)
        
    }
    
}
