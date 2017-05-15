//
//  ViewController.swift
//  AudioEngineTest
//
//  Created by Peter Bauer on 12/05/2017.
//  Copyright © 2017 Peter Bauer. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recorder: MicrophoneRecorder = MicrophoneRecorder()
    
    @IBAction func touchStart(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        if buttonTitle == "Start" {
            display.text = "Started recording"
            startButton.isEnabled = false
            stopButton.isEnabled = true
            recorder.start()
        } else {
            display.text = "Stopped recording"
            startButton.isEnabled = true
            stopButton.isEnabled = false
            recorder.stop()
        }
        
    }
  }

