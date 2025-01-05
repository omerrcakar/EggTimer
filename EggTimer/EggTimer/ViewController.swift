//
//  ViewController.swift
//  EggTimer
//
//  Created by ÖMER  on 5.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["soft":5,"medium":7,"hard":12]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func hardnessSelected(_ sender: UIButton) {
        if let titleLabel = sender.titleLabel?.text {
            let hardness = titleLabel.lowercased()
            
            switch hardness {
            case "soft":
                print("\(eggTimes[hardness]!)")
            case "medium":
                print("\(eggTimes[hardness]!)")
            case "hard":
                print("\(eggTimes[hardness]!)")
            default:
                print("Error")
            }
        }
    }
    
}

