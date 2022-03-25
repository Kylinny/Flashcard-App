//
//  CreationViewController.swift
//  Flashcard
//
//  Created by 姚君仪 on 3/13/22.
//

import UIKit

class CreationViewController: UIViewController {

    var flashcardController: ViewController!
    
    @IBOutlet weak var Question: UITextField!
    @IBOutlet weak var Answer: UITextField!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapOnCancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapOnDone(_ sender: Any) {
        
        let questionText = Question.text
        
        let answerText = Answer.text
        
        flashcardController.updateFlashcard(question: questionText!, answer: answerText!)
        
        dismiss(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
