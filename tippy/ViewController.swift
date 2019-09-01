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
    @IBOutlet var settingGrad: [GradientView]!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBInspectable var keyName: String! = nil {
        didSet{
            
        }
    }
    
    var defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if(defaults.bool(forKey: String(format: "%@DefaultSet", self.keyName))){
            if(self.keyName == "main"){
                mainGrad.forEach{grad in grad.setColor(color1: self.getGradientColor1(), color2: self.getGradientColor2())
                }
            }
            else if(self.keyName == "setting"){
                settingGrad.forEach{grad in grad.setColor(color1: self.getGradientColor1(), color2: self.getGradientColor2())
                }
            }
        }
        else{
            if(self.keyName == "main"){
                defaults.set(225, forKey:  "maincolor1red")
                defaults.set(85, forKey:  "maincolor1green")
                defaults.set(159, forKey:  "maincolor1blue")
                defaults.set(22, forKey:  "maincolor2red")
                defaults.set(97, forKey:  "maincolor2green")
                defaults.set(185, forKey:  "maincolor2blue")
            }
            else if(self.keyName == "setting"){
                defaults.set(193, forKey: "settingcolor1red")
                defaults.set(231, forKey: "settingcolor1green")
                defaults.set(251, forKey: "settingcolor1blue")
                defaults.set(85, forKey: "settingcolor2red")
                defaults.set(161, forKey: "settingcolor2green")
                defaults.set(167, forKey: "settingcolor2blue")
            }
            defaults.set(true, forKey: String(format: "%@DefaultSet", self.keyName))
        }
        
        if(self.title == "firstMain"){
            if(defaults.object(forKey: "myIndex") != nil){
                tipControl.selectedSegmentIndex = defaults.integer(forKey: "myIndex")
            }
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
    
    internal func getGradientColor1() -> UIColor{
        return UIColor(red: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color1red"))/255), green: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color1green"))/255), blue: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color1blue"))/255), alpha: 1.0)
    }
    
    internal func getGradientColor2() -> UIColor{
        return UIColor(red: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color2red"))/255), green: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color2green"))/255), blue: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color2blue"))/255), alpha: 1.0)
    }
}

