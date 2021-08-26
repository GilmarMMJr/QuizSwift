//
//  QuizViewController.swift
//  SwiftQuiz
//
//  Created by Gilmar Junior on 20/08/21.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var timerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersButton: [UIButton]!
    
    var quizManager = QuizManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        quizManager = QuizManager()
    
        timerView.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear) {
            self.timerView.frame.size.width = 0
        } completion: { success in
            self.showResults()
        }
        
        getNewQuiz()

    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        questionLabel.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = answersButton[i]
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    
    @IBAction func answerSelect(_ sender: UIButton) {
        let index = answersButton.firstIndex(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
    
    
    

}
