//
//  TableHeader.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 11/2/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import UIKit

class TableHeader: UICollectionReusableView {
    static var BaseSize: CGSize { CGSize(width: UIDevice.screenSize.width, height: 50) }
    
    override func awakeFromNib() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
}
