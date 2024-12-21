//
//  MainController.swift
//  Million
//
//  Created by Yusıf Aqakerımov on 05.10.24.
//

import UIKit

class MainController: UIViewController {
    
    @IBOutlet weak var quizkhelo: UILabel!
    @IBOutlet weak var entername: UITextField!
    @IBOutlet weak var start: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        quizkhelo.layer.masksToBounds = true
        quizkhelo.layer.cornerRadius = 55
        entername.layer.masksToBounds = true
        entername.layer.cornerRadius = 20
        start.layer.cornerRadius = 20
  
        
    }
    @IBAction func stArt(_sender: Any){
              let controller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "QuizController") as? QuizController ?? QuizController()
              self.navigationController?.pushViewController(controller, animated: true)
          }
    
}

    

