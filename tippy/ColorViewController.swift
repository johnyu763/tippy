//
//  ColorViewController.swift
//  tippy
//
//  Created by John Yu on 8/31/19.
//  Copyright © 2019 John Yu. All rights reserved.
//

import UIKit

class ColorViewController : UIViewController {
    
    @IBOutlet var mainGrad: [GradientView]!
    @IBOutlet var mainColor1: [UISlider]!
    @IBOutlet var mainColor2: [UISlider]!
    
    @IBOutlet var settingGrad: [GradientView]!
    @IBOutlet var settingColor1: [UISlider]!
    @IBOutlet var settingColor2: [UISlider]!
    
    var defaults = UserDefaults.standard
    
    @IBInspectable var keyName: String! = nil {
        didSet{
            
        }
    }
    
    @IBInspectable var isSub: Bool = false {
        didSet{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(defaults.bool(forKey: String(format: "%@DefaultSet", self.keyName))){
            if(self.keyName == "main"){
                mainGrad.forEach{grad in grad.setColor(color1: self.getGradientColor1(), color2: self.getGradientColor2())
                }
                if(!self.isSub){
                    mainColor1.forEach{color in
                        color.value = defaults.float(forKey: String(format: "%@%@%@", self.keyName, "color1", color.accessibilityLabel ?? "red"))
                    }
                    mainColor2.forEach{color in
                        color.value = defaults.float(forKey: String(format: "%@%@%@", self.keyName, "color2", color.accessibilityLabel ?? "red"))
                    }
                }
            }
            else if(self.keyName == "setting"){
                settingGrad.forEach{grad in grad.setColor(color1: self.getGradientColor1(), color2: self.getGradientColor2())
                }
                if(!self.isSub){
                    settingColor1.forEach{color in
                        color.value = defaults.float(forKey: String(format: "%@%@%@", self.keyName, "color1", color.accessibilityLabel ?? "red"))
                    }
                    settingColor2.forEach{color in
                        color.value = defaults.float(forKey: String(format: "%@%@%@", self.keyName, "color2", color.accessibilityLabel ?? "red"))
                    }
                }
            }
        }
        else{
            if(self.keyName == "main"){
                defaults.set(225, forKey:  "maincolor1red")
                defaults.set(85, forKey:  "maincolor1green")
                defaults.set(159, forKey:  "maincolor1blue")
            }
            else if(self.keyName == "setting"){
                defaults.set(22, forKey: "settingcolor1red")
                defaults.set(97, forKey: "settingcolor1green")
                defaults.set(185, forKey: "settingcolor1blue")
            }
            defaults.set(true, forKey: String(format: "%@DefaultSet", self.keyName))
        }
    }
        
    public func getGradientColor1() -> UIColor{
        return UIColor(red: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color1red"))/255), green: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color1green"))/255), blue: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color1blue"))/255), alpha: 1.0)
    }
    
    public func getGradientColor2() -> UIColor{
         return UIColor(red: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color2red"))/255), green: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color2green"))/255), blue: CGFloat(defaults.float(forKey: String(format: "%@%@", self.keyName, "color2blue"))/255), alpha: 1.0)
    }
    
    @IBAction func handleMainColor1(_ sender: UISlider) {
        mainColor1.forEach{slider in
            defaults.set(slider.value, forKey: String(format: "%@%@","maincolor1", slider.accessibilityLabel!))
        }
        let color = UIColor(red: CGFloat(defaults.float(forKey: "maincolor1red")/255), green: CGFloat(defaults.float(forKey: "maincolor1green")/255), blue: CGFloat(defaults.float(forKey: "maincolor1blue")/255), alpha: 1.0)
        mainGrad.forEach{grad in
            grad.setColor(color1: color, color2: nil)
        }
    }
    
    @IBAction func handleMainColor2(_ sender: UISlider) {
        mainColor2.forEach{slider in
            defaults.set(slider.value, forKey: String(format: "%@%@","maincolor2", slider.accessibilityLabel!))
        }
        let color = UIColor(red: CGFloat(defaults.float(forKey: "maincolor2red")/255), green: CGFloat(defaults.float(forKey: "maincolor2green")/255), blue: CGFloat(defaults.float(forKey: "maincolor2blue")/255), alpha: 1.0)
        mainGrad.forEach{grad in
            grad.setColor(color1: nil, color2: color)
            print(grad.accessibilityLabel)
        }
    }
    
    @IBAction func handleSettingColor1(_ sender: UISlider) {
        settingColor1.forEach{slider in
            defaults.set(slider.value, forKey: String(format: "%@%@","settingcolor1", slider.accessibilityLabel!))
        }
        let color = UIColor(red: CGFloat(defaults.float(forKey: "settingcolor1red")/255), green: CGFloat(defaults.float(forKey: "settingcolor1green")/255), blue: CGFloat(defaults.float(forKey: "settingcolor1blue")/255), alpha: 1.0)
        settingGrad.forEach{grad in
            grad.setColor(color1: color, color2: nil)
            print(grad.accessibilityLabel)
        }
    }
    
    @IBAction func handleSettingColor2(_ sender: UISlider) {
        settingColor2.forEach{slider in
            defaults.set(slider.value, forKey: String(format: "%@%@","settingcolor2", slider.accessibilityLabel!))
        }
        let color = UIColor(red: CGFloat(defaults.float(forKey: "settingcolor2red")/255), green: CGFloat(defaults.float(forKey: "settingcolor2green")/255), blue: CGFloat(defaults.float(forKey: "settingcolor2blue")/255), alpha: 1.0)
        settingGrad.forEach{grad in
            grad.setColor(color1: nil, color2: color)
            print(grad.accessibilityLabel)
        }
    }
}

