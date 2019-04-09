//
//  SignUpViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    var ref: DatabaseReference!
    
    @IBOutlet weak var signUp: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func createUser(){
        //                Code retrieved from https://www.youtube.com/watch?v=z0-ME5HYook&list=PLaXWdRaxFtVcgioOVP6UxFt43KQ6Gjur_&index=13. To allow for users to get stored to a database once they have created an account.
        //                Since the originally sourced video was made syntax for the database reference has been altered, code retrieved from https://firebase.google.com/docs/database/ios/read-and-write
        let ref = Database.database().reference()
        let usersReference = ref.child("Users")
        //                Since the originally sourced video was made syntax to retrieve the UID has been altered. Code retrieved from https://stackoverflow.com/questions/51413651/firebase-database-user-uid
        let uuid = Auth.auth().currentUser?.uid
        let newUserReference = usersReference.child((uuid ?? nil)!)
        newUserReference.setValue(["First Name": self.firstName.text!, "Email": self.email.text!])
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        //  Code retrieved from https: //medium.com/@ashikabala01/how-to-build-login-and-sign-up-functionality-for-your-ios-app-using-firebase-within-15-mins-df4731faf2f7
        
        //        Looks to see if the password is the same in both fields - when they are correct it continues if not it provides them with an error
        if password.text != confirmPass.text{
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            // Send the resgister request to Firebase and brings the user to the first page
            
            Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                if error != nil {
                    //                    If it cannot send the request to the database returns error message
                    let alertController = UIAlertController(title: "Error", message: "Your password isnt 6 character long!", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
                else{
                    
                    self.performSegue(withIdentifier: "signUpToGreeting", sender: self)
                    self.createUser()
                    
                }
    
            }
        }
    }
    
   

}
