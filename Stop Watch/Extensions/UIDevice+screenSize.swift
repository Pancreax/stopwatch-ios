//
//  UIDevice+screenSize.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 11/2/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import UIKit

extension UIDevice {
    static var screenSize: CGSize {
        let majorDimension = max(UIScreen.main.bounds.width,UIScreen.main.bounds.height)
        let minorDimension = min(UIScreen.main.bounds.width,UIScreen.main.bounds.height)
        var safeAreaVerticalPadding: CGFloat = 0
        var safeAreaHorizontalPadding: CGFloat = 0
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            let topPadding = window?.safeAreaInsets.top ?? 0
            let bottomPadding = window?.safeAreaInsets.bottom ?? 0
            let leftPadding = window?.safeAreaInsets.left ?? 0
            let rightPadding = window?.safeAreaInsets.right ?? 0
            safeAreaVerticalPadding = topPadding + bottomPadding
            safeAreaHorizontalPadding = leftPadding + rightPadding
        }
        
        switch UIApplication.shared.statusBarOrientation {
            case .unknown, .portrait, .portraitUpsideDown:
                return CGSize(width: minorDimension - safeAreaHorizontalPadding, height: safeAreaVerticalPadding)
            default:
                return CGSize(width: majorDimension - safeAreaHorizontalPadding, height: safeAreaVerticalPadding)
        }
    }
}
