//
//  ViewController.swift
//  Million
//
//  Created by Yusıf Aqakerımov on 28.09.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var mainimage: UIImageView!
    @IBOutlet weak var createLabel: UILabel!
    @IBOutlet weak var findLabel: UILabel!
    @IBOutlet weak var alreadyLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var nameError: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mailTxet: UITextField!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var passError: UILabel!
    @IBOutlet weak var signup: UIButton!
    
    @IBOutlet private weak var loginn: UIButton!
    
    var registerclicked: ((UserData)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            signup.layer.cornerRadius = 10
        nameText.delegate = self
        nameText.layer.borderWidth = 2
        nameText.layer.borderColor=UIColor.clear.cgColor
        
        passText.delegate = self
        passText.layer.borderWidth = 2
        passText.layer.borderColor=UIColor.clear.cgColor
        
        mailTxet.delegate=self
        mailTxet.layer.borderWidth = 2
        mailTxet.layer.borderColor=UIColor.clear.cgColor
        
        
        
    }
    @IBAction func Signup(_sender: Any){
        guard let username=nameText.text else {return}
        if username.count < 4{
            nameError.isHidden = false
        }
       
        guard let pass = passText.text else { return }
        if pass.count < 8{
            passError.isHidden = false
        }
        
        guard let email=mailTxet.text else {return}
        if !isValidEmail(email: email) {
            emailError.isHidden = false
            
        }
      
        
        if nameError.isHidden  && passError.isHidden  && emailError.isHidden {
            let newuser = UserData (username: username, password: pass, email: email)
           // registerclicked?(newuser)
            nameText.text = ""
            passText.text = ""
            mailTxet.text = ""
            print(newuser)
       
            
        registerclicked?(newuser)
        }
        
        navigationController?.popViewController(animated: true)
        
   }
    
    

}


func isValidEmail(email: String)-> Bool{
let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
return emailPred.evaluate(with: email)
}


extension ViewController: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
       
        nameText.layer.borderColor = UIColor.clear.cgColor
        passText.layer.borderColor = UIColor.clear.cgColor
        mailTxet.layer.borderColor = UIColor.clear.cgColor
      
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let name=nameText.text else{return}
        guard let pass=passText.text else{return}
      
        switch textField {
        case nameText:
            if name.isEmpty || name.count<4 {
                nameText.layer.borderColor = UIColor.red.cgColor
            }
            
            else{
                nameText.layer.borderColor = UIColor.green.cgColor
                nameError.isHidden = true
            }
            
        case passText:
            if pass.isEmpty || pass.count<8 {
                passText.layer.borderColor = UIColor.red.cgColor
            }
            
            else{
                passText.layer.borderColor = UIColor.green.cgColor
                passError.isHidden = true
            }
            
        case mailTxet:
            if let email = mailTxet.text{
                    if !isValidEmail(email: email) {
                        mailTxet.layer.borderColor = UIColor.red.cgColor
                    } else {
                        emailError.isHidden = true
                        mailTxet.layer.borderColor = UIColor.green.cgColor
                    }
                    
                }
            
            
        default: break
        }
        
    }
    
    @IBAction private func loginn(_sender: Any){
        
        let controller = UIStoryboard.init(name: "Auth", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginController") as? LoginController ?? LoginController()
        self.navigationController?.pushViewController(controller, animated: true)
        
        print(#function, navigationController?.viewControllers.count ?? 0)
        
           /*  if (navigationController?.viewControllers.count ?? 0) > 1 {
                 navigationController?.viewControllers.removeFirst()
             }*/
        }
    }


