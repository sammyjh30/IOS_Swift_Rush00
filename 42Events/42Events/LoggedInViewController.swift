//
//  LoggedInViewController.swift
//  42Events
//
//  Created by Samantha HILLEBRAND on 2019/10/13.
//  Copyright © 2019 Rush00Team. All rights reserved.
//

import UIKit

class LoggedInViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //    IMAGES
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    //    TEXT_FIELD
    @IBOutlet weak var firstnameTextField: UILabel!
    @IBOutlet weak var lastnameTextField: UILabel!
    @IBOutlet weak var levelTextField: UILabel!
    
    //    EVENTS_BUTTON
    @IBOutlet weak var eventsButton: UIButton!
    
    //    CURSUS TABLE
    @IBOutlet weak var cursusTableView: UITableView!
    var testCursus: [String] = ["Algos" ,"Graphics", "Unity", "Web", "Cloud"]
    var testCursusLevel: [Double] = [0.99 ,0.50, 0.00, 0.01, 0.23]
    //a list to store DataModel
    var dataModels = [DataModel]()
    
    @IBAction func eventsButtonPress(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillDisappear(false)
        
        for i in 0..<5{
            
            self.dataModels.append(DataModel(cursusLabel: testCursus[i], cursusBarValue: testCursusLevel[i]))
            //displaying data in tableview
            self.cursusTableView.reloadData()
            
        }
    }
    
    //    Shows Navbar
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    //the method returning size of the list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataModels.count
    }
    
    //the method returning each cell of the list
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CursusTableViewCell
        
        //getting the hero for the specified position
        let model: DataModel
        
        model = dataModels [indexPath.row]
        
        //displaying values
        cell.cursusLabel.text = model.cursusLabel
        cell.cursusBar.progress = Float(Double(model.cursusBarValue ?? 0.50))
        
        return cell
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

class DataModel {
    
    var cursusLabel: String?
    var cursusBarValue: Double?
    
    init(cursusLabel: String?, cursusBarValue: Double?) {
        self.cursusLabel = cursusLabel
        self.cursusBarValue = cursusBarValue
    }
}
