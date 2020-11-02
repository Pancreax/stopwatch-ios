//
//  CollectionViewCellModel.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 11/1/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import Foundation

protocol CollectionViewCellModel {
    var viewType: CollectionViewCell.Type { get }
    var action: (() -> ())? { get }
}
