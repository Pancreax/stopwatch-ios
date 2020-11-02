//
//  StopWatchViewController.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 10/29/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet weak var startButton: RoundedButton!
    @IBOutlet weak var stopButton: RoundedButton!
    @IBOutlet weak var numericDisplay: NumericDisplay!
    @IBOutlet weak var lapsCollectionView: UICollectionView! {
        didSet {
            lapsCollectionView.delegate = self
            lapsCollectionView.dataSource = self
        }
    }
    
    private var laps = [LapCellModel]()
    private var currentLap: LapCellModel?
    private var running = false
    
    override func viewDidLoad() {
    }
    
    @IBAction func startButtonDidClick(_ sender: RoundedButton) {
        sender.setTitle("Next", for: .normal)
        stopButton.setTitle("Stop", for: .normal)
        let currentTime = Date()
        
        if currentLap != nil {
            currentLap!.endTime = currentTime
            add(lap: currentLap!)
        } else {
            clearAllLaps()
        }
        
        currentLap = LapCellModel(startTime: currentTime, lapNumber: laps.count + 1)
        if !running {
            updateDisplay()
            running = true
        }
    }
    
    @IBAction func stopButtonDidClick(_ sender: RoundedButton) {
        startButton.setTitle("Start", for: .normal)
        if running {
            let currentTime = Date()
            
            if currentLap != nil {
                currentLap!.endTime = currentTime
                if laps.count > 0 { add(lap: currentLap!) }
                add(lap: LapCellModel(startTime: laps.first?.startTime ?? currentLap!.startTime, endTime: currentTime, lapNumber: -1))
            }
            currentLap = nil
            running = false
            
            sender.setTitle("Clean", for: .normal)
        } else {
            sender.setTitle("Stop", for: .normal)
            clearAllLaps()
            numericDisplay.timeInSeconds = 0
        }
    }
    
    func add(lap: LapCellModel) {
        laps.append(lap)
        lapsCollectionView.insertItems(at: [IndexPath(item: laps.count - 1, section: 0)])
    }
    
    func clearAllLaps() {
        laps = [LapCellModel]()
        lapsCollectionView.reloadData()
    }
    
    func updateDisplay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1)) { [weak self] in
            guard let self = self else { return }
            if let currentLap = self.currentLap {
                self.numericDisplay.timeInSeconds = DateInterval(start: currentLap.startTime, end: Date()).duration
                self.updateDisplay()
            } else if let currentLap = self.laps.last {
                self.numericDisplay.timeInSeconds = DateInterval(start: currentLap.startTime, end: currentLap.endTime!).duration
            }
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        lapsCollectionView.collectionViewLayout.invalidateLayout()
    }
}

extension StopWatchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { laps.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LapCellView.ReuseID, for: indexPath) as? LapCellView else {
            assertionFailure("Em todos estes anos nessa indústria vital isso nunca me aconteceu!")
            return UICollectionViewCell()
        }
        cell.configure(with: laps[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "tableHeader", for: indexPath)
    }
}

extension StopWatchViewController: UICollectionViewDelegate {
    
}

extension StopWatchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        TableHeader.BaseSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        LapCellView.BaseSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
