//
//  LapCellView.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 11/2/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import UIKit

class LapCellView: UICollectionViewCell, CollectionViewCell {
    static var ReuseID = "LapCellView"
    static var BaseSize: CGSize { CGSize(width: UIDevice.screenSize.width, height: 50) }
    
    override func awakeFromNib() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBOutlet weak var lapNumber: UILabel!
    @IBOutlet weak var lapTime: NumericDisplay!
    
    func configure(with model: CollectionViewCellModel) {
        guard let model = model as? LapCellModel else { return }
        lapNumber.text = model.lapNumber > 0 ? ordinal(for: model.lapNumber) : "Total"
        lapTime.timeInSeconds = model.lapTime
    }
    
    private func ordinal(for number: Int) -> String {
        switch number {
            case 1:
                return "1st"
            case 2:
                return "2nd"
            case 3:
                return "3rd"
            default:
                return "\(number)th"
        }
    }
}
