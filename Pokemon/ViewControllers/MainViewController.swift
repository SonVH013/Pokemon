//
//  ViewController.swift
//  Pokemon
//
//  Created by SonVu on 11/18/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, GamePlayViewDelegate {
    
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var descScore: UILabel!
    
    var score = 0
    var highscore = 0
    
    func getScoreBack(score: Int) {
        self.score = score
        print("Root view score: \(self.score)")
        self.labelScore.text = String(self.score)
        if self.score > highscore {
            highscore = self.score
            descScore.text = "NEW HIGHSCORE: \(self.score)"
            
            let HighScoreDefault = UserDefaults.standard
            HighScoreDefault.setValue(highscore, forKey: "HighScore")
            HighScoreDefault.synchronize()
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.labelScore.text = "0"
        
        let HighScoreDefault = UserDefaults.standard
        if HighScoreDefault.value(forKey: "HighScore") != nil {
            self.highscore = HighScoreDefault.value(forKey: "HighScore") as! NSInteger
            self.descScore.text = "HIGHSCORE: \(self.highscore)"
        }
        
        //
        print("MainView: \(UserDefaults.standard.value(forKey: "gens")!)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MAKR: MOVE TO GAME VIEW
    @IBAction func invokeToPlayView(_ sender: Any) {
        let playView = self.storyboard?.instantiateViewController(withIdentifier: "PlayView") as! GamePlayViewController
        playView.delegate = self
        self.navigationController?.pushViewController(playView, animated: true)
    }
    
    //MARK: MOVE TO SETTING VIEW
    @IBAction func invokeToSetting(_ sender: Any) {
        let settingView = self.storyboard?.instantiateViewController(withIdentifier: "Setting View")
        self.navigationController?.pushViewController(settingView!, animated: true)
    }

}

