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
        //load events
        getEvents()
        sleep(2)
        loadEventsScreen()
    }
    
    func getEvents() {
        //get token
        connection.genTok{ (token) in
            print("Token is \(token)")
            //user requests in here with token
            self.clientlogged.getEventsInfo(token: token) { events in
//                print("EVENTS")
            }
        }
    }
    
    func loadEventsScreen() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let eventTableViewController = storyBoard.instantiateViewController(withIdentifier: "EventTableViewController") as! EventTableViewController
        eventTableViewController.client = clientlogged
        eventTableViewController.conn = connection
        self.navigationController?.pushViewController(eventTableViewController, animated: true)
        //        self.present(loggedInViewController, animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

//        self.navigationController?.navigationBar.backItem?.title = "Logout"
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
