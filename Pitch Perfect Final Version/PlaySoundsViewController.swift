//
//  PlaySoundsViewController.swift
//  Pitch Perfect Final Version
//
//  Created by Parth Dhebar on 6/25/18.
//  Copyright © 2018 Parth Dhebar. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet var slowButton: UIButton!
    @IBOutlet var fastButton: UIButton!
    @IBOutlet var reverbButton: UIButton!
    @IBOutlet var chipMunkButton: UIButton!
    @IBOutlet var echoButton: UIButton!
    @IBOutlet var vaderButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
enum ButtonType: Int {case slow = 0, fast, reverb, chipmunk, echo, vader}
    
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .reverb:
            playSound(reverb: true)
        case .chipmunk:
            playSound(pitch: 1000)
        case .echo:
            playSound(echo: true)
        case .vader:
            playSound(pitch: -1000)
       
        
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    

    

 
