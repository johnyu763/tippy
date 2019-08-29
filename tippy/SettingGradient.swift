//
//  SettingGradient.swift
//  tippy
//
//  Created by John Yu on 8/28/19.
//  Copyright © 2019 John Yu. All rights reserved.
//

import UIKit

@IBDesignable class SettingGradient: UIView
{
    @IBInspectable var gradientColor1: UIColor = UIColor.white {
        didSet{
            self.setGradient()
        }
    }
    
    @IBInspectable var gradientColor2: UIColor = UIColor.white {
        didSet{
            self.setGradient()
        }
    }
    
    @IBInspectable var gradientStartPoint: CGPoint = .zero {
        didSet{
            self.setGradient()
        }
    }
    
    @IBInspectable var gradientEndPoint: CGPoint = CGPoint(x: 0, y: 1) {
        didSet{
            self.setGradient()
        }
    }
    
    private func setGradient()
    {
        let gradLayer = CAGradientLayer()
        gradLayer.colors = [self.gradientColor1.cgColor, self.gradientColor2.cgColor]
        gradLayer.startPoint = self.gradientStartPoint
        gradLayer.endPoint = self.gradientEndPoint
        gradLayer.frame = self.bounds
        if let topLayer = self.layer.sublayers?.first, topLayer is CAGradientLayer
        {
            topLayer.removeFromSuperlayer()
        }
        self.layer.insertSublayer(gradLayer, at: 0)
    }
}

