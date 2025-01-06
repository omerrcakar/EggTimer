//
//  ViewController.swift
//  EggTimer
//
//  Created by ÖMER  on 5.01.2025.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    let eggTimes = ["soft":3,"medium":4,"hard":7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    
    var player: AVAudioPlayer?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.progressBar.clipsToBounds = true
        self.progressBar.layer.cornerRadius = 5
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
 
        timer.invalidate()
        
        if let titleLabel = sender.titleLabel?.text {
            let hardness = titleLabel.lowercased()
            
            totalTime = eggTimes[hardness] ?? 60
            progressBar.progress = 0.0
            secondsPassed = 0
            self.titleLabel.text = hardness.uppercased()
            
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }else{
            print("Error -> NIL")
        }
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime{
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        }else{
            timer.invalidate()
            titleLabel.text = "Done!"
            playSound()
        }
    }
    
    
    func playSound(){
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3") else { return }
        let url = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.play()
        }catch{
            print(error.localizedDescription)
        }
    }
    
}

