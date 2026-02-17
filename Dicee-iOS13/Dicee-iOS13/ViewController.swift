//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImgView1: UIImageView!
    @IBOutlet weak var diceImgView2: UIImageView!
    
    let diceFaces = [
        "DiceOne", "DiceTwo", "DiceThree",
        "DiceFour", "DiceFive", "DiceSix"
    ]

    @IBAction func rollBtnPressed(_ sender: UIButton) {
        diceImgView1.image = getRandomDiceFace()
        diceImgView2.image = getRandomDiceFace()
    }
    
    func getRandomDiceFace() -> UIImage {
        // Replaced Int.random(in: 0...5) with arrays' method
        return UIImage(
            named: diceFaces.randomElement()!
        )!
    }
}

