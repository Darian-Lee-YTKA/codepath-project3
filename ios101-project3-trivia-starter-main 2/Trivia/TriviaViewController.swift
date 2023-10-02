//TriviaViewController
//  TriviaViewController.swift
//  Trivia
//
//  Created by Darian Lee on 10/1/23.
//

import UIKit

class TriviaViewController: UIViewController {

    
   
    
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var choiceFour: UIButton!
    @IBOutlet weak var choiceThree: UIButton!
    @IBOutlet weak var choiceTwo: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var choiceOne: UIButton!
    @IBOutlet weak var topic: UILabel!
    @IBOutlet weak var restart: UIButton!
    
    @IBOutlet weak var contest: UIButton!
    
    var triviaQuestions: [TriviaCode] = []
    var currentQuestionIndex = 0

        override func viewDidLoad() {
            super.viewDidLoad()

            // Initialize your trivia question using an instance of TriviaCode
            // and provide a question code and a question number.
            triviaQuestions = [
                TriviaCode(question: .history, questionNum: 1, choice1: "", choice2: "", choice3: "", choice4: "", correct: "Boris Yeltsin", restartVal: "", contestVal: ""),
                TriviaCode(question: .sports, questionNum: 2, choice1: "", choice2: "", choice3: "", choice4: "", correct: "East Germany", restartVal: "", contestVal: ""),
                TriviaCode(question: .film, questionNum: 3, choice1: "", choice2: "", choice3: "", choice4: "", correct: "Moscow does not Believe in Tears", restartVal: "", contestVal: ""),TriviaCode(question: .done, questionNum: 3, choice1: "", choice2: "", choice3: "", choice4: "", correct: "", restartVal: "Restart", contestVal: "Contest Score")
                
                    ]
            loadNextQuestion()
                }
    func performSegueAndDismiss(afterDelay delay: TimeInterval, withIdentifier identifier: String) {
        print("Function called at least")
            performSegue(withIdentifier: identifier, sender: self)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                self.dismiss(animated: true, completion: nil)
            }
        }

    func loadNextQuestion() {
            guard currentQuestionIndex < triviaQuestions.count else {
  
 
                return
                }
    
        let nextQuestion = triviaQuestions[currentQuestionIndex]
                configure(with: nextQuestion)
                
          
                currentQuestionIndex += 1
            }
            
            private func configure(with question: TriviaCode) {
                
                if question.question.description == "Score:"{
                    questionText.text = "\(question.question.description) \(correct_counter)/3"
                }
                else{
                    questionText.text = question.question.description
                    
                }
                topic.text = question.question.category
                choiceOne.setTitle(question.question.choices.0, for: .normal)
                choiceTwo.setTitle(question.question.choices.1, for: .normal)
                choiceThree.setTitle(question.question.choices.2, for: .normal)
                choiceFour.setTitle(question.question.choices.3, for: .normal)
                restart.setTitle(question.question.restartVal, for: .normal)
                contest.setTitle(question.question.contestVal, for: .normal)
                if currentQuestionIndex + 1 == 4{
                    questionNumber.text = "GAME OVER"
                }
                else{
                    questionNumber.text = "Question \(currentQuestionIndex + 1)/\((triviaQuestions.count) - 1)"
                    
                }
                
            }

    

    
    var correct_counter: Int = 0
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        currentQuestionIndex = 0
        correct_counter = 0
        loadNextQuestion()
    }
    @IBAction func contestButtonTapped(_ sender: UIButton) {
        let tappedChoice = sender.currentTitle
        if tappedChoice != ""{
            performSegue(withIdentifier: "ShowContestScoreSegue", sender: self)
        }
    }
    
    @IBAction func choiceButtonTapped(_ sender: UIButton) {
        guard let tappedChoice = sender.currentTitle else {
            return
        }
        
        let currentQuestion = triviaQuestions[currentQuestionIndex - 1]
        if tappedChoice != ""{
            if tappedChoice == currentQuestion.correct {
                correct_counter += 1
                performSegue(withIdentifier: "ShowCorrectSegue", sender: self)
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.dismiss(animated: true, completion: nil)
                }
                
            } else {
                performSegue(withIdentifier: "ShowIncorrectSegue", sender: self)
                
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.dismiss(animated: true, completion: nil)
                }
            }
            
        }
    
   
        
            loadNextQuestion()
        
        
        }
    }


   
