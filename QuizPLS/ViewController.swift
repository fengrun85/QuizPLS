//
//  ViewController.swift
//  QuizPLS
//
//  Created by apple on 25/11/19.
//  Copyright © 2019 Tinkercademy. All rights reserved.
//

import UIKit




class ViewController: UIViewController {
    //index number of my questions
    var currentQuestion = 0
    //score of the quiz
    var score = 0
    //keep track of start and end of quiz
    var quizStarted = false
    //Create Timer for quiz
    var myTimer : Timer!
    //Seconds since the quiz started
    var secondsSinceStart = 0
    var minutesSinceStart = 0
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var continueLabel: UILabel!
    
    
    @IBOutlet weak var Option1: UIButton!
    @IBOutlet weak var Option2: UIButton!
    @IBOutlet weak var Option3: UIButton!
    @IBOutlet weak var Option4: UIButton!
    
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    var questionsSet = [Question(questionStatement: "What is the largest planet in the Solar System?", firstChoice: "Earth", secondChoice: "Mars", thirdChoice: "Saturn", fourthChoice: "Jupiter", correctChoice: .four, answeredCorrectly: false), Question(questionStatement: "How many main rings does Saturn have?", firstChoice: "10", secondChoice: "3", thirdChoice: "6", fourthChoice: "8", correctChoice: .two, answeredCorrectly: false),Question(questionStatement: "What is the closest planet to the Sun", firstChoice: "Mercury", secondChoice: "Venus", thirdChoice: "Mars", fourthChoice: "Saturn", correctChoice: .one, answeredCorrectly: false), Question(questionStatement: "How far is the moon from Earth", firstChoice: "384400km", secondChoice: "348000km", thirdChoice: "376300km", fourthChoice: "34350km", correctChoice: .one, answeredCorrectly: false), Question(questionStatement: "What is the average surface temperature on Neptune", firstChoice: "-214°C", secondChoice: "-114°C", thirdChoice: "-21°C", fourthChoice: "-43°C", correctChoice: .one, answeredCorrectly: false), Question(questionStatement: "How long is a day on Mercury?", firstChoice: "6 Earth days", secondChoice: "176 Earth days", thirdChoice: "61 Earth days", fourthChoice: "16 Earth days", correctChoice: .two, answeredCorrectly: false), Question(questionStatement: "What is the sixth planet from the Sun?", firstChoice: "Jupiter", secondChoice: "Neptune", thirdChoice: "Saturn", fourthChoice: "Uranus", correctChoice: .three, answeredCorrectly: false)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestions()
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
        quizStarted = true
        tapGesture.isEnabled = false
        continueLabel.isHidden = true
    }

    @IBAction func option1Clicked(_ sender: Any) {
        if questionsSet[currentQuestion].correctChoice == .one {
            Option1.setTitle("\(questionsSet[currentQuestion].firstChoice) ☑️ ", for: .normal)
            score+=1
            questionsSet[currentQuestion].answeredCorrectly = true
            
        }
        else {
            Option1.setTitle("\(questionsSet[currentQuestion].firstChoice) ❌ ", for: .normal)
        }
        disableButtonsAndContinue()
    }
    
    @IBAction func option2Clicked(_ sender: Any) {
        if questionsSet[currentQuestion].correctChoice == .two {
            Option2.setTitle("\(questionsSet[currentQuestion].secondChoice) ☑️ ", for: .normal)
            score+=1
            questionsSet[currentQuestion].answeredCorrectly = true
        }
        else{
            Option2.setTitle("\(questionsSet[currentQuestion].secondChoice) ❌ ", for: .normal)
        }
        disableButtonsAndContinue()
    }
    
    @IBAction func option3Clicked(_ sender: Any) {
        if questionsSet[currentQuestion].correctChoice == .three {
            Option3.setTitle("\(questionsSet[currentQuestion].thirdChoice) ☑️ ", for: .normal)
            score+=1
            questionsSet[currentQuestion].answeredCorrectly = true
        }
        else{
            Option3.setTitle("\(questionsSet[currentQuestion].thirdChoice) ❌ ", for: .normal)
        }
        disableButtonsAndContinue()
    }
    
    @IBAction func option4Clicked(_ sender: Any) {
        if questionsSet[currentQuestion].correctChoice == .four {
            Option4.setTitle("\(questionsSet[currentQuestion].fourthChoice) ☑️ ", for: .normal)
            score+=1
            questionsSet[currentQuestion].answeredCorrectly = true
        }
        else{
            Option4.setTitle("\(questionsSet[currentQuestion].fourthChoice) ❌ ", for: .normal)
        }
        
        disableButtonsAndContinue()
    }
    
    
    @IBAction func tapToContinueTapped(_ sender: Any) {
        print("Tapped")
        //check if I reached the last question in the array
        if currentQuestion < questionsSet.count-1 {
            currentQuestion+=1 //go to next question index number if not at last question
            setupQuestions()   //load the next question
        }
        else {
            //this happens when we reach the last question
            Option1.isEnabled = false
            Option2.isEnabled = false
            Option3.isEnabled = false
            Option4.isEnabled = false
            quizStarted = false
            questionLabel.text = "🌝 Score : \(score) 🕐 Time : \(minutesSinceStart):\(secondsSinceStart)"
            
        }
    }
    
    
    
    func setupQuestions(){
        //set my Question label to show the question statement
        questionLabel.text = questionsSet[currentQuestion].questionStatement
        //Setup my four options
        Option1.setTitle(questionsSet[currentQuestion].firstChoice, for: .normal)
        Option2.setTitle(questionsSet[currentQuestion].secondChoice, for: .normal)
        Option3.setTitle(questionsSet[currentQuestion].thirdChoice, for: .normal)
        Option4.setTitle(questionsSet[currentQuestion].fourthChoice, for: .normal)
        tapGesture.isEnabled = false
        continueLabel.isHidden = true
        Option1.isEnabled = true
        Option2.isEnabled = true
        Option3.isEnabled = true
        Option4.isEnabled = true
        }
    
    @objc func updateTimer() {
        //check if quiz started and record seconds since quiz started
        if quizStarted == true{
        secondsSinceStart+=1
        }
        else {
        secondsSinceStart+=0
        }
        // check if 60 seconds and add to minutes
        if secondsSinceStart < 60 {
            print(secondsSinceStart)
        }
        else{
            minutesSinceStart+=1
            secondsSinceStart = 0
        }
        
        timerLabel.text = " 🕐 \(minutesSinceStart):\(secondsSinceStart) "
        
    }
    
    func disableButtonsAndContinue(){
        Option1.isEnabled = false
        Option2.isEnabled = false
        Option3.isEnabled = false
        Option4.isEnabled = false
        tapGesture.isEnabled = true
        continueLabel.isHidden = false
    }
    
    
}
