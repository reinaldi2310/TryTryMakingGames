//
//  ViewController.swift
//  TryTryMakingGames
//
//  Created by User on 13/08/20.
//  Copyright © 2020 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var gameTitle: UILabel!
    @IBOutlet var playerOneNumber: UILabel!
    @IBOutlet var playerTwoNumber: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    @IBOutlet var playerOneId: UILabel!
    @IBOutlet var playerOneScore: UILabel!
    @IBOutlet var playerTwoId: UILabel!
    @IBOutlet var playerTwoScore: UILabel!
    
    var timer: Timer?
    var score1 = 0
    var score2 = 0
    var number1 = 0
    var number2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        setupButton()
    }
    
    private func setupUi() {
        gameTitle.text = "Lets say this is a game"
        gameTitle.textColor = UIColor.blue
        playerOneNumber.text = "0"
        playerOneNumber.textColor = UIColor.systemBlue
        playerTwoNumber.text = "0"
        playerTwoNumber.textColor = UIColor.systemBlue
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor.green
        stopButton.setTitle("STOP", for: .normal)
        stopButton.setTitleColor(UIColor.white, for: .normal)
        stopButton.backgroundColor = UIColor.green
        playerOneId.text = "Player 1"
        playerOneId.textColor = UIColor.systemBlue
        playerOneScore.text = "0"
        playerOneScore.textColor = UIColor.systemBlue
        playerTwoId.text = "Player 2"
        playerTwoId.textColor = UIColor.systemBlue
        playerTwoScore.text = "0"
        playerTwoScore.textColor = UIColor.systemBlue
    }
    
    private func setupButton() {
        startButton.addTarget(self, action: #selector(startRandomize), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopRandomize), for: .touchUpInside)
        
    }
    
    
    @objc func startRandomize() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
        startButton.isEnabled = false
    }
    
    @objc func startTimer() {
        number1 = Int.random(in: 1...100)
        number2 = Int.random(in: 1...100)
        playerOneNumber.text = String(number1)
        playerTwoNumber.text = String(number2)
    }
    
    @objc func stopRandomize() {
        timer?.invalidate()
        timer = nil
        generateScore()
        startButton.isEnabled = true
    }
    
    func generateScore() {
        if number1 > number2 {
            score1 += 1
        } else if number1 < number2 {
            score2 += 1
        }
        playerOneScore.text = String(score1)
        playerTwoScore.text = String(score2)
    }
    
}

