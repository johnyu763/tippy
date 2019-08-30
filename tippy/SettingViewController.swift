//
//  SettingViewController.swift
//  tippy
//
//  Created by John Yu on 8/25/19.
//  Copyright © 2019 John Yu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    

    @IBOutlet var mainGrad: GradientView!
    @IBOutlet var SettingGrad1: GradientView!
    @IBOutlet var SettingGrad2: GradientView!
    
    @IBOutlet var mainColor1: [UISlider]!
    @IBOutlet var mainColor2: [UISlider]!
    let defaults = UserDefaults.standard
    
    @IBOutlet var tipPercentages: [UIButton]!
    override func viewDidLoad() {
        super.viewDidLoad()
//        if(mainGrad.gradientColor1 ){
//            mainGrad.gradientColor1 = UIColor.black
//        }
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
    }
    

    @IBAction func handleMainColor1(_ sender: UISlider) {
        mainColor1.forEach{slider in
            defaults.set(slider.value, forKey: String(format: "%@%@","maincolor1", slider.accessibilityLabel!))
        }
//        mainGrad.gradientColor1 = UIColor(red: CGFloat(1), green: CGFloat(1), blue: CGFloat(1), alpha: 1.0)
        
    }
    
    @IBAction func handleMainColor2(_ sender: UISlider) {
        mainColor2.forEach{slider in
            print(String(slider.accessibilityLabel ?? "None"))
        }
    }
    
    @IBAction func handleSettingColor1(_ sender: UISlider) {
    }
    
    @IBAction func handleSettingColor2(_ sender: UISlider) {
    }
}
