//
//  Hike.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

// Inserted by Andrew. 

// Use this file to encode information, so we can store it on the phone. 


class Hike: NSObject, NSCoding {
    var hikeName = ""
    var hikeDiscription = ""
    var date = Date()
    var image: UIImage?
    var category = 0
    var hikeDuration = Date()
    var hikeDistance = 00.00
    var currentLat = 00.00
    var currentLong = 00.00
    var image64 = ""
    
   
    
    
    
    let hikeNameKey = "hikeName"
    let hikeDiscriptionKey = "hikeDiscription"
    let dateKey = "date"
    let imageKey = "image"
    let categoryKey = "category"
    let hikeDurationKey = "duration"
    let hikeDistanceKey = "distance"
    let currentLatKey = "currentLat"
    let currentLongKey = "currentLong"
    let image64Key = "image64"
    
    var dateString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    override init() {
        super.init()
    }
    init(hikeName: String, hikeDiscription: String, date: Date, image: UIImage, category: Int, hikeDuration: Date, hikeDistance: Double, currentLat: Double, currentLong: Double, image64: String) {
        self.hikeName = hikeName
        self.hikeDiscription = hikeDiscription
        self.date = date
        self.image = image
        self.category = category
        self.hikeDuration = hikeDuration
        self.hikeDistance = hikeDistance
        self.currentLat = currentLat
        self.currentLong = currentLong
        self.image64 = image64
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.hikeName = aDecoder.decodeObject(forKey: hikeNameKey) as! String
        self.hikeDiscription = aDecoder.decodeObject(forKey: hikeDiscriptionKey) as! String
        self.date = aDecoder.decodeObject(forKey: dateKey) as! Date
        self.image = aDecoder.decodeObject(forKey: imageKey) as? UIImage
        self.category = aDecoder.decodeInteger(forKey: categoryKey)
        self.hikeDuration = aDecoder.decodeObject(forKey: hikeDurationKey) as! Date
        self.hikeDistance = aDecoder.decodeObject(forKey: hikeDistanceKey) as! Double
        self.currentLat = aDecoder.decodeDouble(forKey: currentLatKey)
        self.currentLong = aDecoder.decodeDouble(forKey: currentLongKey)
        self.image64 = aDecoder.decodeObject(forKey: image64Key) as! String
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(hikeName, forKey: hikeNameKey)
        aCoder.encode(hikeDiscription, forKey: hikeDiscriptionKey)
        aCoder.encode(date, forKey: dateKey)
        aCoder.encode(image, forKey: imageKey)
        aCoder.encode(category, forKey: categoryKey)
        aCoder.encode(hikeDuration, forKey: hikeDurationKey)
        aCoder.encode(hikeDistance, forKey: hikeDistanceKey)
        aCoder.encode(currentLat, forKey: currentLatKey)
        aCoder.encode(currentLong, forKey: currentLongKey)
        aCoder.encode(image64, forKey: image64Key)

    }

}
