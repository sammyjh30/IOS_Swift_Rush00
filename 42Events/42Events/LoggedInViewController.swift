//
//  LoggedInViewController.swift
//  rush00
//
//  Created by teo KELESTURA on 2019/10/12.
//  Copyright © 2019 teo KELESTURA. All rights reserved.
//

import UIKit

class LoggedInViewController: UIViewController {

//    IMAGES
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    var clientlogged:Client = Client()
    var username:String! = ""
    @IBOutlet var userLoginTextField: UILabel?
    //    TEXT_FIELD
    @IBOutlet weak var firstnameTextField: UILabel?
    @IBOutlet weak var lastnameTextField: UILabel?
    @IBOutlet weak var levelTextField: UILabel?
    
//    EVENTS_BUTTON
    @IBOutlet weak var eventsButton: UIButton!
    
    @IBAction func eventsButtonPress(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillDisappear(false)
        userLoginTextField?.text = clientlogged.userLogin
        firstnameTextField?.text = clientlogged.userFirstName
        lastnameTextField?.text = clientlogged.userLastName
    }
    
//    Shows Navbar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
