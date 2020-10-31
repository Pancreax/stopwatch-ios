//
//  RoundedButton.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 10/30/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable
    var padding: CGFloat = 0 {
        didSet {
            updateView()
        }
    }

    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        contentEdgeInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    
}
