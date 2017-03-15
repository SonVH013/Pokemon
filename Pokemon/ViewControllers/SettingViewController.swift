//
//  SettingViewController.swift
//  Pokemon
//
//  Created by SonVu on 11/20/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var switchSoundEffect: UISwitch!
    @IBOutlet weak var switchMusic: UISwitch!
    
    @IBOutlet var btnGens: [UIButton]!
    @IBOutlet var genNumber: [UILabel]!
    
    var arr : [Int] = []
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        config()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnGenTouched(_ sender: UIButton) {
        self.arr.removeAll()
        let type : Int = sender.tag - 1

        if sender.alpha == 1 {
            sender.alpha = 0.5
            genNumber[type].alpha = 0.5
            self.count += 1
        }
        else {
            sender.alpha = 1
            genNumber[type].alpha = 1
            self.count -= 1
        }
        print(count)
        if self.count > 5 {
            sender.alpha = 1
            genNumber[type].alpha = 1
            self.count = 5
        }
        
        
    }
    
    @IBAction func backToRootView(_ sender: Any) {
        self.navigationController!.popToRootViewController(animated: true)
        // get pokemon gen
        for button in btnGens {
            if button.alpha == 1 {
                let gen = button.tag
                self.arr.append(gen)
            }
        }
        UserDefaults.standard.set(self.arr, forKey: "gens")
        UserDefaults.standard.synchronize()
        print("User default: \(UserDefaults.standard.value(forKey: "gens"))")
    }
    
    
    func config() {
        switchSoundEffect.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        switchMusic.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        let listGens = UserDefaults.standard.value(forKey: "gens") as! [Int]
        
        for button in btnGens {
            button.alpha = 1
        }
        
        for index in listGens {
            for button in btnGens {
                if index == button.tag {
                    button.alpha = 0.5
                }
            }
        }
        
        for button in btnGens {
            if button.alpha == 0.5 {
                self.count += 1
            }
        }
        print("SElf count: \(self.count)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
