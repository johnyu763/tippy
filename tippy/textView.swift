//
//  textView.swift
//  tippy
//
//  Created by John Yu on 8/28/19.
//  Copyright © 2019 John Yu. All rights reserved.
//

import UIKit

@IBDesignable class textView : UITextField{
    
    @IBInspectable var borderWidth: CGFloat = 0.5 {
        didSet{
            setBorder()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 5 {
        didSet{
            setBorder()
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.black {
        didSet{
            setBorder()
        }
    }
    
    private func setBorder(){
        self.layer.borderColor = self.borderColor.cgColor
        self.layer.borderWidth = self.borderWidth
        self.layer.cornerRadius = self.cornerRadius
    }
}
