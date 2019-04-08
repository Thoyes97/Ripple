//
//  SGreetingViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import Firebase

class SGreetingViewController: UIViewController {

    //code retrieved from https://www.youtube.com/watch?v=GA8K1YyAM5E&t=440s
    var welcomeLabel: UILabel = {
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
        view.addSubview(welcomeLabel)
        welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadUserData()
        let timer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(autoSegue), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view.
    }
    @objc func autoSegue() {
        self.performSegue(withIdentifier: "toIntro", sender: self)
    }
    //     code retrieved from https://www.youtube.com/watch?v=GA8K1YyAM5E&t=440s
    func loadUserData(){
        guard let uid =  Auth.auth().currentUser?.uid else {return}
        Database.database().reference().child("Users").child(uid).child("First Name").observeSingleEvent(of: .value)
        {
            (snapshot) in
            guard let firstName = snapshot.value as? String else {return}
            self.welcomeLabel.text = "Welcome, \(firstName)!"
            UILabel.animate(withDuration: 0.5 , animations: {
                self.welcomeLabel.alpha = 1
            })
        }
    }

}
