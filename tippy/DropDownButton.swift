//
//  DropDownButton.swift
//  tippy
//
//  Created by John Yu on 8/28/19.
//  Copyright © 2019 John Yu. All rights reserved.
//

import UIKit

@IBDesignable class DropDownButton : UIButton
{
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
}
