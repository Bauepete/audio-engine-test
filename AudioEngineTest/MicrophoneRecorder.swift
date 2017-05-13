//
//  MicrophoneRecorder.swift
//  AudioEngineTest
//
//  Created by Peter Bauer on 13/05/2017.
//  Copyright © 2017 Peter Bauer. All rights reserved.
//

import Foundation
import AVFoundation

class MicrophoneRecorder {
    var audioEngine: AVAudioEngine
    
    init() {
        audioEngine = AVAudioEngine()
    }
    
    func start() {
        print("Start")
        
        if let inputNode = audioEngine.inputNode {
            let usedFormat = inputNode.outputFormat(forBus: 0)
            print("format: \(usedFormat)")
            inputNode.installTap(onBus: 0, bufferSize: 16, format: usedFormat, block: { (buffer, when) in
                for i in 0 ..< 16 {
                    print("juhu: \(String(describing: buffer.floatChannelData?.pointee[i]))")
                }
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
        
        Thread.sleep(forTimeInterval: 1)
    }
    
    func stop() {
        audioEngine.stop()
    }
}
