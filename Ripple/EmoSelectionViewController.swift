//
//  EmoSelectionViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit

class EmoSelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
//    Code structure retrived from teh following sources then placed in a if statement based on which button is pressed
//https://www.hackingwithswift.com/example-code/system/how-to-pass-data-between-two-view-controllers
//https://stackoverflow.com/questions/44228828/how-to-pass-data-to-multiple-viewcontrollers-from-the-same-button
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feelAnger" {
            let anger = "Anger"
            let emoji = "🤬"
                let controller = segue.destination as! ActSelectionViewController
        controller.emoji = emoji
            controller.emotion = anger
        }
        else if segue.identifier == "feelSad"{
            let sad = "Sad"
            let emoji = "😭"
            let controller = segue.destination as! ActSelectionViewController
            controller.emoji = emoji
            controller.emotion = sad
        }
        else if segue.identifier == "feelFear"{
            let fear = "Fear"
            let emoji = "😨"
            let controller = segue.destination as! ActSelectionViewController
            controller.emoji = emoji
            controller.emotion = fear
        }
        else if segue.identifier == "feelLove"{
            let love = "Love"
            let emoji = "😍"
            let controller = segue.destination as! ActSelectionViewController
            controller.emoji = emoji
            controller.emotion = love
        }
        else if segue.identifier == "feelShock"{
        let shock = "Shock"
        let emoji = "😮"
        let controller = segue.destination as! ActSelectionViewController
        controller.emoji = emoji
        controller.emotion = shock
    }
        else if segue.identifier == "feelHappy"{
        let happy = "Happy"
        let emoji = "😊"
        let controller = segue.destination as! ActSelectionViewController
        controller.emoji = emoji
        controller.emotion = happy
    }
        else{
            return
        }
    }

}



