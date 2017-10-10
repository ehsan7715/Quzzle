//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var totalQuestion : Int = 0
    var scoreNumber : Int = 0
    
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //my codes
        totalQuestion = allQuestions.list.count
        nextQuestion()

    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        } else if sender.tag == 2{
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber += 1
        nextQuestion()
        
        
  
    }
    
    
    func updateUI() {
        scoreLabel.text = "score: \(scoreNumber)"
        progressLabel.text = "\(questionNumber+1) / \(totalQuestion)"
        progressBar.frame.size.width = (view.frame.size.width / CGFloat(totalQuestion)) * CGFloat(questionNumber+1)
      
    }
    

    func nextQuestion() {
        if questionNumber < totalQuestion {
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        }
        else{
            let alertMessage = UIAlertController(title: "End of you Quiz!!", message: "Yous Score is: \(scoreNumber)\nDo you want to restart the test?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            alertMessage.addAction(alertAction)
            present(alertMessage, animated: true, completion: nil)
        }
        
        
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer==pickedAnswer {
            print("You picked the true")
            scoreNumber += 1
        }
        else{
            print("worng!!")
        }
        
    }
    
    
    func startOver() {
        questionNumber = 0
        scoreNumber = 0
        nextQuestion()
       
    }
    

    
}
