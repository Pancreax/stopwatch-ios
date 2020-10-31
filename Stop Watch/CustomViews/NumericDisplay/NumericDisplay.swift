//
//  NumericDisplay.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 10/30/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import UIKit

@IBDesignable
class NumericDisplay: UILabel {
    
    var timeInSeconds: Double = 0{
        didSet {
            minutes = Int(timeInSeconds / 60)
            seconds = Int(timeInSeconds) % 60
            miliSeconds = Int(timeInSeconds*1000) % 1000
        }
    }
    
    @IBInspectable
    var fontSize: CGFloat = 50 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var minutes: Int = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var seconds: Int = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var miliSeconds: Int = 0 {
        didSet {
            updateView()
        }
    }
    
    private func updateView() {
        text = String(format: "%02i:%02i:%03i", minutes, seconds, miliSeconds)
        font = UIFont(name: "Menlo", size: fontSize)
    }
}
