//
//  MusCurationViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit

class MusCurationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OpenMusic(_ sender: Any) {
        
//        code retrieved from https://www.youtube.com/watch?v=alz84sLueIU - altered to open Apple's System Music player
        if let appURL = URL(string: "music://") {
            let canOpen = UIApplication.shared.canOpenURL(appURL)
            print("\(canOpen)")
            
            let appName = "Music"
            let appScheme = "\(appName)://"
            let appSchemeURL = URL(string: appScheme)
            
            if UIApplication.shared.canOpenURL(appSchemeURL! as URL){
                UIApplication.shared.open(appSchemeURL!, options: [:], completionHandler: nil)
            }
            else {
                let alert = UIAlertController( title: "\(appName) Error", message: "The \(appName) app could not be found, please install via appstore", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert,animated: true, completion: nil)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
