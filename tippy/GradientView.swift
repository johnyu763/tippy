//
//  GradientView.swift
//  tippy
//
//  Created by John Yu on 8/21/19.
//  Copyright © 2019 John Yu. All rights reserved.
//
import UIKit

@IBDesignable class GradientView: UIView
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
    
    public func setColor(color1 : UIColor?, color2 : UIColor?){
        self.gradientColor1 = color1 ?? self.gradientColor1
        self.gradientColor2 = color2 ?? self.gradientColor2
        self.setGradient()
//        print(self.accessibilityLabel)
    }
}
