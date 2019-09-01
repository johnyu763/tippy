//
//  SettingViewController.swift
//  tippy
//
//  Created by John Yu on 8/25/19.
//  Copyright © 2019 John Yu. All rights reserved.
//

import UIKit

class SettingViewController: ViewController {
        
    @IBOutlet var tipPercentages: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func handleSelection(_ sender: UIButton) {
        tipPercentages.forEach{button in
            button.isHidden = !button.isHidden
        }
    }
    
    enum Percents: String {
        case fifteen = "15%"
        case eighteen = "18%"
        case twenty = "20%"
    }
    
    @IBAction func percentTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let percent = Percents(rawValue: title) else
        {
            return
        }
        
        switch percent{
        case .fifteen:
            defaults.set(0, forKey: "myIndex")
        case .eighteen:
            defaults.set(1, forKey: "myIndex")
        case .twenty:
            defaults.set(2, forKey: "myIndex")
        }
        tipPercentages.forEach{button in
            button.isHidden = !button.isHidden
        }
    }
    

    @IBAction func closeDropDown(_ sender: Any) {
        tipPercentages.forEach{button in
            if(!button.isHidden){
                button.isHidden = !button.isHidden
            }
        }
    }
}
