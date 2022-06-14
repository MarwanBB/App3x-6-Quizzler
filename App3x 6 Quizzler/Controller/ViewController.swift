//
//  ViewController.swift
//  App3x 6 Quizzler
//
//  Created by Marwan Elbahnasawy on 23/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let quiz = Quiz()
    
    var count = 0
    var countRight : Float = 0
    

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var yesLabel: UIButton!
    @IBOutlet weak var noLabel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quiz.QAArray[count].q
        progressBar.progress = 0
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        yesLabel.backgroundColor = .none
        noLabel.backgroundColor = .none
        
            if quiz.QAArray[count].a == sender.titleLabel?.text   {
                sender.backgroundColor = .green
                countRight += 1
                self.progressBar.progress = self.countRight / Float(self.quiz.QAArray.count)
                self.scoreLabel.text = "Score = \(Int(self.countRight*100/Float(self.quiz.QAArray.count))) %"
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                    sender.backgroundColor = .none
                    
                }
            }
            else if quiz.QAArray[count].a != sender.titleLabel?.text   {
                sender.backgroundColor = .red
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                    sender.backgroundColor = .none
                }
            }
            count += 1
        
        if count == quiz.QAArray.count {
            count = 0
            countRight = 0
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                self.questionLabel.text = self.quiz.QAArray[self.count].q
                self.progressBar.progress = 0
                self.scoreLabel.text = "Score = 0 %"
            }
        }
        else {
            self.questionLabel.text = self.quiz.QAArray[self.count].q
        }
        
        
    }
    

}

