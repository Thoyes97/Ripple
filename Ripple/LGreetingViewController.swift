//
//  LGreetingViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import  Firebase

class LGreetingViewController: UIViewController {

    
    //code retrieved from https://www.youtube.com/watch?v=GA8K1YyAM5E&t=440s
    var welcomeBackLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blue
        label.font = UIFont.systemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //       code retrieved from  https://www.youtube.com/watch?v=GA8K1YyAM5E&t=440s
        view.addSubview(welcomeBackLabel)
        welcomeBackLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeBackLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadUserData()
//         code retrieved from https://stackoverflow.com/questions/26379462/how-do-i-perform-an-auto-segue-in-xcode-6-using-swift/29006810 - create a timer that calls a function to preform a segue
        let timer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(autoSegue), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view.
    }
    @objc func autoSegue() {
        self.performSegue(withIdentifier: "toHome", sender: self)
    }
    //      code retrieved from https://www.youtube.com/watch?v=GA8K1YyAM5E&t=440s
        func loadUserData(){
            guard let uid =  Auth.auth().currentUser?.uid else {return}
            Database.database().reference().child("Users").child(uid).child("First Name").observeSingleEvent(of: .value)
            {
                (snapshot) in
                guard let firstName = snapshot.value as? String else {return}
                self.welcomeBackLabel.text = "Welcome back, \(firstName)!"
                UILabel.animate(withDuration: 0.5 , animations: {
                    self.welcomeBackLabel.alpha = 1
                })
            }
        }
}
