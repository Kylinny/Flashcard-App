//
//  ViewController.swift
//  Flashcard
//
//  Created by 姚君仪 on 3/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BackLabel: UILabel!
    @IBOutlet weak var FrontLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOnFlashcard(_ sender: Any) {
        if(FrontLabel.isHidden == false){
            FrontLabel.isHidden = true
    }
        else{
            FrontLabel.isHidden = false
        }
    
}
    func updateFlashcard(question: String, answer: String) {
        BackLabel.text = answer
        FrontLabel.text = question
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardController = self
        
}
}

