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
    var audioEngine: AVAudioEngine = AVAudioEngine()
    var recorder: MicrophoneRecorder = MicrophoneRecorder()
    
    @IBAction func touchStart(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        let currentDisplayContent = display.text!
        display.text = currentDisplayContent + buttonTitle
        recorder.start()
    }
        
    @IBAction func touchStop(_ sender: UIButton) {
        recorder.stop()
    }
}

