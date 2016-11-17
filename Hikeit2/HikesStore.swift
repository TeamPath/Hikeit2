//
//  HikesStore.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import Foundation
import UIKit

class HikeStore {
    
    static let shared = HikeStore()
    
    public var hikes: [[Hike]]!
    
    init() {
        let filePath = archiveFilePath()
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: filePath) {
            hikes = NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as!
                [[Hike]]
            
        } else {
            hikes = [[], [], [], []]
            hikes[0].append (Hike(title: "", text: "", dueDate: ""))
            
            save()
        }
        
    }
    
    
    func getHike (_ index: Int, categorySet: Int) -> Hike {
        return hikes[categorySet][index]
    }
    
    func addHike (_ hike: Hike, categorySet: Int) {
        hikes[categorySet].insert(hike, at: 0)
    }
    
    func updateHike(_ hike: Hike, index: Int, categorySet: Int) {
        hikes[categorySet][index] = hike
    }
    
    func deleteHike(_ index: Int, categorySet: Int){
        hikes[categorySet].remove(at: index)
    }
    
    func getCount(categorySet: Int) -> Int {
        return hikes[categorySet].count
    }
    
    func save () {
        NSKeyedArchiver.archiveRootObject(hikes, toFile: archiveFilePath())
    }
    
    fileprivate func archiveFilePath() -> String{
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDirectory = paths.first!
        let path = (documentDirectory as NSString).appendingPathComponent("NoteStore.plist")
        return path
    }
}
