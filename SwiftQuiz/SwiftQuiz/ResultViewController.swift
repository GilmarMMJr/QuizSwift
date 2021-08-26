//
//  ResultViewController.swift
//  SwiftQuiz
//
//  Created by Gilmar Junior on 20/08/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var answerdLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var totalCorrectAnswers: Int = 0
    var totalAnswers: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let score = totalCorrectAnswers*100/totalAnswers
        
        answerdLabel.text = "Perguntas respondidas: \(totalAnswers)"
        correctLabel.text = "Perguntas corretas: \(totalCorrectAnswers)"
        wrongLabel.text = "Perguntas erradas: \(totalAnswers - totalCorrectAnswers)"
        scoreLabel.text = "\(score)%"
        
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
    }
    

}
