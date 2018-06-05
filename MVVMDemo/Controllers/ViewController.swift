//
//  ViewController.swift
//  MVVMDemo
//
//  Created by MOMO on 6/5/18.
//  Copyright © 2018 MorniKSA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var resultLbl: UILabel!
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    
    private var userViewModel: UserViewModel!{
        didSet{
            userViewModel.dynamicUsername().bind { [unowned self] in
                self.usernameLbl.text = "Username: " + $0
            }
            userViewModel.dynamicPassword().bind { [unowned self] in
                self.passwordLbl.text = "Password: " + $0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTxt.delegate = self
        passwordTxt.delegate = self
        userViewModel = UserViewModel()
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        userViewModel.login().bind { [unowned self] in
            self.resultLbl.text = $0
        }
    }
    
}

extension ViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if textField == usernameTxt{
            userViewModel.setUsername(username: newString)
            print(userViewModel.username)
        }else{
            userViewModel.setPassword(password: newString)
        }
        
        return true
    }
}

