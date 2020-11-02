//
//  TableHeader.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 11/2/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import UIKit

class TableHeader: UICollectionReusableView {
    override func awakeFromNib() {
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 1
    }
}
