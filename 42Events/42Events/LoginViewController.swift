//
//  LoginViewController.swift
//  rush00
//
//  Created by teo KELESTURA on 2019/10/12.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class AlertHelper {
//    ALERT_MESSAGE
    func showAlert(fromController controller: UIViewController) {
        let alert = UIAlertController(title: "Error", message: "Invalid Login or Password.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}

class LoginViewController: UIViewController {

//    IMAGES
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var logoImage: UIImageView!
    
//    STACKVIEW
    @IBOutlet weak var stackView: UIStackView!
    
//    TEXT_FIELD
    @IBOutlet fileprivate var usernameTextField: UITextField!
    @IBOutlet fileprivate var passwdTextField: UITextField!
    
//    LOGIN_BUTTON
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginButtonPress(_ sender: Any) {
//        https://CeckUserHere
        let loadicon = loadingIconStart()
        if usernameTextField.text! != "" && passwdTextField.text! != "" {
            //BEGIN LOGIN PROCESS
            loginUser(input: usernameTextField.text!)
            loadLoggedInScreen()
            loadingIconStop(activityIndicator: loadicon)

        }
        else {
            let alert = AlertHelper()
            alert.showAlert(fromController: self)
            loadingIconStop(activityIndicator: loadicon)
        }
    }
    
//LOGIN USER, GET TOKEN, GET USER DATA
    func loginUser(input: String) {
        if input == "" {
            print("No username entered")
            return
        }
        else {
           print("User is \(input)")
        }
        
        let client = Client()
        //get token
        client.genTok{ (token) in
            print("Token is \(token)")
            //user requests in here with token
            client.getUserInfo(token: token, username: "\(input)") { firstName,lastName,login,photo,cursusNames,cursusLevels  in
                print("User found with Firstname: \(firstName), Lastname: \(lastName), Login: \(login) Photo: \(photo)")
            }
        }
    }
    
//    View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameTextField.text = ""
        passwdTextField.text = ""

//        if UIDevice.current.orientation.isLandscape {}
    }
    
//    Hides Navbar
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
//    Loads Icon
    func loadingIconStart () -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityIndicator.color = UIColor.white
        activityIndicator.center = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2)
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
//    Stops Icon Load
    func loadingIconStop(activityIndicator: UIActivityIndicatorView) {
        activityIndicator.stopAnimating()
    }
    
//    Loads Logged In Screen
    func loadLoggedInScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "LoggedInViewController") as! LoggedInViewController
        self.navigationController?.pushViewController(loggedInViewController, animated: true)
//        self.present(loggedInViewController, animated: true, completion: nil)
    }
}
