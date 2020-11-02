//
//  LapCellModel.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 11/2/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import Foundation

struct LapCellModel: CollectionViewCellModel {
    var viewType: CollectionViewCell.Type {
        LapCellView.self
    }
    var action: (() -> ())?
    
    var startTime: Date
    var endTime: Date?
    
    var lapNumber: Int
    var lapTime: TimeInterval {
        DateInterval(start: startTime, end: endTime ?? startTime).duration
    }
}
