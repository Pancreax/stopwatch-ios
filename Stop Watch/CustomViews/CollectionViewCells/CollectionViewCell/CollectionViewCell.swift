//
//  CollectionViewCell.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 11/1/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import UIKit

protocol CollectionViewCell {
    static var ReuseID: String { get }
    static var BaseSize: CGSize { get }
    
    func configure(with model: CollectionViewCellModel)
}
