//
//  StopWatchViewController.swift
//  Stop Watch
//
//  Created by Guilherme Andrade on 10/29/20.
//  Copyright © 2020 Pancreax. All rights reserved.
//

import UIKit

class StopWatchViewController: UIViewController {

    @IBOutlet weak var numericDisplay: NumericDisplay!
    
    private var startTime: Date?
    private var endTime: Date?
    private var running = false
    
    @IBAction func startButtonDidClick(_ sender: RoundedButton) {
        endTime = nil
        startTime = Date()
        if !running {
            updateDisplay()
            running = true
        }
    }
    
    @IBAction func stopButtonDidClick(_ sender: RoundedButton) {
        if running {
            endTime = Date()
            running = false
        }
    }
    
    func updateDisplay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1)) { [weak self] in
            guard let self = self else { return }
            if let endTime = self.endTime, let startTime = self.startTime {
                self.numericDisplay.timeInSeconds = DateInterval(start: startTime, end: endTime).duration
            } else {
                self.numericDisplay.timeInSeconds = DateInterval(start: self.startTime!, end: Date()).duration
                self.updateDisplay()
            }
        }
    }

}

