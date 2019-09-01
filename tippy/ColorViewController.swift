//
//  ColorViewController.swift
//  tippy
//
//  Created by John Yu on 8/31/19.
//  Copyright © 2019 John Yu. All rights reserved.
//

import UIKit

class ColorViewController : SettingViewController {
    
    
    @IBOutlet var mainColor1: [UISlider]!
    @IBOutlet var mainColor2: [UISlider]!
    
    
    @IBOutlet var settingColor1: [UISlider]!
    @IBOutlet var settingColor2: [UISlider]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(defaults.bool(forKey: String(format: "%@DefaultSet", self.keyName))){
            if(self.keyName == "main"){
                mainColor1.forEach{color in
                    color.value = defaults.float(forKey: String(format: "%@%@%@", self.keyName, "color1", color.accessibilityLabel ?? "red"))
                }
                mainColor2.forEach{color in
                    color.value = defaults.float(forKey: String(format: "%@%@%@", self.keyName, "color2", color.accessibilityLabel ?? "red"))
                }
            }
            else if(self.keyName == "setting"){
                settingColor1.forEach{color in
                    color.value = defaults.float(forKey: String(format: "%@%@%@", self.keyName, "color1", color.accessibilityLabel ?? "red"))
                }
                settingColor2.forEach{color in
                    color.value = defaults.float(forKey: String(format: "%@%@%@", self.keyName, "color2", color.accessibilityLabel ?? "red"))
                }
            }
        }
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
        }
    }
    
    @IBAction func handleSettingColor1(_ sender: UISlider) {
        settingColor1.forEach{slider in
            defaults.set(slider.value, forKey: String(format: "%@%@","settingcolor1", slider.accessibilityLabel!))
        }
        let color = UIColor(red: CGFloat(defaults.float(forKey: "settingcolor1red")/255), green: CGFloat(defaults.float(forKey: "settingcolor1green")/255), blue: CGFloat(defaults.float(forKey: "settingcolor1blue")/255), alpha: 1.0)
        settingGrad.forEach{grad in
            grad.setColor(color1: color, color2: nil)
        }
    }
    
    @IBAction func handleSettingColor2(_ sender: UISlider) {
        settingColor2.forEach{slider in
            defaults.set(slider.value, forKey: String(format: "%@%@","settingcolor2", slider.accessibilityLabel!))
        }
        let color = UIColor(red: CGFloat(defaults.float(forKey: "settingcolor2red")/255), green: CGFloat(defaults.float(forKey: "settingcolor2green")/255), blue: CGFloat(defaults.float(forKey: "settingcolor2blue")/255), alpha: 1.0)
        settingGrad.forEach{grad in
            grad.setColor(color1: nil, color2: color)
        }
    }
    
    
    @IBAction func revertMainColor(_ sender: Any) {
        defaults.set(225, forKey:  "maincolor1red")
        defaults.set(85, forKey:  "maincolor1green")
        defaults.set(159, forKey:  "maincolor1blue")
        defaults.set(22, forKey:  "maincolor2red")
        defaults.set(97, forKey:  "maincolor2green")
        defaults.set(185, forKey:  "maincolor2blue")
        mainGrad.forEach{grad in grad.setColor(color1: self.getGradientColor1(), color2: self.getGradientColor2())
        }
        mainColor1.forEach{color in
            color.value = defaults.float(forKey: String(format: "%@%@","maincolor1", color.accessibilityLabel ?? "red"))
        }
        mainColor2.forEach{color in
            color.value = defaults.float(forKey: String(format: "%@%@", "maincolor2", color.accessibilityLabel ?? "red"))
        }
    }
    
    
    @IBAction func revertSettingColor(_ sender: Any) {
        defaults.set(193, forKey: "settingcolor1red")
        defaults.set(231, forKey: "settingcolor1green")
        defaults.set(251, forKey: "settingcolor1blue")
        defaults.set(85, forKey: "settingcolor2red")
        defaults.set(161, forKey: "settingcolor2green")
        defaults.set(167, forKey: "settingcolor2blue")
        settingGrad.forEach{grad in grad.setColor(color1: self.getGradientColor1(), color2: self.getGradientColor2())
        }
        settingColor1.forEach{color in
            color.value = defaults.float(forKey: String(format: "%@%@", "settingcolor1", color.accessibilityLabel ?? "red"))
        }
        settingColor2.forEach{color in
            color.value = defaults.float(forKey: String(format: "%@%@", "settingcolor2", color.accessibilityLabel ?? "red"))
        }
    }
}

