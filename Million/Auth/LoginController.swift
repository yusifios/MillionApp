//
//  LoginController.swift
//  Million
//
//  Created by Yusıf Aqakerımov on 01.10.24.
//

import UIKit

class LoginController: UIViewController {
    
    var iconClick = false
    let imageicon = UIImageView()
    //var userData: UserData?
    
    @IBOutlet private weak var passtext: UITextField!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var continueLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mailText: UITextField!
    
    @IBOutlet weak var mailError: UILabel!
    @IBOutlet weak var passLAbel: UILabel!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var passError: UILabel!
    @IBOutlet weak var login: UIButton!
    @IBOutlet private weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()
        login.layer.cornerRadius = 10
        
        
    }
    
    private func setupGesture() {
        let iconImage = UIImage(named: "closeeye")
        imageicon.image = iconImage
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        imageicon.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageicon)
        
        contentView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        imageicon.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageicon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageicon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageicon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        
        passtext.rightView = contentView
        passtext.rightViewMode = .always
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageicon.isUserInteractionEnabled = true
        imageicon.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        if iconClick{
            iconClick = false
            tappedImage.image = UIImage(named: "closeeye")
            passtext.isSecureTextEntry = false
        }else{
            iconClick = true
            tappedImage.image = UIImage(named: "openeye")
            passtext.isSecureTextEntry = true
        }
        
    }
    
    @IBAction func login(_sender: Any){
        let controller = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MainController") as? MainController ?? MainController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction private func signUp(_sender: Any){
        
        let controller = UIStoryboard.init(name: "Auth", bundle: Bundle.main).instantiateViewController(withIdentifier: "ViewController") as? ViewController ?? ViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        navigationController?.isNavigationBarHidden = true
        print(#function, navigationController?.viewControllers.count ?? 0)
        controller.registerclicked = {[weak self] UserData in
            self?.mailText.text = UserData.username
            self?.passtext.text = UserData.password
        }
        
        /* if (navigationController?.viewControllers.count ?? 0) > 1 {
         navigationController?.viewControllers.removeFirst()
         }*/
        
    }
    
}
