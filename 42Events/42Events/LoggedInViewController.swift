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
    var connection:APIConnection = APIConnection()
    @IBOutlet weak var userLoginTextLabel: UILabel!
    
    //    TEXT_FIELD
    @IBOutlet weak var firstnameTextLabel: UILabel!
    @IBOutlet weak var lastnameTextLabel: UILabel!
    @IBOutlet weak var levelTextLabel: UILabel!

    

//    EVENTS_BUTTON
    @IBOutlet weak var eventButton: UIButton!
    @IBAction func eventsButtonPress(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationItem.leftBarButtonItem?.title = "Logout"
        viewWillDisappear(false)
        userLoginTextLabel?.text = clientlogged.userLogin
        firstnameTextLabel?.text = clientlogged.userFirstName
        lastnameTextLabel?.text = clientlogged.userLastName
    }

//    Shows Navbar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
