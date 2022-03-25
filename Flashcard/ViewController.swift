//
//  ViewController.swift
//  Flashcard
//
//  Created by 姚君仪 on 3/13/22.
//

import UIKit

struct FlashCard{
    var question: String
    var answer: String
}
class ViewController: UIViewController {

    @IBOutlet weak var BackLabel: UILabel!
    @IBOutlet weak var FrontLabel: UILabel!
    
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var flashcards = [FlashCard]()
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        readSavedFlashcards()
        
        if flashcards.count == 0{
            updateFlashcard(question: "Q: What's the capital of Brazil", answer: "A: Brasilia")
        }
        else{
            updateLabels()
            updateNextPrevButtons()
        }
    }

    @IBAction func didTapOnPrev(_ sender: Any) {
        currentIndex = currentIndex - 1
        
        updateLabels()
        
        updateNextPrevButtons()
    }
    
    @IBAction func didTapOnNext(_ sender: Any) {
        currentIndex = currentIndex + 1
        updateLabels()
        
        updateNextPrevButtons()
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
        let FlashCard = FlashCard(question: question, answer: answer)
        flashcards.append(FlashCard)
        
        print("Added new flashcard")
        print("We now have \(flashcards.count) flashcards")
        currentIndex = flashcards.count - 1
        print("Our current index is \(currentIndex)")
        
        updateNextPrevButtons()
        
        updateLabels()
        
        saveAllFlashcardsToDisk()
    }
    
    func updateNextPrevButtons(){
        if currentIndex == flashcards.count - 1{
            nextButton.isEnabled = false
        }
        else{
            nextButton.isEnabled = true
        }
        
        if currentIndex == 0{
            prevButton.isEnabled = false
        }
        else{
            prevButton.isEnabled = true
        }
    }
    func saveAllFlashcardsToDisk(){
        let dictionaryArray = flashcards.map { (card) -> [String: String] in
            return ["question": card.question, "answer": card.answer]
        }
        UserDefaults.standard.set(dictionaryArray, forKey: "flashcards")
        
        print("Flashcards saved to UserDefaults")
    }
    
    func updateLabels(){
        let currentFlashCard = flashcards[currentIndex]
        
        FrontLabel.text = currentFlashCard.question
        BackLabel.text = currentFlashCard.answer
        
    }
    
    func readSavedFlashcards(){
        if let dictionaryArray = UserDefaults.standard.array(forKey: "flashcards") as? [[String: String]]{
            let savedCards = dictionaryArray.map{dictionary -> FlashCard in
                return FlashCard(question: dictionary["question"]!, answer: dictionary["answer"]!)
            }
            
            flashcards.append(contentsOf: savedCards)
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let navigationController = segue.destination as! UINavigationController
        
        let creationController = navigationController.topViewController as! CreationViewController
        
        creationController.flashcardController = self
        
}
}

