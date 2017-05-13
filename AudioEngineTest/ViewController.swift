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
    
    @IBAction func touchStart(_ sender: UIButton) {
        let buttonTitle = sender.currentTitle!
        let currentDisplayContent = display.text!
        display.text = currentDisplayContent + buttonTitle
        tryAudio()
    }
    
    private func tryAudio() {
        print("Start")
        let mixer = audioEngine.mainMixerNode;
        mixer.outputVolume = 0;
        
        if let inputNode = audioEngine.inputNode {
            audioEngine.connect(inputNode, to: mixer, format: inputNode.inputFormat(forBus: 0))
            let usedFormat = inputNode.outputFormat(forBus: 0)
            print("format: \(usedFormat)")
            inputNode.installTap(onBus: 0, bufferSize: 16, format: usedFormat, block: { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
                print("juhu")
            })
            do {
                audioEngine.prepare()
                try audioEngine.start()
            }
            catch {
                print("pfui: nix start")
            }
        } else {
            print("pfui: nix inputNode")
        }
        
        
        while (true)
        {
            Thread.sleep(forTimeInterval: 1)
        }

    }
    
    @IBAction func touchStop(_ sender: UIButton) {
        audioEngine.stop()
    }
}

