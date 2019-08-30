//
//  ViewController.swift
//  tippy
//
//  Created by John Yu on 8/20/19.
//  Copyright © 2019 John Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainGrad: [GradientView]!
    @IBOutlet var mainColor1: [UISlider]!
    @IBOutlet var mainColor2: [UISlider]!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet var gradView: GradientView!
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        
        if(UserDefaults.standard.object(forKey: "myIndex") != nil){
            tipControl.selectedSegmentIndex = defaults.integer(forKey: "myIndex")
        }
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calcTip(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        
        let tipPercent = [0.15, 0.18, 0.2]
        let tip = bill * tipPercent[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func handleMainColor1(_ sender: UISlider) {
        mainColor1.forEach{slider in
            defaults.set(slider.value, forKey: String(format: "%@%@","maincolor1", slider.accessibilityLabel!))
        }
        let color = UIColor(red: CGFloat(defaults.float(forKey: "maincolor1red")/255), green: CGFloat(defaults.float(forKey: "maincolor1green")/255), blue: CGFloat(defaults.float(forKey: "maincolor1blue")/255), alpha: 1.0)
//        mainGrad.forEach{grad in
//            grad.setColor(color1: color, color2: nil)
//        }
    }
    
    @IBAction func handleMainColor2(_ sender: UISlider) {
        mainColor2.forEach{slider in
            print(String(slider.accessibilityLabel ?? "None"))
        }
    }
}

