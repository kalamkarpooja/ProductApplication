//
//  ViewController.swift
//  ProductLoginPage
//
//  Created by Mac on 21/06/35.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailFeild: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    func showAlertForEmpty()
    {
        let alert = UIAlertController(title: title, message: "Please Enter UserName and Password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            print("Tapped Dismiss")
        }))
     present(alert, animated: true)
    }
        
    func showAlertCheck()
        {
            let alertCheck = UIAlertController(title: title, message: "Enter Valid Information", preferredStyle: .alert)
            alertCheck.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
                print("Tapped Dismiss")
            }))
            present(alertCheck, animated: true)
        }
    func loginSuccessfully(){
        let alert = UIAlertController(title: title, message: "Login Successfully", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { action in
            print("tapped ok")
        }))
        present(alert, animated: true)
    }
    @IBAction func loginBtn(_ sender: Any) {
        let productVC = storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        
        if(self.emailFeild.text == "" || self.passwordField.text == "" ){
            showAlertForEmpty()
        }
        
        if(self.emailFeild.text != "9067761107" || self.passwordField.text != "pooja@123"){
            showAlertCheck()
        }
        navigationController?.pushViewController(productVC, animated: true)
        loginSuccessfully()
    }
    
}

