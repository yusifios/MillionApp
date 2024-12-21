//
//  AuthController.swift
//  Million
//
//  Created by Yusıf Aqakerımov on 28.09.24.
//

import UIKit

class AuthController: UIViewController {
    @IBOutlet weak var authimage: UIImageView!
    
    @IBOutlet weak var getstarted: UIButton!
    @IBOutlet weak var codeimage: UIImageView!
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var designlabel: UILabel!
    @IBOutlet weak var weareLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getstarted.layer.cornerRadius = 10
        //getstarted.backgroundColor = UIColor(named: "#635E5E")
     
        
    }
    
    @IBAction func getStar(_sender: Any){
        /*let controller = UIStoryboard.init(name: "Auth", bundle: Bundle.main).instantiateViewController(withIdentifier: "LoginController") as? LoginController ?? LoginController()
        self.navigationController?.pushViewController(controller, animated: true)*/
        if let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate{
            scene.switchToLogin()
        }
    }
  

}
