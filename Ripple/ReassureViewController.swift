//
//  ReassureViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-07.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit

class ReassureViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
let timer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(autoSegue), userInfo: nil, repeats: false)
        // Do any additional setup after loading the view.
    }
    @objc func autoSegue() {
        self.performSegue(withIdentifier: "toHome", sender: self)
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
