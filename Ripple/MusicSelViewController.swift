//
//  MusicSelViewController.swift
//  Ripple
//
//  Created by Tryston Hoyes on 2019-04-09.
//  Copyright © 2019 Tryston Hoyes. All rights reserved.
//

import UIKit
import MediaPlayer

class MusicSelViewController: UIViewController, MPMediaPickerControllerDelegate {

    @IBOutlet weak var PlaylistTitle: UILabel!
    
    var musicPlayer = MPMusicPlayerController.systemMusicPlayer
    var emotionTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
PlaylistTitle.text = emotionTitle
        // Do any additional setup after loading the view.
    }
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        musicPlayer.setQueue(with: mediaItemCollection)
        mediaPicker.dismiss(animated: true, completion: nil)
        musicPlayer.prepareToPlay()
        musicPlayer.play()
       moveToNextView()
    }
    
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        mediaPicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectMusic(_ sender: UIButton) {
        let myMediaPickerVC = MPMediaPickerController(mediaTypes: MPMediaType.music)
        myMediaPickerVC.allowsPickingMultipleItems = true
        myMediaPickerVC.popoverPresentationController?.sourceView = sender
        myMediaPickerVC.delegate = self
        self.present(myMediaPickerVC,animated: true, completion: nil)
    }
    
    func moveToNextView(){
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(tobegin), userInfo: nil, repeats: false)
        
    }
    
    @objc func tobegin() {
        self.performSegue(withIdentifier: "startAct", sender: self)
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
