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
    
    @IBOutlet var fastButton: UIButton!
    @IBOutlet var vaderButton: UIButton!
    @IBOutlet var reverbButton: UIButton!
    @IBOutlet var slowButton: UIButton!
    @IBOutlet var echoButton: UIButton!
    @IBOutlet var chipmunkButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int { case fast = 0, vader, reverb, slow, echo, chipmunk}
    
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .fast:
            playSound(rate: 1.5)
        case .vader:
            playSound(pitch: -1000)
        case .reverb:
            playSound(reverb: true)
        case .slow:
            playSound(rate: 0.5)
        case .echo:
            playSound(echo: true)
        case .chipmunk:
            playSound(pitch: 1000)
        
        }
        
        configureUI(.playing)
        
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
        print("stop audio button pressed")
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
