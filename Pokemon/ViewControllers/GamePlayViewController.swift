//
//  GamePlayViewController.swift
//  Pokemon
//
//  Created by SonVu on 11/18/16.
//  Copyright © 2016 SonVu. All rights reserved.
//

import UIKit

protocol GamePlayViewDelegate : NSObjectProtocol {
    func getScoreBack(score : Int)
}

class GamePlayViewController: UIViewController {
    weak var delegate : GamePlayViewDelegate?
    
    @IBOutlet var btnAnswers: [UIButton]!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressView: RPCircularProgress!
    @IBOutlet weak var rootView: UIView!
    
    var nameImg : String = ""
    var answer : String = ""
    var score : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManager.defaultManager.copyDatabaseIfNeed()
        loadData()
        configure()
        progress()
    }
    
    @IBAction func backToMainView(_ sender: Any) {
        self.navigationController!.popToRootViewController(animated: true)
    }
    
    @IBAction func btnAnswerTouched(_ sender: UIButton) {
        if sender.titleLabel?.text == answer {
            print("Dung roi")
            self.nameLabel.text = answer
            self.nameLabel.isHidden = false
            self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysOriginal)
            sender.backgroundColor = UIColor.green
            score += 1
        } else {
            print("Sai roi")
            self.nameLabel.text = answer
            self.nameLabel.isHidden = false
            self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysOriginal)
            sender.backgroundColor = UIColor.red
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6, execute: {
            self.loadData()
        }
        )
    }
    
    //MARK: Load Data
    func loadData() {
        
//        let randomImageIndex = Int(arc4random_uniform(747) + 1)
//        let randomAnswerIndex = Int(arc4random_uniform(4))
//        
//        var arr : [Pokemon]
//        var exceptArr : [Pokemon]
//        
//        //self.rootView.backgroundColor = randomColor()
//        
//        arr = DataManager.defaultManager.selectRandomPokemon(randomNumber: randomImageIndex)
//        self.answer = arr.first!.name
//        self.nameImg = arr.first!.img
//        exceptArr = DataManager.defaultManager.selectAllExcept(id: arr.first!.id)
//        
//        print("Image: \(arr.first!.img)")
//        print("Gen: \(arr.first!.gen)")
//        self.nameLabel.isHidden = true
//        self.scoreLabel.text = String(score)
//        self.imageView.image = UIImage(named: arr.first!.img)
//        self.imageView.tintColor = UIColor.black
//        self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysTemplate)
//        
//        for button in btnAnswers {
//            if btnAnswers.index(of: button) == randomAnswerIndex{
//                button.setTitle(arr.first!.name, for: .normal)
//            } else {
//                let randomExcept = Int(arc4random_uniform(746) + 1)
//                button.setTitle(exceptArr[randomExcept].name, for: .normal)
//            }
//            button.backgroundColor = UIColor.white
//        }
        
        
        var pokemonsByGensArr = DataManager.defaultManager.selectByGen(gen: UserDefaults.standard.value(forKey: "gens") as! [Int])
        
    }
    
    
    //MARK: CONFIG
    func configure()  {
        //config button answer
        for button in self.btnAnswers {
            button.layer.cornerRadius = 20
        }
        //config main view
        self.mainView.layer.cornerRadius = 15
        //config image
        self.nameLabel.isHidden = true
        self.imageView.image = UIImage(named: nameImg)
        self.imageView.tintColor = UIColor.black
        self.imageView.image = self.imageView.image?.withRenderingMode(.alwaysTemplate)
    }
    
    //Progress
    func progress() {
        self.progressView.updateProgress(1, animated: true, initialDelay: 0, duration: 15) {
            self.navigationController?.popToRootViewController(animated: true)
            self.delegate?.getScoreBack(score: self.score)
        }
    }
    
    //Random color
    func randomColor() -> UIColor {
        let colorArr : [UIColor] = [UIColor.brown, UIColor.blue, UIColor.cyan, UIColor.darkGray]
        let rand = arc4random_uniform(UInt32(colorArr.count))
        return colorArr[Int(rand)]
        
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
