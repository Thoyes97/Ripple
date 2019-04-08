//
//  LoginViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//           Looks to see if the user is already logged in - if it does brings them right to the Homeview
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "alreadyLoggedIn", sender: nil)
        }
    }
    
    @IBAction func login(_ sender: Any) {
        //  Code retrieved from https: //medium.com/@ashikabala01/how-to-build-login-and-sign-up-functionality-for-your-ios-app-using-firebase-within-15-mins-df4731faf2f7
        
        // Send the login request to Firebase and brings the user to the first page (checks to see if credentials are right)
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil{
                self.performSegue(withIdentifier: "loginToGreeting", sender: self)
            }
            else{
                let alertController = UIAlertController(title: "Error", message: "Invalid email or password! Please try again or Sign up if you have not already done so.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                //                  If it cannot send the request to the database returns error message
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
}
