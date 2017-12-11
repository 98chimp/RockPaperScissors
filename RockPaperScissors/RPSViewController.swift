//
//  RPSViewController.swift
//  RockPaperScissors
//
//  Created by Shahin on 2017-12-06.
//  Copyright © 2017 98Chimp. All rights reserved.
//

import UIKit

class RPSViewController: UIViewController
{
    @IBOutlet weak var outcomeLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        outcomeLabel.text = "You feelin' lucky?\n\nLet's see how lucky you really are!"
    }
    
    @IBAction func scissorsButtonTapped(_ sender: UIButton)
    {
        compareiPhoneSign(with: "✌️")
    }
    
    @IBAction func rockButtonTapped(_ sender: UIButton)
    {
        compareiPhoneSign(with: "👊")
    }
    
    @IBAction func paperButtonTapped(_ sender: UIButton)
    {
        compareiPhoneSign(with: "✋")
    }
    
    func generateRandomSymbol() -> String
    {
        // Generate a random number
        let randomNumber = arc4random_uniform(3)
        
        // Create a new empty string variable to hold the computer's sign
        var computerSign = ""
        
        // Set the computer sign to one of the three emojis
        if (randomNumber == 0)
        {
            computerSign = "✋"
        }
        else if (randomNumber == 1)
        {
            computerSign = "👊"
        }
        else if (randomNumber == 2)
        {
            computerSign = "✌️"
        }
        
        return computerSign
    }
    
    func compareiPhoneSign(with mySign: String)
    {
        let iPhoneSign = generateRandomSymbol()
        var outcome = ""
        
        if iPhoneSign == mySign
        {
            outcome = "It's a 👔"
        }
            /*
             if iphone has rock AND (&&) i have scissors OR (||) iphone has paper AND I have rock OR iphone has scissors AND I have paper
             */
        else if (iPhoneSign == "👊" && mySign == "✌️") || (iPhoneSign == "✋" && mySign == "👊") || (iPhoneSign == "✌️" && mySign == "✋")
        {
            outcome = "You lost... iPhone won!"
            
        }
            /*
             if iphone has scissors AND (&&) i have rock OR (||) iphone has paper AND I have scissors OR iphone has rock AND I have paper
             */
        else if (iPhoneSign == "✌️" && mySign == "👊") || (iPhoneSign == "✋" && mySign == "✌️") || (iPhoneSign == "👊" && mySign == "✋")
        {
            outcome = "You WON... iPhone lost!"
        }
        
        outcomeLabel.text = "You: " + mySign + "\n\niPhone: " + iPhoneSign + "\n\n" + outcome
    }
}
