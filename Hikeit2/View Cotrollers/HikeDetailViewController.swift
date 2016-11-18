//
//  HikeDetailViewController.swift
//  Hikeit2
//
//  Created by Andrew Noble on 11/16/16.
//  Copyright © 2016 Andrew Noble. All rights reserved.
//

import UIKit

class HikeDetailViewController: UIViewController {
    

    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var HikeDifficultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderAction(_ sender: Any) {
    

        let easy = "Walk In The Park"
        let medium = "That Was a Nice Workout"
        let hard = "That was No Walk In The Park"
        switch slider.value {
        case 0...1.5:
            HikeDifficultLabel.text = easy
        case 1.6...2.5:
            HikeDifficultLabel.text = medium
        case 2.6...3:
            HikeDifficultLabel.text = hard
        default:
            return
        }
    }
       //HikeDifficultLabel.text = String(slider.value)
    //}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
