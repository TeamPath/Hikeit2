//
//  MainViewController.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Artboard 1.png")
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view.
    }
  
    
 
}
