//
//  ActSelectionViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import MediaPlayer

class ActSelectionViewController: UIViewController, MPMediaPickerControllerDelegate {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    
    var emotion =  ""
    var emoji = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emojiLabel.text = emoji
wordLabel.text = emotion
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "activityOne" {
            let controller2 = segue.destination as! MusicSelViewController
            controller2.emotionTitle = (wordLabel.text ?? nil)!

        }
        else if segue.identifier == "activityTwo"{
            let controller2 = segue.destination as! MusicSelViewController
            controller2.emotionTitle = (wordLabel.text ?? nil)!

        }
        else if segue.identifier == "activityThreer"{
            let controller2 = segue.destination as! MusicSelViewController
            controller2.emotionTitle = (wordLabel.text ?? nil)!

        }
        else if segue.identifier == "activityFour"{
            let controller2 = segue.destination as! MusicSelViewController
            controller2.emotionTitle = (wordLabel.text ?? nil)!

        }
        else{
            return
        }
    }
}

